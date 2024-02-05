Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD0FC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C11B60F1A;
	Mon,  5 Feb 2024 11:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C11B60F1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXwBH8_s_ft2; Mon,  5 Feb 2024 11:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 684D860FF1;
	Mon,  5 Feb 2024 11:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 684D860FF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C41B01BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CB3C4192A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB3C4192A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNVDlNXQE7s7 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:46:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B971141929
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B971141929
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB798FF809;
 Mon,  5 Feb 2024 11:46:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWxQI-00C5QT-39;
 Mon, 05 Feb 2024 12:46:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>
References: <78273b30-5659-4cc0-91f8-23a8775fedf2@sord.co.jp>
Date: Mon, 05 Feb 2024 12:46:02 +0100
In-Reply-To: <78273b30-5659-4cc0-91f8-23a8775fedf2@sord.co.jp> (Atsushi
 Nemoto's message of "Thu, 11 Jan 2024 14:47:48 +0900")
Message-ID: <87le7zt9qd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sysstat: do not autodetect
 sa_lib_dir
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Atsushi" == Atsushi Nemoto <atsushi.nemoto@sord.co.jp> writes:

 > The configure script of sysstat package checks host's /usr/lib64
 > directory for default sa_lib_dir.
 > Specify sa_lib_dir exclicitly to avoid host dependency.

 > Signed-off-by: Atsushi Nemoto <atsushi.nemoto@sord.co.jp>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
