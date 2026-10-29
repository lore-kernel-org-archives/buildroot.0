Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F578606A322
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mMRERM3F
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D6F960A7D;
	Thu, 29 Oct 2026 20:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gs9dBuzEa0h8; Thu, 29 Oct 2026 20:52:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4D41760755
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793307166;
	b=XGkYRoCvioHUU+zc/o/ny5Md19sPgHrONKUzU0wMlvPn8ZOgdyxIwCegJxACxMa8hXAc
	 ygjKd6t7+hbdC7nCH1arZxfGgntO0ADzeZYJIH/Rynh/onaQ3HS1Tj0LzSMs5R3DCSTB1
	 qCE9BreTX9RMYYIAI9a6og/rJTvyrB4ysLtAgpS2vyxe/UY0Zbxn9IXTL4JwmvXu2hvOM
	 xhBZ3t4vkIVx7N5tMysO7cJD16nu7HokEoGPFaezB1/jnX91SAUOZ7o2fO3PLPg8DOjcH
	 ZbX7JHctG9DAdaVU6bq83OrdiFJecZmhbYUgGjau4uJ/OaOgJtrunJb2odW8kXdc/0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793307166;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=yAA01ra4PXiqjdz/yQZdcyQs4zumcRwyORXqlpW0kS8=;
	b=mN+595cUj9naudbooXTBQtE7e45XJV+8SU+2oEXG5Luq69Bejt29RuPJY7eViQQ34qrW
	 ZIKwGOziaiSxqGbhlkwI+ZwIvDfIuJoH2BIu2YHAPb8HCu1lWtqKVB85KoGai1S+QMhbk
	 ytXkS3Sfzz+/QEHavWtqs1Gi6jK+vf6IgpwofQFCA3AbGpAf9CJl2Mllpb6QQnYYZs6uB
	 9Gpzdnc9WUOPloLYNWeBBkh2uNj78o9Ur1tBYVbpwJRnBXB8UrAefJ7bka6r4ShBd8/ZM
	 ePWsOLjoqcXPQlEZfSa8gstbnBAyHuNJqovnp7RGHwMFLVn6OgY0cj/8sqIoWGqyx1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793307166;
	bh=yAA01ra4PXiqjdz/yQZdcyQs4zumcRwyORXqlpW0kS8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=mMRERM3FnsssagB7dl3xMOmAkntko58iQc7bFdfB59w/2TFz3k5s8oTAZsj/zgjkq
	 IH/yb6nLxUpsrjO84x6jfbX474/JX7GMu6/HJprKPUOK3De1rDraQGvXPMDi5J3ju1
	 L2YjYFYD2x9bkWuz5RwEpxUnhiFS3aTObN7zLyvi+49qZHDMgEkfP62ktW7HsYbBiw
	 m5VZZ56PxNGVLSpGUvbRxiYbbHquGdyRrXdVym55BtwBdw+cmvG2I8c4bgc11zcY+X
	 f/5rZV9K0cw/40a/mVxQPBanYa9iECMysrKi4SuZgm+O4MXaW/79DF6qkn4oKozaMn
	 CUFTYT0OsN5qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D41760755;
	Thu, 29 Oct 2026 20:52:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E389972
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F65840A6B
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNJ-Q_cGhQ5U for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:52:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D892D407B3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793307163;
 b=iRyx/rTSSxK6XAURHzslwgPzpAaF/SCTkj07qGM3e7ORuSaCz6Zlmry5fGdF7UGYrYrv
 ztQwqBEsoVwigECqfYFX66tqFutDedatRTibwjnuBTS4JyPTyDLAohPMIKFqS2xWILFLG
 cETjuc5FVAUMpM+AiOldswZuzeqfUksjQYCpz/uFY2143MuqcS1sqlRGXcg819P7T1B2D
 MqhDnt1qpvTv+6oi+Rd+7no4GyUpqB068o9AIa7DBC9E16jhco7wLsbi+xy6RKltg7Ede
 nXY7OSWjHWjl89imBNmnD6JNrKih/l4jFL7f5lPMrdz4Zv8jk2aE+ovjCZnRMTWemyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793307163;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=0FUYzgCUYn/FUPC7TZq46WUcj7ElDfAfcgQbLORHJV8=;
 b=LGjXhjpfkae+hzaeoWZZHM9cyYACLu1Uc74UnEYWF/LXQRj0/6QMK18HhcIqNWYm95/O
 La30+IC8E95y2iC3q7dICf7nBl11zzbK4B0DGg1IwKAh0ueWoBFbsR0WeqogdoO/g3fnq
 chDRrIyN2244eMnKmJ9Z+ixTBbjmJ7bARSoDV5O5PX96YiKkj9PjNK1/4SiDkr+acj/vD
 fKg9g6Yp3nEm8+hmUkAYXEL0ZmhotJCvGeFp9aZ+bYXY5pSmOR/AdhySmvtBc8hzg1yS0
 5LKgkHIxbpVCOQRsUQpY/Wk6cLJZEjVI2/yHQIpWhMKnVkIj2ecnt4Rcs9UnjJFGj2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fTHEDNRv; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D892D407B3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:52:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so26013335e9.1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 13:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793307160; x=1793911960;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0FUYzgCUYn/FUPC7TZq46WUcj7ElDfAfcgQbLORHJV8=;
 b=Xc2KXdpoJR1kGwZGFCFJQLS2SyXrGW9AInn8DCjeK2vI1NeaQK8Hwx7iT0W+NL1Ilt
 79RyRE8Fodk8xlt71Pq6aQcmLYTCwb/w0prJjPuPTB6NCB8RMQLFRO9RTb8hnjretXJ5
 6fdmsTsFEv6PglzHXeX0OPdvWZ/vUvS9cHm0CDgNPMYHzgG2dhAGPThQuDBDp6smz1vh
 PAJP+zbreDUQvmivcm7zCEm8yeDXjoBacy+rIEtnCVFZLHvMyEVh5HxU9lBBUzPDzoHs
 M7MJ1cOkPVmEMgkYkv6bRa+nTpIPqItDCVongH+YSXlEchRE7m0I2g3TQ3pETAe2QFN9
 JRZQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz3IPT5Daxvq88VkXHURdERMDx+3qaaxUIh8g2CBokoXHGcTYAvd54hrzxuLAr7C/16uyDbZxO01Fg=@buildroot.org
