Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36946C63797
	for <buildroot@archiver.kernel.org>; Tue, 17 Jan 2023 09:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5337607F4;
	Tue, 17 Jan 2023 09:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5337607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkDjoHZ993JV; Tue, 17 Jan 2023 09:40:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 226FF606F5;
	Tue, 17 Jan 2023 09:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 226FF606F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D655E1BF2B1
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B23BF40414
 for <buildroot@lists.busybox.net>; Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B23BF40414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjubOcmiyWCp for <buildroot@lists.busybox.net>;
 Tue, 17 Jan 2023 09:40:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F18D340153
 for <buildroot@buildroot.org>; Tue, 17 Jan 2023 09:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F18D340153
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD6F287C39; Tue, 17 Jan 2023 09:40:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 15:40:10 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: aab29257d470ace3b223c8bb3978c5683c4d1a3e
X-Git-Newrev: 352f5bd46c46f0e9146a93f2221d05b2d28ba6e2
X-Patchwork-Hint: ignore
Message-Id: <20230117094049.DD6F287C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/janus-gateway:
 add libcurl optional dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=352f5bd46c46f0e9146a93f2221d05b2d28ba6e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

libcurl is an optional dependency which is enabled by default since at
least version 0.0.9 and
https://github.com/meetecho/janus-gateway/commit/ca9c0a86f975f88fbdd791af3cb4f8986883c1c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 60cf07079b78d4c4bb495fd18cb2a145a4cb3635)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/janus-gateway.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 9a74350b2c..149b2e86c4 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -128,6 +128,13 @@ else
 JANUS_GATEWAY_CONF_OPTS += --disable-websockets
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+JANUS_GATEWAY_DEPENDENCIES += libcurl
+JANUS_GATEWAY_CONF_OPTS += --enable-turn-rest-api
+else
+JANUS_GATEWAY_CONF_OPTS += --disable-turn-rest-api
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 JANUS_GATEWAY_DEPENDENCIES += systemd
 JANUS_GATEWAY_CONF_OPTS += --enable-systemd-sockets
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
