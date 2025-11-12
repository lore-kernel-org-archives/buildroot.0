Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181F4CD37AB
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0B940B6A;
	Wed, 12 Nov 2025 19:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7ui3PHeysSK; Wed, 12 Nov 2025 19:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A124F40AF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A124F40AF8;
	Wed, 12 Nov 2025 19:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7222F230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63E034006D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXg__6v0vUe8 for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:37:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5315C40055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5315C40055
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5315C40055
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:37:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 166512700; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 19:37:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJGeS-00HYWv-0C;
 Wed, 12 Nov 2025 20:37:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20251109082208.744230-1-bernd@kuhls.net>
Date: Wed, 12 Nov 2025 20:37:08 +0100
In-Reply-To: <20251109082208.744230-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 9 Nov 2025 09:22:08 +0100")
Message-ID: <87ldkbrqjf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VxU8MO2R2l+2WZYboZV8C10N6cWKGsK7lJFzyi7otceVhCrNYelQsZQestjbtM2TiQ1qNsm8Bnk+JqzlKcS8ZdrUeHHdP8QvHIACNRW56iHsMOIkHV7DhnHdDsT+KZ5vYJ1I7oW8k4/j4CKUc/1rfgeeaebvMTWUl9oJAkZ/Ymf7GH97PKJAs5VDQ1LuEaI/t0KHVkQe6ySnag5YPKIkYUQpOyhNRa81dl3I3sHeg7dnyu31NbBwZetmTNiGdzjg3OIVjsCJn7+Mt2VkUItiL5pBD6GnupMMEi3OvB9w2FBZRUuCUUUPM1RNZ5s2EsMIAenHROLwjFm3/xX7wPXROg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=idKhdkyd6H5uMpnrF99U8NGQ+x+VjD1qcYllMdKCf6E=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=VxU8MO2R
Subject: Re: [Buildroot] [PATCH 1/1] package/libudfread: needs threads
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > This patch fixes the build for non-threaded toolchains occuring since the
 > bump to 1.2.0 by buildroot commit 537555a37f53360020a11df8065450d88e9d107c
 > and the switch of the build system to meson.

 > libudfread uses

 > dependency('threads', required: false)
 > https://code.videolan.org/videolan/libudfread/-/blob/1.2.0/meson.build?ref_type=tags#L66

 > which falsely detects threads support:

 > Run-time dependency threads found: YES

 > although the toolchain lacks threads support:

 > $ grep THREADS .config | grep =
 > BR2_PTHREADS_NONE=y

 > There is an open Meson bug report discussing this problem:
 > https://github.com/mesonbuild/meson/issues/553#issuecomment-421562520

 > The only dependees of libudfread, kodi and libbluray, depend on thread
 > support themselves so we require threads support for libudfread as well
 > to fix the build error.

 > Fixes:
 > https://autobuild.buildroot.net/results/839/839d1b879187454ba9064845451f2c2ff398a663/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
