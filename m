Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07169EB64DC
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 10:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EDC2409BD;
	Mon,  3 Jul 2023 10:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EDC2409BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTQem08gjljj; Mon,  3 Jul 2023 10:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFE8C405F0;
	Mon,  3 Jul 2023 10:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE8C405F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 355F21BF30C
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 10:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C21981D16
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 10:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C21981D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88qYRdpb-FfD for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 10:58:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38FC7817B5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38FC7817B5
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 10:58:25 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id EB08D780512
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 12:58:19 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qGHG7-0004jp-M3
 for buildroot@buildroot.org; Mon, 03 Jul 2023 12:58:19 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.96)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qGHG7-00GGH7-0J for buildroot@buildroot.org;
 Mon, 03 Jul 2023 12:58:19 +0200
Date: Mon, 3 Jul 2023 12:58:19 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20230703105819.flmwndqvctpjuolz@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] package/iproute2: add optional dependency on
 libbpf
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The configure script will automatically detect used pkg-config if
libbpf is available.

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
 package/iproute2/iproute2.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 15af076db9..096e650b1d 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -38,6 +38,10 @@ ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185),y)
 IPROUTE2_DEPENDENCIES +=3D berkeleydb
 endif
 =

+ifeq ($(BR2_PACKAGE_LIBBPF),y)
+IPROUTE2_DEPENDENCIES +=3D libbpf
+endif
+
 define IPROUTE2_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
 	$(IPROUTE2_DISABLE_IPTABLES)
-- =

2.39.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
