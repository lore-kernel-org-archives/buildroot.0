Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90494CD379F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BC7060634;
	Tue,  3 Sep 2024 16:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhksiBclshFd; Tue,  3 Sep 2024 16:27:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8158960635
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8158960635;
	Tue,  3 Sep 2024 16:27:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF6761BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD1AF80F00
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7KdiaBNkCWMg for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:27:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93A4580ED0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A4580ED0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93A4580ED0
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:27:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C03F4C0005;
 Tue,  3 Sep 2024 16:27:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1slWNH-004go7-0i;
 Tue, 03 Sep 2024 18:27:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240723133004.652232-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Sep 2024 18:27:23 +0200
In-Reply-To: <20240723133004.652232-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 23 Jul 2024 15:30:04 +0200")
Message-ID: <87v7zcog7o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/rtty: bump to version 8.1.2
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patch (already in version)
 > - This bump will fix the following build failure with musl >= 1.2.5
 >   thanks to
 >   https://github.com/zhaojh329/rtty/commit/eb6394c3d83a21a8825e47b40659cfe0ead33b6f:

 >   /home/autobuild/autobuild/instance-22/output-1/build/rtty-8.1.0/src/file.c: In function 'start_upload_file':
 >   /home/autobuild/autobuild/instance-22/output-1/build/rtty-8.1.0/src/file.c:156:24: error: implicit declaration of function 'basename' [-Werror=implicit-function-declaration]
 >     156 |     const char *name = basename(path);
 >         |                        ^~~~~~~~

 > https://github.com/zhaojh329/rtty/releases/tag/v8.1.2
 > https://github.com/zhaojh329/rtty/releases/tag/v8.1.1

 > Fixes:
 >  - http://autobuild.buildroot.org/results/382405b421a8ea7b5b3beb553f47fa20427fa3c3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
