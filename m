Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB88C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 15:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E867240D57;
	Fri,  3 Jul 2026 15:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MF_Dv3jnw7la; Fri,  3 Jul 2026 15:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE1740D91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783093093;
	bh=f85beamHcwvisEgVyxoHs3WpMH5fO92BVKtj/5b/O0Q=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KkQjmO+RAH0G5GNKcrvjhv7yzOOxkGorbknDGqdByO0sDXCUppix0iyJMfudVbe7P
	 Bi4U2U1Ut0EZy3kHbrTn3gLecHbBKZUIA0m/P90j3Dc4SS4atI8LJawxrB115m/7iD
	 R6WvxrY0AWrGeociq5LGnyhhIN+00i55Y3ZaiuMdmT0a4XC0/OwBqeTz4X5uRBwcut
	 i+6oemsU7/sdCsbkmCmOTfT0xzsudM2hVC3JMV/ialE2wKu5C0/g/coVwHVUewU4Od
	 H1C3WXpdpbenil/f04Y6bf7mcQ57mk2tstGq0OYBjfaHYg4FV/Qb9x09XdEr41ZXuL
	 mpo2J5126PeRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE1740D91;
	Fri,  3 Jul 2026 15:38:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 384CC14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 15:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 272BE40102
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 15:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1mwAtUYUZAh for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 15:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 508304006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 508304006B
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 508304006B
 for <buildroot@uclibc.org>; Fri,  3 Jul 2026 15:38:09 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1wffxu-0006Cn-MS
 for buildroot@uclibc.org; Fri, 03 Jul 2026 17:38:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 03 Jul 2026 17:37:35 +0200
Message-ID: <pan$cd1cb$b3663b10$60596520$cac5083a@ID-313208.user.individual.net>
References: <20260702183149.A6094881F2__19928.5095486388$1783017157$gmane$org@busybox.osuosl.org>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [git commit] package/apr: fix build failure with
 autoconf 2.73
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Thu, 2 Jul 2026 20:31:37 +0200 schrieb Fiona Klute via buildroot:

> Since the bump of autoconf to version 2.73 in commit a6e8c07a330a,
> the TestApache test fails on CI runners (and in autobuilders [2]) with
> our current docker image (GCC 12.2.0) :
> 
>     gcc: error: unrecognized command-line option '-std=gnu23'; did you
>     mean '-std=gnu2x'?
>     make[3]: *** [Makefile:136: tools/gen_test_char] Error 1

Hi,

this commit causes build errors on the autobuilders:
https://autobuild.buildroot.net/?reason=apr-1.7.6

./configure:Error: decision on anonymous shared memory allocation method 
failed

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
