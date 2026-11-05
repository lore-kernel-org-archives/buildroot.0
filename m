Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7BC606A326
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 00:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M3T1dOTV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C888280B80;
	Thu,  5 Nov 2026 00:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s8bmuaPcoW6; Thu,  5 Nov 2026 00:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 115F580AD0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793838122;
	b=I37Juav1Ha2BFhymq/jRtUz1uQblv0AOEEhFvs4bTTTjgBS2Zg8SNXMvVHhkbolgIMbM
	 y7tTh0ibfWOoUo7d51NY4oD2mklp2wXbWjrhH5zoXtH5ajckEG4+YpEXNRRumBhsFtwAF
	 NTiiZOT1ZOQA246z/soHEEEpZd6binQK1hZnjIayPRhotG4P1fiNoXi2B+Ya8jRKSAZCU
	 vXRfhHE197XVVu1/kNlnxt/RzkvC2eQ5RQ9HK7j8lDTvj8yXoIizeb1FYFS0fC3lpBorC
	 ZQcwegA8GavgyHQrBwoNgFIPB5AgpnfjYdf0drYTo4U9NlNIRS2FxIJgnH6lGH8QO9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793838122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Received:X-Received:MIME-Version:References:In-Reply-To:From:
	 Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dk/GnhlinzZfK8o+R9sToim9KEcm7NMGdQ/f9FWIFdY=;
	b=XgqvvA0TLsCnfPDSZYD2xWpESe08yJLO0PkdQ+xWJ8nYCCUFmx5e3B5nnRPF444WtGYy
	 s77/0a0EG+ofYVeA+3QR6JBnvYh4gonRuW/OV0x0aiTZ1AF5pqcRTXlOiIGz05TnpA1hm
	 Sndo0maU9hucQBYZJoU0+1iZZYYjM1uk/FhgDkM042lq8b6Mfcei57mG6ObdCupgKKE9Y
	 PFyUuiPPv91XCxtGdkwkTpfAIZ1rw65fBV6q4dGXkxSrEOfGPFk7UuIe7Cepmc8g4e2Qg
	 AbA+DmZfTvW/5zgJsoFtQa7pwKHxDKsw7og7cKqDQqXHzqpMgSRKSknWZnwZTQ4OSDw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=none header.from=telaak.dev;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793838122;
	bh=dk/GnhlinzZfK8o+R9sToim9KEcm7NMGdQ/f9FWIFdY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M3T1dOTVotbJfMJEqEZcGvZnQbxyHGjdQSdX+AL5lBXyjwpRRAvab7VOxZa3VOT8d
	 4Kq/QhiEvEUY5AtsW+0IUhtNprVVk6++SvsLanE4Csycc8Rnv0k5unRfacG/5xJJUN
	 64h3PHLNSWAFHEX0bozLmw+H4TnEcfhpQeNYrxy+Xkb1A8g8QFUsUHVZoF1AMN1Sk2
	 Zj7ew2McJPzjdHsvdStSOGrdfNfQ81MQs4RKE+otYDSyypZGYpeCSxp9ATkn8Jb9UH
	 BwktOn2QChc8ofYG/pwJFdF2q3tuGBBu634Q58YiD5Qk5Qf24+pad95jql2kdhgSph
	 eHO3PNPKBR2iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115F580AD0;
	Thu,  5 Nov 2026 00:22:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58392177B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 00:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DCDD80AD0
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 00:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQ38qsIU4Z5w for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 00:21:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5DAE080AC8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=209.85.215.181
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.215.181;
 helo=mail-pg1-f181.google.com; envelope-from=jttelaak04@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=telaak.dev
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DAE080AC8
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 00:21:59 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-cdab938dc83so580366a12.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 16:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793838118; x=1794442918;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=asv9ATa0DwixAhSHGoBfBWECUOT3zGk1yMZ+vZ0oj74=;
 b=NC+cxK/E29XXemhEOMKiovJvp1GM2mg7dOr9IMKhb4kVSffC1/PPtt25mAm9v1Cx4d
 Yfum3x19V6tAFI+7Mc9ltquR5+SFH0b++TYFKiUNOevwQF1J0dvVflrLya6kud/bNnXx
 IG5EQVOxF+XG9oIGq4H8/a5+rupxHNvX0r9IqwLw4gCyUVLesOyaGeqSRcGg2JzkoXs8
 V0dkooFRJCL8b0pbzFCCTh7ERgyCTm6lExlpng9Zq3yymZa/iAlw8wJY6oWp1Ji7yJTl
 AB6Y1vZ/rmHa0HWW4LlpycNpJo4ubnxENc5FkvvnB5La04CVKKyu93A+TPZCkKGg7Q1p
 JTmA==
X-Gm-Message-State: APuU4Z9iT+6Ek//9XySAkjIzbzuMRPCpAacGR2FsJFnLsYGRDYTmbcK8
 scxQO+63WL62Ck+6Rpx/u5lRFVuKvh8kc25NVS6FjCrXrK9urREcdbP9yJMBJPTj
