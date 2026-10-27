Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96F7606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pjDfTUcg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sw/xbi18
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8974B80DCB;
	Tue, 27 Oct 2026 19:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RsgFCw3Cs-F; Tue, 27 Oct 2026 19:09:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E88580CF8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793128186;
	b=dyCrF2EvLXFiHL/nn2lBBv5uuV3S3FmcvhIltlSddXrW1QfBhi4mrSOMqw6kcCsboJRO
	 XJevb3pxNP8PHiyT1v6prHSwUGBnY8orqC+T9NxEOTDSjM4CQ1K6/8TB9yWDKcAZwO/PA
	 vz1ejI1w1CYObWdV/Jqy9E9dh33xIUtIG9kOYjyDDiUrd+Yi+uXnv1QYfUPr90kVzXgSN
	 IUiHzqqkdc+0Go8XwvMHTwZjIQiL8F8+PmZbC5ynwJBDEaozwEPQBBNl6WDtob/MNLFdD
	 I51Xolpm83AhxEYUagEaUI8Z1tIiEVmKKNnvhg4tXWmTyYHRCfLwYp+bBQH6LwrXqTQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793128186;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=C8HGQOH6auBkja0BuDwUsn8J23kha2b/CLDcdSaVx1U=;
	b=SFGhFN+hle5dyYzpf9+wpAHCuLjr1fkNHn5220AKHQXCa1a3F+LFOrVtNiwpoa49+bw+
	 nPWDZ9ZNe2hR99fZW83DMOQA6QRaDJotJZvRGS/F5lagO+BDhvGVn4ulB85lOjsWvleEO
	 Y/lpT5Y2gcP7KNcGWuro/9dkkT/GoZXVl6ZoXB7xVjtn+2uN2UpnaO/wkMuO65VmQL6pC
	 CQ/aouuC5hUO4FmNlnPBJZu+qKYowspFvpvmtOYH8GpkZHm46/Fy2IWaCADFxOUfEp34y
	 k2eqKesyZW5/lLPzmlh7ELLMd7pM219baU/cjPAVLrNHC/b0262zg8ItTirxXPaLkWg==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sw/xbi18";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793128186;
	bh=C8HGQOH6auBkja0BuDwUsn8J23kha2b/CLDcdSaVx1U=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pjDfTUcgEif4hgVRvkO+e4t+EEqwFuJwyvcw6yG+ryNK/KLby50RIv5eYviA1HnL9
	 3zu1+QxfTMT972uuuR90UG2gUHpUg9EMo8pcNMHSc8SndCAU0dGPIQavOJIJA3pn8f
	 lxohFH63UP0tO58Br3jYkzWSG1MEX1PFqjBz+Nhjp1Wlc29I36vSmWiWwDzZSThTNB
	 +8+oh94NX4wdhWbwM5nNz59idN703Gr4R6BWlzt38T42f1htpGZNJRK0Y/arviAdne
	 89kbu2TFBZMekiaQQ5RmxMoPbjYdT/lTQvPy5H66KM/y7ieYY4TF8DpZ7Qmdvyt3PD
	 kaZNBJ0+lXO2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E88580CF8;
	Tue, 27 Oct 2026 19:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5E6D279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6FB480CF8
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ggbq034z9Y-x for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 19:09:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EEE7580CEC
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::e2d"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793128184;
 b=l4GaSAbBAZ8NDPfKUOvygoX93CNqmiiJAvFvnuEAFy5QA6s5uGT+fGGQRGG4Qg5l9ZhM
 wI3YJk7c/Hvj1Hn8Jw9quFUHaWYDhFxTgL3UayM+eMu56VkCLBiE/d9+RLb8mddYJnw1o
 oehV+DEDbN/ewATaSuCb6ZW2wAJDcPGb9pu7m2Y7dO5fpfGVN+NgqsxSN0o7u287iN/WY
 FjY/2bycr2xa/daYrN8BlzdqdE0JAoO3aIOE+7ViVJ8fSIrbDO4jjQQfGR14EjVImAfBA
 Enj9PJX35+UmIcucqKGH5h2nHCxN97G38/91ao+gMurHf2CO3sh+eIx69LtQ1PHbngA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793128184;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=7+dEgMm8wy8OR/8EkFk9nuDe96xu4lyikIPnEEN1234=;
 b=Cx0EDIZJMfU9QM+NvLHMz9wTWSr6hEMqTl5GRxd6XSagpGKTaJLerfMYYRo4SmYCHoaP
 YfgutX4et/w5uKy7+YSMmmoZKWJATdD9L5HtEdIJTT38vNu0YR9bXWei+9c9E4HULhL+S
 +Cg56zl9wO+GVURQbIut8fJ/ZtEeFh4mTTPTmqPSJnMwAAPSqoSE5GcDksIlB/xisTZSE
 DUSsbYHNG1+DPYU8Bty1py0oNcx1C74Y6P/CBd5F59CprFEP1k7yOJzyWmjI/y0BHiDzM
 /hv0ORueqxHMfWaNM7bFie7wzBGphFE8Ww7wuSZkPfR/LOpkoPRW6G2oFaGEnJWkGGw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b="sw/xbi18"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::e2d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=sw/xbi18
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEE7580CEC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 19:09:43 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-7cc2bb73cd9so51867137.3
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 12:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793128182; cv=none;
 d=google.com; s=arc-20260327;
 b=YwwEmeJa9RS5PVTZ4nceXhu0qqRoLcToqYA0KQ/Cu9+OCSxMCI05dKIk8oKxkl94OB
 93shQkCN466ejtAK+hyhQZOXbdNVlSWpRDOpUgFErz5d1+BGQ93NTIeI/yRBIJ8FRvXY
 /1pJFxZHaN9f6u1ai7n4yIl4loV2ZXJszw8y/EnPIdZ0/4LdR7jonCFh3j51WB4fPciT
 fEOI4cGbqWsPfJg80cJvY0rBWymXCk6mBtpHGvP4T9M+pbscv2tLo7mhRjHmhh8wtldd
 S1MzgIKF4kTmpaaHd9b/gE77yKP7tLJz5AHihp3vsWRMlu6r/25qgsmnc6/BPweRilrV
 nhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7+dEgMm8wy8OR/8EkFk9nuDe96xu4lyikIPnEEN1234=;
 fh=ZHN4ga71EmAzkyc8EtCbudUWuJZc+EAUCxBSWmgndtY=;
 b=YMd5Ug3CZOz5xyHFMsrOspVFevBqA0DnTGmHcU8lr60XTUl4X2XkKtFC00sfEpzOyT
 UpsbazO2xc9a6ZkV0ynZZ2eqIBc0VGHiJF8FKqUQMD7ql9kH4WNpGPM2ypHzocfLSvI3
 E3PsfqkMh5ujPSiVmK4TMALqBikFG6ZC/afgYoqNBPk2MSg72lpFSEwuWb0lcsM9/aJQ
 f6fwL86mr7locwWKw5wkFUH24HNBlf4bpI9OwDRABfb1VuB9mAZ5TEY0jFrpQFbH47DG
 BiKBqlGOe9Cu2D3zQMriicNZve3nN48Y0zB5O6xbbBsZwdBbbr/UHVFI3hzXQjVAmAa7
 aIAw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793128182; x=1793732982; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7+dEgMm8wy8OR/8EkFk9nuDe96xu4lyikIPnEEN1234=;
 b=sw/xbi18gWTeGQ+ytGj4PZ5k7y5AZVHbMSi0spTrJD+DPkwH4RjN5n0h4y61qnfdFm
 ZHw7LYOHsuwGQqzhc/yqDwU6cHmM/6bHfScCSadtr4A2rMwHyWigbF/MkCWfh2lGMDth
 8JOwpDi35OhgkwtUxecKJzE2p+IQksNXJUu890ujsD3DIJt89jpFa5e552xyu3+vQWsM
 KtsoFepWp9T+cGXV8RJDR06UPF06dVmDeC1fHNCu51mZijF38yi4Yfpw98KHyaO1hN4i
 xgdek5YWuoQKl9gT1tZ7ND5fzCVzafalLmhfgdKiaUAkVzbwH8eGYhxqpy6D54SZLyHG
 4b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793128182; x=1793732982;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7+dEgMm8wy8OR/8EkFk9nuDe96xu4lyikIPnEEN1234=;
 b=T/sHQL0SZH8XeLEC+2e9t5W2at6tzR+p5+O+yS6HbOeK30uYY892H7aWlbL1mYoKVg
 xCWNtHFuScw+IKAD2ANPFZNuH+1K2hcVCIJIPtA2KYcikl3T0836a2P5eP/uIe3CErTC
 4qXDfsn5bYtq/HD/lhFEWJvkmzuNbk66ZFdueueUhW2tZ9RzqkbcSQ4+4QLgwJ11mNII
 FsfUNfUK4SAe0hi8KsaEtvk33XuU6Ngsj4xgFtdqjC1/vCZYydiqvHL2bdaHmpYwvGqb
 nSIpw9iyt2vrK/hG/tm9pLVwSwhxEetDA8No6cmKOu9VYzYvi5MPjNxSa8O9IjLFAYci
 IIeQ==
