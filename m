Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23A3CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04D2B6F5FC;
	Sat, 30 May 2026 22:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tF5Ip8po5a0; Sat, 30 May 2026 22:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD72D61B58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178457;
	bh=HbKBMuv3cC/YW7S0KazJEAKZO1ZTvQIF+gVaeng3Em8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AwydDy0C1MrsbktrEM3A8P5bqpVgmH0V7eLftkic+L/SWhYr+wjRxCYxL/byR+mhW
	 Z+uacUwsh9HQLy0wxWuCiLcvnT3yU7mGD95bt9vkP/ju6bTdMF3QVmHpVbTS//EE96
	 PFMdLvXwuucSvaX/efcUu+pcUhKfZ9N5rIFnEyWa01LXoLJj6SnunHuGeuDtjpK+xq
	 jqL0eyTLMqjz8EZbBanVCrBhMTLHmOr/kSh6ovOBt8NCojy0rTfoFNPkEF9feaQqkg
	 5wXjcjUjYX98qxaH4PT92HDagCjO8zFr/9q1Q3MEap2EjQUXpH7ozcNoh9u/ZUeTVd
	 O2mMyFOGPX1ew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD72D61B58;
	Sat, 30 May 2026 22:00:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C610CD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABB8685489
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc_RT9XpMltR for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:00:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D31F185487
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D31F185487
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:00:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A90D98764A; Sat, 30 May 2026 22:00:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:58:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 72a022ec2c5be7552403d5199ec8bd01e3a64641
X-Git-Newrev: 6be20a5df1b8208b8d156fee292954d4738a4b3e
X-Patchwork-Hint: ignore
Message-Id: <20260530220040.A90D98764A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/paho-mqtt-c: bump
 version to 1.3.16
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6be20a5df1b8208b8d156fee292954d4738a4b3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Release notes:
https://github.com/eclipse-paho/paho.mqtt.c/releases/tag/v1.3.16

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 8ca597c4f9..59c74cd044 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  60ce2cfdc146fcb81c621cb8b45874d2eb1d4693105d048f60e31b8f3468be90  paho-mqtt-c-1.3.15.tar.gz
+sha256  8b960f51edc7e03507637d987882bc486d8f4be6e79431bf99e2763344fd14c5  paho-mqtt-c-1.3.16.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index acff7d5cc3..3a6a4e4b31 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.15
+PAHO_MQTT_C_VERSION = 1.3.16
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