X-Gm-Gg: AYBFou1wAmoXxiVtRPSe6ALCjU6M/EOSo14ROfnRxdzzOtVI/furUWwI+4w+TtD1CIR
 gx4iaiaL4WIs6Bfhj1+obG3aZwCZKR1+svzZOUdae69kqu4ZPNjAAUIe5tY0cru8z7rgnhsWsSZ
 Iyq6s9Psz64lRvygUjtNpTwwCSlo5Y9D5F/8C3lNmqHu5dVfPGOZa0jkZ7t7wcSC0kQEB18W4Lb
 Him714X5KiSWTksRX+fRnAhhKX0jc2pIB4zhSFZog488ru61c8UHziJjZCDfkWtg5RgcCR9aYv9
 tE8fg16/5d+F9HC4SjCJqFGwswwrXUUKlgdPAZMIKYlKvKrrzRjXDmabFEbKVca63G62yCkXUTn
 AXrG63bcnSUAXEIkeMFy8IjYMJw8w0k6OTQ8mP7PF36+w6VYISNk2pkZppVzJUd2Cs21dprV4yB
 adtrVOXTPFdPfDDTFDrLkay6z1b3ghTssJXPU62ZbxdgGpdNV7f3zlggkmiAq2ah1JuCrM22C4j
 BQXoWlNhhyKml8WKoMBtYSLXuC5urB1Nbnc1PIz6HsYFeeG5gXQqFrcldw+iJxlPeI/lKOVQ6KZ
 SGAk5n080x6q5QDxO6VgnDlQXcq/SdDd613qOqBevLmPU9Vw6yWuEtrPDw/QpqLc0bLAMmcQWoC
 GQ/FjykdcF0dRoee5pLDRN+hFpWv7svmS/uw9tMReS9U=
X-Received: by 2002:a17:90a:d30a:b0:3b0:9cc6:62c1 with SMTP id
 98e67ed59e1d1-3b09cc6a2a7mr1683270a91.63.1793838118121; 
 Wed, 04 Nov 2026 16:21:58 -0800 (PST)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com.
 [74.125.82.178]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b31d4bf1sm965226a91.16.2026.11.04.16.21.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 16:21:57 -0800 (PST)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-36a1947498bso3252777eec.1
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 16:21:57 -0800 (PST)
X-Received: by 2002:a05:693c:8945:10b0:36a:3bba:2e07 with SMTP id
 5a478bee46e88-36a423becbdmr25255024eec.26.1793838117187; Wed, 04 Nov 2026
 16:21:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102224915.69302-1-joseph@telaak.dev>
 <20261102224915.69302-2-joseph@telaak.dev>
 <auurEHw7GaBuvGwe@windsurf>
In-Reply-To: <auurEHw7GaBuvGwe@windsurf>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:21:46 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7n9QTCBb5EsH=txF+pBisH7NxnirkdMt2zMLVL59-1kA@mail.gmail.com>
X-Gm-Features: AclHuK8J249buptSd3QRo0mX8AxjrAoZar5u3nvzS7LUzv257KEgGk4otALSAjg
Message-ID: <CAPY4CJ7n9QTCBb5EsH=txF+pBisH7NxnirkdMt2zMLVL59-1kA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/wpewebkit: add missing
 libxkbcommon dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Thomas,

On Wed, Nov 04, 2026 at 11:04:01PM +0100, Thomas Petazzoni wrote:
> When does wpebackend-fdo becomes optional?
>
> This patch doesn't make it optional, and neither does your PATCH 2/2.

You're right, it doesn't, and that sentence should not be there.
Adrian's 2024 series ("package/wpewebkit: do not depend on
wpebackend-fdo") keeps libwpe, which selects libxkbcommon, so even that
would not break the chain. Please ignore the matching line in the
cover letter too.

> Overall, is this fixing an actual build issue, or it's for
> consistency, and preparation for wpebackend-fdo becoming optional in a
> feature version of wpewebkit, which would break the wpewebkit ->
> wpebackend-fdo -> libwpe -> libxkbcommon that exists today?

It does not fix a build issue: with 2.50.5, libxkbcommon always comes
in through wpebackend-fdo -> libwpe.

It is for consistency, and for 2.52. wpewebkit's CMake has an
unconditional find_package(Libxkbcommon 0.4.0 REQUIRED), and with PATCH
2/2 the WPE Platform library links libxkbcommon itself for its keymap.
In 2.52, libwpe becomes optional (ENABLE_WPE_LEGACY_API=OFF, with WPE
Platform enabled), but libxkbcommon is still required.

If you fix the log when applying, this would be accurate:

  WPE WebKit requires libxkbcommon: OptionsWPE.cmake has an
  unconditional find_package(Libxkbcommon 0.4.0 REQUIRED), and the WPE
  Platform library added by the next patch links it for its keymap.
  Today it is only pulled in indirectly, through wpebackend-fdo ->
  libwpe, so this does not fix a build failure. It keeps the
  dependency correct once that chain goes away: from 2.52, WebKit can
  be built without libwpe (ENABLE_WPE_LEGACY_API=OFF) and still
  requires libxkbcommon.

  Select it and add it to the dependencies directly.

Thanks for the review,
Joseph
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