X-Gm-Message-State: AFq9FYLne8xHkchaHwJVdXDo18YvXjxlDzAeXI0oNfrtTy+8NqlxlL+T
 lAncGIsu2soj3S/kjyQ91/xCybp2uPvot+4+PrRa/PzQ22BK+kf+MV6S5fCLz9XZEydEKFk6Q7W
 lVJ9xXuSLCaxMb5CFXePguuj4EFrhu5I1+ZzY5Mg=
X-Gm-Gg: AYBFou2Z2esTUmlcRCNhpiT4TCH/IlBnXdnkxJZpe+fFjezG/V+bVlTSvwQIDPpVOyJ
 +J4RF1hFxTzGhK4BnFT1mvMnkyKfNXT+NfpbcDW3fk6QnPzSipLH6svSyVfu/H0N82ZtkOqDrka
 9RgJsyVTIkQF3VjS8TboQl4ULcm3ByUkb4q/0Y9tvnTXnsU8PgtpKvBR3RfvQSTMLCS6iKeXwDk
 RRltG9w+3uvfqDYC9aQi5DoDpnS3oEsBdSm52UlkNtB73LD61aRar4SmCZnlINwruhgAKpJrvoz
 SafljFKT1q/R7Ob/h6BfOMbO5tF+1E+vNJz7GEcr2DRCnwKwWqn28YOpwpq6jTzXQL+b2XwPCAZ
 h6F4m88T2HqAwTUGbwwdh3X41xp424gCUAYKlzZ02i8RIMx1azS6avoJmWmVGIgO/2dGPENHaQW
 cMVTj+HnkYYx5t/UaDWvSkKwmM9AHOd68cbmbXeqfQCJbGcEvlDwK/s1ftcV1eMnkUh10GGV2jq
 YZNlKeq9701G8htZhHfc46QwhDh5DV2no1QQ8uZzvkq+TTGnqw=
