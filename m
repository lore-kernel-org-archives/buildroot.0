Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244F3C87FD2
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 14:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D623B40C09;
	Fri,  8 Aug 2025 14:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRw9yVrxhI-9; Fri,  8 Aug 2025 14:47:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE0040C06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CE0040C06;
	Fri,  8 Aug 2025 14:47:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C646C10A
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6A6B60BA1
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vP36Yv0l7s8i for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 14:47:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EEAB060665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEAB060665
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EEAB060665
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 14:47:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1245349943; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 08 Aug 2025 14:47:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ukONT-0044xE-1d;
 Fri, 08 Aug 2025 16:47:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Angelo Compagnucci
 <angelo.compagnucci@gmail.com>
References: <20250806200631.605635-1-thomas.perale@mind.be>
Date: Fri, 08 Aug 2025 16:47:27 +0200
In-Reply-To: <20250806200631.605635-1-thomas.perale@mind.be> (Thomas Perale
 via buildroot's message of "Wed, 6 Aug 2025 22:06:31 +0200")
Message-ID: <87h5yhq39c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rk74a1z5ag1rv95AvYzt2Kqej97+zCICgfzAcDl+rx1y8g4aq2ERxd3zIt2OjVz0wC3K8vRvAMkXgM4EDbsCtTSqJcKi/70smjP+0cKrwp/xf61gM09ZhCSKgcUX22UcTxLhCuE53ZjhjTaY6gtKe1UBqmV1a4w3Dueqtg9Wdee+2PExtsNJr00ohFLTowmorfEjTFBqyfjWhlyjjzN5hz/g19kduj2RYskh55WrqZpILMdRhkycsheG//w9KH0D//Sn6xfH8HslgDJ/XnoO/qUpd7iJ/T57wQdm5HpYZyZzmY32kmLAUUofT3SKI072DsKu0xZY4gBc/T3ywAJYbg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=zlcuiknt/BYZlXDvgW/589Agfsa3ULp9qNObwnxyswY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=rk74a1z5
Subject: Re: [Buildroot] [PATCH] package/libapparmor: fix build w/ musl
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > When building the libapparmor package with musl the following error
 > would appear:

 > ```
 > test_multi.c: In function 'main':
 > test_multi.c:27:30: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
 >    27 |         printf("File: %s\n", basename(argv[1]));
 >       |                              ^~~~~~~~
 > test_multi.c:27:24: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
 >    27 |         printf("File: %s\n", basename(argv[1]));
 >       |                       ~^     ~~~~~~~~~~~~~~~~~
 >       |                        |     |
 >       |                        |     int
 >       |                        char *
 >       |                       %d
 > make[3]: *** [Makefile:466: test_multi_multi-test_multi.o] Error 1
 > ```

 > This error can be reproduced with the following:

 > ```
 > cat >.config <<EOF
 > BR2_aarch64=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_BLEEDING_EDGE=y
 > BR2_PACKAGE_LIBAPPARMOR=y
 > EOF
 > make olddefconfig
 > make libapparmor
 > ```

 > On musl libc the function `basename` is provided by included libgen.h.
 > This error has been addressed upstream in [1] by re-defining the
 > function `basename`.

 > Also, `libapparmor.mk` refered to patch 0001 which has been removed in
 > [2] so I removed that reference. The autoreconf is still needed.

Please don't mix multiple changes in a single commit. It is not right
away obvious to me why autoreconf would be needed if we don't patch any
of the build files, so I have dropped this change for now and committed.

Please send a separate patch for the autoreconf issue with a description
of why it is needed.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