X-Gm-Message-State: AFq9FYJpuj/o6Pt7Ubuygu0LMiNSwACeHZQChIilSnlAz4FkTZcGDp7u
 U9xp7Xzcup3Ce6D6vgrpv+cSFoSHmTkEfZ6HGa5n2RoqT+I4fK4J3KWP40BKKPt7/uQ/5EuaAC/
 kKingx6Nj6w==
X-Gm-Gg: AYBFou2O47SYCrEgM7v/VjzSsAKno1WlaHS+7kMq4oArKgot7v58/x+YENBSC0rJMIy
 5iYvgFPDCTvlxGfVs4Jh8/4prw1d5Lw6fBkP8HoxRjbyO0NLHDviLNiJKwtx9/erTR7th2c8buS
 X98s/B2KSiF/p6N4zb46A8Mssx/cmNkb0eBhzyB3qo/wEYX4pF1oRhSLojPNkKdUkLopdsUvmiw
 4iwbnuw3E3NUo/CYaLXnIsA02YJYTYdF/3GtJFNrVmwxgvT0qKaI7rBfEEDvDVen86HL5kcHzeN
 /BXCAFLoWsY/avkgl1Nlgvb/ljBiCO4mUGGzEHZmSKoK0oKkRWyLoGPvo9y8oPLi4Dw6TfehzIq
 dFDLRWcCHDIoTGRgjNRxYQi4W6jp/o00I5yogWYa6tm6bgEIVDCd1eI9KeQnIPWJgPatwG3OnxP
 nEd8L6lmwsvi4RdqWeQkWtwCvJPWciDpY5GrAmavTddMenW0sOlx6HPCIWBEJmUIVNUwuD0UnlC
 916gDDpPQhCyq9XC8J30vwGrQRKmgtk6Kkjbmh6urdYKoq3pyWZQ0Y70NCBjsO79/B4/sP0H585
 kMfnVMWrTyoiowjdusXQ2KpiBc0x/TPC/YQ4Qw==
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id
 5b1f17b1804b1-4ac19705d57mr2890155e9.31.1793307160382; 
 Thu, 29 Oct 2026 13:52:40 -0700 (PDT)
