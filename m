Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E088EC54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 14:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F9281C19;
	Mon, 30 Jan 2023 14:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87F9281C19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDJwzd1SAh4x; Mon, 30 Jan 2023 14:47:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A26FE81CAD;
	Mon, 30 Jan 2023 14:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A26FE81CAD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E611BF947
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 14:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A248405A4
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 14:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A248405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxOa52nRd16f for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 14:47:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B925840A14
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B925840A14
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 14:47:02 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7ADA5C0008;
 Mon, 30 Jan 2023 14:46:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 15:46:51 +0100
Message-Id: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675090018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/cRss08qK8JHM8vmEPDLsTdRwiNsmUNzV1+ynTKv6iU=;
 b=d2Ou2jda6QPj+RHRitCSAts9+fwYCcnXY5j6GcQVSfN3Y+AbxYFM8kTPKtNKNW0UEeIusT
 CZuPxwUykP4oQLMO3h/b7KdgdVJux52iaIdcIo2HkhdWbuqbrNkq/wou5nS75fveM7YJNG
 nI8qiR/+r51PDJtB8GLBjSn6GUdzz415cJZoj7J/pkB31zyoaXN93qmcvUPLBC6qwZzFMc
 jCJFyRTl8OSctsiYcJh5AWC0ptWESEIpaI2XKdwbLzHV8mjoepLbzlEtKSO1foDTziX+sg
 KhT0Yy5ojVrbHUIuIJ/lA1WOFX1pyjQU8B6wy5dqRHQxqUAgJAKQqW5fVqa8uA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d2Ou2jda
Subject: [Buildroot] [PATCH 0/4] introduce the rtla package and its
 dependencies
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Pierre Floury <pierre.floury@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The RTLA (RealTime Linux Analysis) tool is an interface to the osnoise
and timerlat tracers from ftrace, allowing to benchmark and investigate
the sources of latencies introduced by the hardware and the kernel.

It has dependencies on libtraceevent and libtracefs, which used to be
part of the trace-cmd package.

This series introduces one package per library, the rtla tool itself,
and also bumps the trace-cmd version so that it uses the now-external
libraries.

Maxime Chevallier (4):
  package/libtraceevent: new package
  package/libtracefs: new package
  package/linux-tools: add rtla
  package/trace-cmd: bump to 3.1.5

 DEVELOPERS                                |  5 ++++
 package/Config.in                         |  2 ++
 package/libtraceevent/Config.in           |  9 ++++++
 package/libtraceevent/libtraceevent.mk    | 33 +++++++++++++++++++++
 package/libtracefs/Config.in              |  6 ++++
 package/libtracefs/libtracefs.mk          | 35 +++++++++++++++++++++++
 package/linux-tools/Config.in             | 10 +++++++
 package/linux-tools/linux-tool-rtla.mk.in | 32 +++++++++++++++++++++
 package/trace-cmd/Config.in               |  2 ++
 package/trace-cmd/trace-cmd.hash          |  2 +-
 package/trace-cmd/trace-cmd.mk            |  6 ++--
 11 files changed, 139 insertions(+), 3 deletions(-)
 create mode 100644 package/libtraceevent/Config.in
 create mode 100644 package/libtraceevent/libtraceevent.mk
 create mode 100644 package/libtracefs/Config.in
 create mode 100644 package/libtracefs/libtracefs.mk
 create mode 100644 package/linux-tools/linux-tool-rtla.mk.in

-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
