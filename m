Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CB4C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 05:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD9DE61165;
	Fri,  5 Jan 2024 05:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD9DE61165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZnRkCVAD9yp; Fri,  5 Jan 2024 05:54:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3730D610AD;
	Fri,  5 Jan 2024 05:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3730D610AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 324D91BF3F2
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 05:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09EB7417BB
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 05:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09EB7417BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8HplIWQTKMw for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 05:54:05 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A4D14176E
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 05:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4D14176E
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 2CCB3352091B; Fri,  5 Jan 2024 06:54:03 +0100 (CET)
Date: Fri, 5 Jan 2024 06:54:03 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <ZZeZewJSTNqyUqF2@waldemar-brodkorb.de>
References: <20240104190529.1521901-1-abrodkin@synopsys.com>
 <20240104190529.1521901-2-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240104190529.1521901-2-abrodkin@synopsys.com>
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1704434043; bh=iM+QDa0PxFwB9c9Nuidts4F/jQx20RNLjEHv/OViF6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RI7g22xFRI+SqT8OhaMrdxzWs/tWUnbmKCZn9xFvVo8eiXqk9u1f4N3MHFI1mRfKq
 0oT20KpfT8FmkVA1emyHEAO4i4TDHmxJ+OKRRMvghhKhfDbb8xSymDblREx9yUbInN
 5bucyKLg3QSJnPihjl7g8XL4uL+B87kX7hIQnYMYF8OvhX3uTJqeJWDpNWEkfjg4OE
 AO5SRX6GD9qK8MkEsM4OkWbwiEfA6cBAO1Of/96kHm+zTUv33XPI93ptQLUvBfx08X
 6ZQ45/kfxN6xvat8rnltRcgyyRCHGHzt4bKP/HmKXSfUU2mLSWG87X7arY9nBQ4a3z
 74dI1bU2pivhQ==
Subject: Re: [Buildroot] [PATCH 1/3] ARCv3: Add support of ARCv3 32-bit and
 64-bit processors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: geomatsi@gmail.com, artem.panfilov@nokia.com, Shahab.Vahedi@synopsys.com,
 VVIsaev@gmail.com, vgupta@kernel.org, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alexey, All,
Alexey Brodkin via buildroot wrote,

> These are new generation of high performance ARC HS5x and HS6x
> cores that implement new ARCv3 ISA binary incompatible with
> previous ARCompact & ARCv2.
> 
> On top of the ARC GNU toolchain 2023.09 there's an incremental fix [1].
> Also instead of adding a reference to glibc fork there's just a patch
> which adds changes required for ARCv3 support on top of the current
> glibc. Since most of changes are ARC-specific there shouldn't be any
> problems with moving to a newer glibc version and as wit hother
                                                       ^^^^^^^^^^
                                                       with other 
> toolchain components that glibc patch will eventually be gone once
> ARCv3 changes are accepted in the corresponding upstream projects.
> 
best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