Received: from [192.168.178.32] ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf6e63e0esm13623805e9.12.2026.10.29.13.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 13:52:39 -0700 (PDT)
Message-ID: <9e53839e-1ff9-42ca-9fba-87484e8f4186@mind.be>
Date: Thu, 29 Oct 2026 21:52:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@xes-inc.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20261005154047.413898-2-raphael.melotte@mind.be>
 <20261028161447.330533-1-raphael.melotte@mind.be>
 <20261028161447.330533-2-raphael.melotte@mind.be>
 <PH1P110MB16036C47623A4C8AC89FA00E9F6EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PH1P110MB16036C47623A4C8AC89FA00E9F6EA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH v3 2/2] package/mupdf,
 python-pymupdf: bump to versions 1.28.5 and 2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVmluY2VudCwKCk9uIDEwLzI5LzI2IDE6NDUgUE0sIFZpbmNlbnQgRmF6aW8gd3JvdGU6Cj4g
UmFwaGHDq2wsCj4gCj4gCj4gCj4gSSdtIHByb2JhYmx5IG1pc3Npbmcgc29tZXRoaW5nIG9idmlv
dXMsIGJ1dCBJIGRvIG5vdCBzZWUgdGhpcyBwYWNrYWdlIGluIG1hc3RlciBhbmQgSSByYW4gaW50
bzoKPiAKPiBtYWtlWzFdOiAqKiogTm8gcnVsZSB0byBtYWtlIHRhcmdldCAnaG9zdC1weXRob24t
cGlwY2wnLCBuZWVkZWQgYnkgJy9ob21lL3ZmYXppby9kZXZlbG9wbWVudC9idWlsZHJvb3Qvb3V0
cHV0L1Rlc3RQeXRob25QeTNQeU11UERGL2J1aWxkL211cGRmLTEuMjguNS8uc3RhbXBfY29uZmln
dXJlZCcuICBTdG9wLgo+IAo+IFdoaWxlIHRyeWluZyB0byBydW4gdGhlIHB5bXVwZGYgdW5pdCB0
ZXN0IHdoZW4gdGVzdGluZyB5b3VyIHBhdGNoIG9uIHRvcCBvZiBteSAzLjE1IGJyYW5jaCB3aGlj
aCBpcyBiYXNlZCBvbiBtYXN0ZXIKaG9zdC1weXRob24tcGlwY2wgaXMgbm90IHBhcnQgb2YgQnVp
bGRyb290IG1hc3RlciB5ZXQsIGl0J3MgcGFydCBvZiB0aGUgCnNhbWUgc2VyaWVzIHRoYXQgdXBk
YXRlcyBtdXBkZjogCmh0dHBzOi8vcGF0Y2h3b3JrLmJ1aWxkcm9vdC5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyNjEwMjgxNjE0NDcuMzMwNTMzLTEtcmFwaGFlbC5tZWxvdHRlQG1pbmQu
YmUvIAoKCkknbGwgYWxzbyBzZWUgaWYgSSBjYW4gcnVuIHRoZSBweXRob24tcHltdXBkZiBydW50
aW1lIHRlc3Qgd2l0aCBweXRob24gCjMuMTUsIGp1c3QgdG8gY2hlY2sgaW4gY2FzZSBhbnl0aGlu
ZyBicmVha3MuCgoKS2luZCByZWdhcmRzLAoKUmFwaGHDq2wKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
