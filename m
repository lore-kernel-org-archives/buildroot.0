Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F00C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 05:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12CE5605DC;
	Mon, 27 May 2024 05:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oM_WWCc-1nI; Mon, 27 May 2024 05:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFCF6081E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFCF6081E;
	Mon, 27 May 2024 05:55:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF13E1D1828
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 05:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BE056081E
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 05:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUoQ7SloMeUR for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 05:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F1106081B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1106081B
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F1106081B
 for <buildroot@buildroot.org>; Mon, 27 May 2024 05:54:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2125240006;
 Mon, 27 May 2024 05:54:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBTJA-004y7B-0C;
 Mon, 27 May 2024 07:54:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240505141759.872371-1-fontaine.fabrice@gmail.com>
Date: Mon, 27 May 2024 07:54:08 +0200
In-Reply-To: <20240505141759.872371-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 May 2024 16:17:59 +0200")
Message-ID: <87le3ver5r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/shadow: fix NLS build
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > NLS is an optional dependency since the addition of the package in
 > commit f78c5cb5cae93a9e63dad4361d78e1787759382f:

 > /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-musleabi/12.3.0/../../../../arm-buildroot-linux-musleabi/bin/ld:
 > ../lib/.libs/libshadow.a(libshadow_la-alloc.o): in function `xcalloc':
 > alloc.c:(.text+0x7c): undefined reference to `libintl_gettext'

 > Fixes: f78c5cb5cae93a9e63dad4361d78e1787759382f
 >  - http://autobuild.buildroot.org/results/9f604d09745ffa1f4db3bdcfe0326c236effac0c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
