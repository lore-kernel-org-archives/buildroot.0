Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5275BCA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 16:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EC1540050;
	Wed,  3 Sep 2025 16:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kXNAbF7OoLGg; Wed,  3 Sep 2025 16:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AB0D40806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AB0D40806;
	Wed,  3 Sep 2025 16:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CCD22BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A89606B4
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PaYy65fyVzz for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 16:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 706EE60BCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 706EE60BCD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 706EE60BCD
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 16:20:55 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1011928258; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Sep 2025 16:20:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1utqE6-0010Ov-23;
 Wed, 03 Sep 2025 18:20:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Marcin Bis <marcin@bis.org.pl>
References: <20250829124017.2910174-1-peter@korsgaard.com>
Date: Wed, 03 Sep 2025 18:20:50 +0200
In-Reply-To: <20250829124017.2910174-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 29 Aug 2025 14:40:16 +0200")
Message-ID: <878qivmrrx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=oW1mivRv0hS/QH/kR/2fRlmBbQ8jclgpej8s+DKfj9R9F7zm1uWHnT0dWVUoYM3jq2Co4qefyis4KmZA/lJ8y67a4m8RdIOs/kiLh8Qpq/z4aSp0kO1mXaJ3du3pXfspg0NrQ1We4QuLJmoXNxxLJBGUiZ5zzkVW+Te16cPhqDku6/CYEdeqflqigIIP6E+1UC7wZPsLRI4TTaxm/oxvXfrhmsJ1Ul7N4VLyMEDFD+tV9RDpzaUl0B+zL6ptm1nO48zokR2sd6plKFUFj6HJuqMApnCjbDfemiq8W+Cbm3oRJABqn2tI5crhqHBOBe71XLBL4iq/JIfM+3PsbahOlw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=swsp2db2rZWcPcvjdx7HQ2tIi+D5FEI58lGzdmsqaTc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=oW1mivRv
Subject: Re: [Buildroot] [PATCH] package/ecryptfs-utils: ssl support needs
 engines support in openssl
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes https://autobuild.buildroot.net/results/f32ae62961aac7e8344f4be109040e7de2eb415e/
 > The openssl logic in ecryptfs uses the openssl engines API, which is always
 > available in libressl, but only available in libopenssl when
 > BR2_PACKAGE_LIBOPENSSL_ENGINES is enabled, leading to build failures when it
 > is not:

 > ecryptfs_key_mod_openssl.c: In function 'ecryptfs_openssl_read_key':
 > ecryptfs_key_mod_openssl.c:305:9: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
 >   305 |         ENGINE_load_builtin_engines();

 > Fix it by only passing --enable-openssl if libressl or (libopenssl + engines
 > support) is enabled.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