X-Received: by 2002:a05:6102:5123:b0:7a6:85d6:8ae0 with SMTP id
 ada2fe7eead31-7d03a289c2dmr125171137.1.1793128181963; Tue, 27 Oct 2026
 12:09:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260218062831.545089-1-james.hilliard1@gmail.com>
In-Reply-To: <20260218062831.545089-1-james.hilliard1@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 13:09:31 -0600
X-Gm-Features: AclHuK8tL54UHPKFbk7yL84qXqDrnrMGg4hVKnQr4nXX5QT3vyu2IAtld1TjJtk
Message-ID: <CADvTj4rU47ebM3_TzN3ReCc5ypZqnBpKC+K3oKfjEG=YPX87rw@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH 1/1] package/lua: link liblua.so with $(LIBS)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBGZWIgMTcsIDIwMjYgYXQgMTE6MjjigK9QTSBKYW1lcyBIaWxsaWFyZAo8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgc2hhcmVkIGxpYmx1YS5zbyBydWxl
IG9taXR0ZWQgJChMSUJTKSwgc28gZGlyZWN0IGRlcHMgbGlrZQo+IC1sbSB3ZXJlIG5vdCByZWNv
cmRlZC4KPgo+IEZpeGVzOgo+IFJlbGluayBgL2xpYjY0L2xpYmx1YS5zby41LjQuOCcgd2l0aCBg
L2xpYjY0L2xpYm0uc28uNicgZm9yIElGVU5DIHN5bWJvbCBgc2luJwoKVGhpcyB3YXMgYSBydW50
aW1lIGZhaWx1cmUsIG5vdCBhbiBhdXRvYnVpbGRlciBmYWlsdXJlLiBJIGhpdCBpdApzdGFydGlu
ZyBXZXN0b24gb24gYW4geDg2LTY0IHN5c3RlbSB3aXRoIGdsaWJjIDIuNDIsIHNob3J0bHkgYmVm
b3JlCnNlbmRpbmcgdGhlIHBhdGNoOgoKL2Jpbi93ZXN0b246IFJlbGluayBgL2xpYjY0L2xpYmx1
YS5zby41LjQuOCcgd2l0aApgL2xpYjY0L2xpYm0uc28uNicgZm9yIElGVU5DIHN5bWJvbCBgc2lu
JwoKV2VzdG9uIGxvYWRzIGxpYmlucHV0LCB3aGljaCBwdWxscyBpbiBMdWEuIEVMRiBpbnNwZWN0
aW9uIHNob3dlZCB0aGF0CmxpYmx1YS5zbyByZWZlcmVuY2VkIG1hdGggZnVuY3Rpb25zIGJ1dCBo
YWQgbm8gRFRfTkVFREVEIGVudHJ5IGZvcgpsaWJtLnNvLjYuIFRoaXMgYWxsb3dlZCBnbGliYyB0
byByZXNvbHZlIGFuIElGVU5DIGJlZm9yZSBsaWJtIGhhZCBiZWVuCnJlbG9jYXRlZCwgcmVzdWx0
aW5nIGluIGEgc2VnbWVudGF0aW9uIGZhdWx0IGR1cmluZyBzdGFydHVwLgoKVGhlIHJlY2VudCB0
cmlnZ2VyIGlzIGNlODIzYTBmNWI0YyAoInBhY2thZ2UvbGliaW5wdXQ6IGJ1bXAgdmVyc2lvbiB0
bwoxLjMwLjEiKSwgd2hpY2ggZW5hYmxlZCBMdWEgc3VwcG9ydCB3aGVuIEx1YSA1LjQgaXMgc2Vs
ZWN0ZWQuIFRoZQppbmNvcnJlY3QgTHVhIGxpbmsgcnVsZSBwcmVkYXRlcyB0aGF0IGNoYW5nZS4K
CkkgaGF2ZSBzaW5jZSByZXByb2R1Y2VkIHRoaXMgaW5kZXBlbmRlbnRseSB3aXRoIEJ1aWxkcm9v
dCAyMDI2LjAyLAp1c2luZyB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyYXRpb246CgpCUjJfeDg2XzY0
PXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJ
Tj15CkJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfR0xJQkNfQkxFRURJTkdf
RURHRT15CkJSMl9TSEFSRURfTElCUz15CkJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFN
SUNfRVVERVY9eQojIEJSMl9QQUNLQUdFX0VVREVWX01PRFVMRV9MT0FESU5HIGlzIG5vdCBzZXQK
IyBCUjJfUEFDS0FHRV9FVURFVl9FTkFCTEVfSFdEQiBpcyBub3Qgc2V0CkJSMl9QQUNLQUdFX0xV
QT15CkJSMl9QQUNLQUdFX0xVQV81XzQ9eQpCUjJfUEFDS0FHRV9MSUJJTlBVVD15CgpBZnRlciBi
dWlsZGluZyB3aXRoIG1ha2UgbGliaW5wdXQsIHRoaXMgcmVwcm9kdWNlcyB0aGUgZmFpbHVyZSBv
bgphbiB4ODYtNjQgaG9zdCB1c2luZyB0aGUgdGFyZ2V0J3MgbG9hZGVyIGFuZCBsaWJyYXJpZXM6
CgpUPSIkUFdEL291dHB1dC90YXJnZXQiCiIkVC9saWIvbGQtbGludXgteDg2LTY0LnNvLjIiIFwK
ICAgIC0tbGlicmFyeS1wYXRoICIkVC91c3IvbGliOiRUL2xpYiIgXAogICAgIiRUL3Vzci9saWJl
eGVjL2xpYmlucHV0L2xpYmlucHV0LWxpc3QtZGV2aWNlcyIgLS1oZWxwCgpUaGlzIHJlcHJvZHVj
ZXIgcmVwb3J0cyBjZWlsIHJhdGhlciB0aGFuIHNpbi4gTGliaW5wdXQgMS4yOS4wCndvcmtzLCB3
aGlsZSAxLjMwLjEgYW5kIDEuMzEuMCBjcmFzaCB3aXRoIHRoZSB1bmZpeGVkIEx1YSBsaWJyYXJ5
LgpBZGRpbmcgJChMSUJTKSByZWNvcmRzIHRoZSBtaXNzaW5nIGxpYm0gZGVwZW5kZW5jeSBhbmQg
bWFrZXMgdGhlCnNhbWUgZXhlY3V0YWJsZXMgd29yayB3aXRob3V0IHJlYnVpbGRpbmcgbGliaW5w
dXQuCgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBn
bWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvbHVhLzUuMS41LzAwMDItc2hhcmVkLWxpYnMtZm9y
LWx1YS5wYXRjaCB8IDIgKy0KPiAgcGFja2FnZS9sdWEvNS4zLjYvMDAwMi1zaGFyZWQtbGlicy1m
b3ItbHVhLnBhdGNoIHwgMiArLQo+ICBwYWNrYWdlL2x1YS81LjQuOC8wMDAyLXNoYXJlZC1saWJz
LWZvci1sdWEucGF0Y2ggfCAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhLzUuMS41LzAwMDIt
c2hhcmVkLWxpYnMtZm9yLWx1YS5wYXRjaCBiL3BhY2thZ2UvbHVhLzUuMS41LzAwMDItc2hhcmVk
LWxpYnMtZm9yLWx1YS5wYXRjaAo+IGluZGV4IDVhZTA3NTZjNGMuLjBlYzZkOTczOTEgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9sdWEvNS4xLjUvMDAwMi1zaGFyZWQtbGlicy1mb3ItbHVhLnBhdGNo
Cj4gKysrIGIvcGFja2FnZS9sdWEvNS4xLjUvMDAwMi1zaGFyZWQtbGlicy1mb3ItbHVhLnBhdGNo
Cj4gQEAgLTY0LDcgKzY0LDcgQEAgSW5kZXg6IGIvc3JjL01ha2VmaWxlCj4gICAgICAgICAkKFJB
TkxJQikgJEAKPgo+ICArJChMVUFfU08pOiAkKENPUkVfTykgJChMSUJfTykKPiAtKyAgICAgICQo
Q0MpIC1vICRALiQoUEtHX1ZFUlNJT04pIC1zaGFyZWQgLVdsLC1zb25hbWU9IiRALiQoUEtHX1ZF
UlNJT04pIiAkPwo+ICsrICAgICAgJChDQykgLW8gJEAuJChQS0dfVkVSU0lPTikgLXNoYXJlZCAt
V2wsLXNvbmFtZT0iJEAuJChQS0dfVkVSU0lPTikiICQ/ICQoTElCUykKPiAgKyAgICAgIGxuIC1m
cyAkQC4kKFBLR19WRVJTSU9OKSAkQAo+ICArCj4gICtpZm5lcSAoZHluYW1pYywkKEJVSUxETU9E
RSkpCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhLzUuMy42LzAwMDItc2hhcmVkLWxpYnMtZm9y
LWx1YS5wYXRjaCBiL3BhY2thZ2UvbHVhLzUuMy42LzAwMDItc2hhcmVkLWxpYnMtZm9yLWx1YS5w
YXRjaAo+IGluZGV4IDA4MjEwMDc0NzQuLjZjM2VmYzBhMzcgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9sdWEvNS4zLjYvMDAwMi1zaGFyZWQtbGlicy1mb3ItbHVhLnBhdGNoCj4gKysrIGIvcGFja2Fn
ZS9sdWEvNS4zLjYvMDAwMi1zaGFyZWQtbGlicy1mb3ItbHVhLnBhdGNoCj4gQEAgLTY0LDcgKzY0
LDcgQEAgSW5kZXg6IGIvc3JjL01ha2VmaWxlCj4gICAgICAgICAkKFJBTkxJQikgJEAKPgo+ICAr
JChMVUFfU08pOiAkKENPUkVfTykgJChMSUJfTykKPiAtKyAgICAgICQoQ0MpIC1vICRALiQoUEtH
X1ZFUlNJT04pIC1zaGFyZWQgLVdsLC1zb25hbWU9IiRALiQoUEtHX1ZFUlNJT04pIiAkPwo+ICsr
ICAgICAgJChDQykgLW8gJEAuJChQS0dfVkVSU0lPTikgLXNoYXJlZCAtV2wsLXNvbmFtZT0iJEAu
JChQS0dfVkVSU0lPTikiICQ/ICQoTElCUykKPiAgKyAgICAgIGxuIC1mcyAkQC4kKFBLR19WRVJT
SU9OKSAkQAo+ICArCj4gICtpZm5lcSAoZHluYW1pYywkKEJVSUxETU9ERSkpCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbHVhLzUuNC44LzAwMDItc2hhcmVkLWxpYnMtZm9yLWx1YS5wYXRjaCBiL3Bh
Y2thZ2UvbHVhLzUuNC44LzAwMDItc2hhcmVkLWxpYnMtZm9yLWx1YS5wYXRjaAo+IGluZGV4IDYx
MTU5NjA5NTYuLmQ1ODNiMTcxOTMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sdWEvNS40LjgvMDAw
Mi1zaGFyZWQtbGlicy1mb3ItbHVhLnBhdGNoCj4gKysrIGIvcGFja2FnZS9sdWEvNS40LjgvMDAw
Mi1zaGFyZWQtbGlicy1mb3ItbHVhLnBhdGNoCj4gQEAgLTY0LDcgKzY0LDcgQEAgSW5kZXg6IGIv
c3JjL01ha2VmaWxlCj4gICAgICAgICAkKFJBTkxJQikgJEAKPgo+ICArJChMVUFfU08pOiAkKENP
UkVfTykgJChMSUJfTykKPiAtKyAgICAgICQoQ0MpIC1vICRALiQoUEtHX1ZFUlNJT04pIC1zaGFy
ZWQgLVdsLC1zb25hbWU9IiRALiQoUEtHX1ZFUlNJT04pIiAkPwo+ICsrICAgICAgJChDQykgLW8g
JEAuJChQS0dfVkVSU0lPTikgLXNoYXJlZCAtV2wsLXNvbmFtZT0iJEAuJChQS0dfVkVSU0lPTiki
ICQ/ICQoTElCUykKPiAgKyAgICAgIGxuIC1mcyAkQC4kKFBLR19WRVJTSU9OKSAkQAo+ICArCj4g
ICtpZm5lcSAoZHluYW1pYywkKEJVSUxETU9ERSkpCj4gLS0KPiAyLjQzLjAKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
