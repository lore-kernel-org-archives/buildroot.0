Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D83C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8185080F91;
	Fri, 31 Jul 2026 11:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lZAf3L28iv9B; Fri, 31 Jul 2026 11:58:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AFD810D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499096;
	bh=rNMxC8OPeS8Omnx44KV9qz/d09FUkgSANADRBO1Z97k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fG/vGXLUcDfbQRG+RQduO1AKp/w8M5UJF9tiyx9uF2hLopV1PD9ZqnfEEv+oIzYEF
	 cGzR1QOpP+wMUI8dCkuL5U43F++UK7ReiHOlywFYHfkIx1mhSxA9JX6UmiKXQotvz1
	 ibTDytGo4kmVd4Zj8sfJG238IMOwPUEAO7RYgTcGJ1t21XtoRPBlYfvU4IyqS1pdJh
	 Q0J2XJwAWyxHl9rsXZysn7zTnmGXrnH23Armh48BOj+7St13Z5gD3HxnuRtSX/t8SH
	 LsO4l56s3ge2WzIiV60iOI9S8INWO8MMT33Xkzaz9B0inWXD/ITviwkDYEdBMU2yA0
	 w9OGhX7UHJY7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48AFD810D6;
	Fri, 31 Jul 2026 11:58:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8807A23F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E9A640FBC
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoqtw0swT2nh for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5A7A40F95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5A7A40F95
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95EB08B741; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:43:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 26234b30e2ac3d907fb272261c4f7a2b713d7347
X-Git-Newrev: c423b4bc5a41ab3b77007ea5ded518816f7bf4bd
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.95EB08B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-paho-mqtt:
 clarify license information
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c423b4bc5a41ab3b77007ea5ded518816f7bf4bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

package/python-paho-mqtt is dual-licensed, so licenses should be
connected by "or". EDL v1.0 is a BSD-3-Clause license, as confirmed by
the ESF [1] (see listed SPDX License Identifier), also confirmed as
intended in the pyproject.toml file [2].

[1] https://www.eclipse.org/org/documents/edl-v10/
[2] https://github.com/eclipse-paho/paho.mqtt.python/blob/af64a4365c6ac5a7a4d339e7b00f44df91353b35/pyproject.toml#L10-L12

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cbd7cb094f50b359563ef0948c1760cfa7a76f0d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-paho-mqtt/python-paho-mqtt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index 90ed8370f7..5e1d2fe32d 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -6,7 +6,8 @@
 
 PYTHON_PAHO_MQTT_VERSION = 2.1.0
 PYTHON_PAHO_MQTT_SITE = $(call github,eclipse,paho.mqtt.python,v$(PYTHON_PAHO_MQTT_VERSION))
-PYTHON_PAHO_MQTT_LICENSE = EPL-2.0, EDLv1.0
+# LICENSE.txt, EDLv1.0 is a BSD-3-Clause license
+PYTHON_PAHO_MQTT_LICENSE = EPL-2.0 or BSD-3-Clause
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = hatch
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
