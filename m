Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980AECF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67DAF418DC;
	Thu, 19 Sep 2024 20:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuCkkim99xmI; Thu, 19 Sep 2024 20:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC18843294
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC18843294;
	Thu, 19 Sep 2024 20:00:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40D271BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB0642B20
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOZ7ZmImQfBy for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EEA642B23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EEA642B23
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B16183D7F; Thu, 19 Sep 2024 19:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:55:56 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 736d908465c347fa30ebac8e1f53b4024b6646f6
X-Git-Newrev: 2d17c16ff7154524d2ee004fd3c3e6f8a2401e58
X-Patchwork-Hint: ignore
Message-Id: <20240919195949.2B16183D7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/libcoap: fix typo
 in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d17c16ff7154524d2ee004fd3c3e6f8a2401e58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Rewrap the whole help text as with the typo fix the line is a bit
longer and no longer fits within the limits defined by our
check-package coding style checking.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 08926081d879f03477e3d5f4a326e01be07c0d60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcoap/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
index 950aee5279..2bd6b742e9 100644
--- a/package/libcoap/Config.in
+++ b/package/libcoap/Config.in
@@ -5,9 +5,9 @@ config BR2_PACKAGE_LIBCOAP
 	help
 	  libcoap is a C implementation of a lightweight
 	  application-protocol for devices that are constrained their
-	  resources such as computing power, RF range, memory, bandwith,
-	  or network packet sizes. This protocol, CoAP, is standardized
-	  by the IETF as RFC 7252. For further information related to
-	  CoAP, see <http://coap.technology>.
+	  resources such as computing power, RF range, memory,
+	  bandwidth, or network packet sizes. This protocol, CoAP, is
+	  standardized by the IETF as RFC 7252. For further
+	  information related to CoAP, see <http://coap.technology>.
 
 	  https://github.com/obgm/libcoap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
