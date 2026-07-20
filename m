Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59576C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 20:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CC51406E2;
	Mon, 20 Jul 2026 20:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gHZBl0fQIgU; Mon, 20 Jul 2026 20:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EDDC406DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784578616;
	bh=zJiIUrgL6kTTWSuNrATim85lMTZ1DlphbpdAZ1iQsEk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U6T3CCSBk/9adcAU2y2X3RCRyiACiRw1rDtExh+ArFjNL7Zj8LjVoRBxpabVGSkDv
	 HTnxGbQQcinU+Qd8Yaz0Z+q86ZjrbrmXuu5Wikl1HFoxgHLyrS+yaPlmEHku9vDPaD
	 cQJ/nToF3Py6fOgx3Z8zgkHAHXhcXX9Pu6FM9mZnZiromiklSGwjdVuBDhUN/KUI+p
	 MDfiJ6T6bgIbCTzU4R0NXeG4okU23JCz8yFtGzF5TUtChu+z4Ht6axDxE/bZzbWG+/
	 y1oP4XCv/iNcKISy5l2IMSqggyZ6eTGQaJ0BGmka6aWS9iS9Jc+jD+y1twA9q0yjZT
	 MFwgP3CBOnkxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EDDC406DB;
	Mon, 20 Jul 2026 20:16:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3A1D786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B11B640218
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7vJNTtNOsFP for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 20:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF9AC40099
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF9AC40099
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 20:16:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EB148907B; Mon, 20 Jul 2026 20:16:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 22:13:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75f49d3c09d354e5848a82bc1a53f4e8c2f2c075
X-Git-Newrev: cbd7cb094f50b359563ef0948c1760cfa7a76f0d
X-Patchwork-Hint: ignore
Message-Id: <20260720201616.2EB148907B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paho-mqtt: clarify license
 information
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cbd7cb094f50b359563ef0948c1760cfa7a76f0d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

package/python-paho-mqtt is dual-licensed, so licenses should be
connected by "or". EDL v1.0 is a BSD-3-Clause license, as confirmed by
the ESF [1] (see listed SPDX License Identifier), also confirmed as
intended in the pyproject.toml file [2].

[1] https://www.eclipse.org/org/documents/edl-v10/
[2] https://github.com/eclipse-paho/paho.mqtt.python/blob/af64a4365c6ac5a7a4d339e7b00f44df91353b35/pyproject.toml#L10-L12

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
