Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4A9C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DA0810BB;
	Fri, 31 Jul 2026 11:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4T7_v1-DJBp; Fri, 31 Jul 2026 11:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F03A810BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499012;
	bh=ey6iEPX4T/FyF1lEOOQB+BE8HwgJEMUMr/r3lV9WT5o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SH3CFOVMBzKbWG1aIdUyHI1vE4UkCFMvT67IDaHf93ewAtFPlIxYd8lruuBLQ9Ymr
	 55VQTY+0oXS2yJJKuBDSWDvbLTDTqO8M04xValJWd+WcIEGmcVcTMB45bCY5WWG1D3
	 wwM0PibCgM5BMTnBG+Vxcu3yoL3/WNu0JuWiyPg5RH9E78sKL6XbJt7KsSriBTQLOv
	 w8/5NPRnLRh9RZ4iYEAnBQdRpvYx3oxNd8oq0TCcgQRYbQGo63fM36BerLnXLY4Gsw
	 v1dgym6+Rm+Ey4q6WjnH3U6RxoIK/jltgrc8cfSjy/J5zAHdAbmebfJJSPKW8O8XCt
	 8gFHb56M1A69Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F03A810BC;
	Fri, 31 Jul 2026 11:56:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C629B23F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7E5040EE4
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adcZoUdySxiH for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 840A340C1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 840A340C1B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 667478B743; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:43:36 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e70ba3effcb50938f2cd244802d772bdab347912
X-Git-Newrev: aa039e5df0941f4c463d32739a72cfebb35a6b4a
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.667478B743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/python-paho-mqtt:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa039e5df0941f4c463d32739a72cfebb35a6b4a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
