Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C70CDD1D2
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 18:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3665E84ECC;
	Fri, 27 Sep 2024 18:34:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbzmYp6vCbn3; Fri, 27 Sep 2024 18:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAB084EE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAB084EE7;
	Fri, 27 Sep 2024 18:34:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B824B1BF376
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A28CC4253B
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZhHLChJ7VIf for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 18:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFF904253D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF904253D
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFF904253D
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 18:34:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.6.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mFi-1rvVpG2osW-017wUc; Fri, 27
 Sep 2024 20:34:10 +0200
To: buildroot@buildroot.org
Date: Fri, 27 Sep 2024 20:33:58 +0200
Message-ID: <20240927183400.339491-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927183400.339491-1-fiona.klute@gmx.de>
References: <20240927183400.339491-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zib8lmBO0YB1irQlVHdaYshbta1uZa3m+yr28m334gnCDsQOiZ/
 vIZxSLrrOk/50VB05oy7rqO1nLSn8H182vvxKY6Gk8PlRA4z73N2XB2GG83+xc/9yZtvqAV
 cvSMUUxGBwpaM/0fkBDTYHGJuSlM7ch9Nx7cvoEkiz0Swu+qfEekLZ+wpSGBvCfk0xu9WTs
 pGnkmCRCGZ82tLpssX9wA==
UI-OutboundReport: notjunk:1;M01:P0:0oXx/i8Y0qw=;EswWoJOAQeT2/jmYxpD8fsM3BVR
 SHajJn5YBdAsu1KA2SNXIlY2hDJTF0lkHKdcXWvp0dC4oBkigDBR3xQv3fmCssEWr0MSWk6m1
 2QMovCq7eU93GMnjQJqGn2wD1dW8Mk28u288o4qzzm3o2bh2PSzloplNxf1byFTanepyM0Bgq
 ljrxLcoh9+WWsURaLUCbYTjmpN/WMB6ZZRpezqOEr/f/I8nP+cqkSRJ9zoWW8bbntkLhbcvG6
 dz2Mq27cXWx01mLBrkfbGxJTQqqo6SRUj4JcwYAHl6UoW6q2j4njkN3kC0hOuqfAV/5XpQX0v
 uPjzkCzrYfya0qT9vzbteB3qS2lWfi759dhmomkucShVjj7ckZcOB2/qEYx+No5gzvqLL3PIO
 XXOvRnRsWZBKramn2JWJrml2xUoOeFZdrPxyQhIqEDIk476SqWkEjemCH8XGMi477TG48buLJ
 FhMpLQytYCwiDUIyUrdRxDJ8LpOgDlwflMfI0TgpTcLQYt9DQF+mM4mUYNSuWs0L/pJXUyLE/
 WtXHjfeXHt8h57DVEaIzZfQsSwWKRGLizfgVe6fcXt5B74sFCJ92U1K63rLL7u3oSgUgXcQ8y
 VNyywZt56mtyWV+V/8fOaE3ysrdemXYg2U1iO0Q7QATa6139yquqL7fJL37HRYIcibMwUrToQ
 nxcWS2UXp3S+tO3TpgzXMFVVGrVDrXrq6CwkwWc51vFpw2iAUsZd8vkCNT8t3/wi4bHefeQVw
 NZ1KjN4N8rZQJo5cEPLMQ3VyWveKBYU0SMsAfjALXcqNEofwIyjWCFhHMRr480P3H3hItM4Dd
 /5xVKnsD1oCeLtx+aVKvbJhg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727462050; x=1728066850; i=fiona.klute@gmx.de;
 bh=ye1BHzYNG71OIcMyGT4dd1uTuAakf/IBcrj947dzPYA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=p/YWyfli06EStRpe5FOeGLbbf5LE7qt29TlOVvF1BldAkR5pCwj1iORuFU/K9MOx
 bN1Espft69YNpLV5BqEur6MMHUS6m1BZEykx2Wh3nBsxeJjfCbE7H2FLc8xwi6P5c
 3vvpQ+ceC2FQp/juxgbCZLs/O4zD/hg9D4D9mf2fEs+jEFznOCetfHHQ+umQx01h/
 A+ZgPT+IevYMJNAP4TLRB5//AW8UcugcVGz6Iov65a9SgfQUFL86VjjU0Noilctkv
 PfK33djZafYEVVb52IXsXbEi7oZRmYI9lbXckeFJKVszNy4HvSoVrEiVPkAUsPnwJ
 5yBSPlVqWRPwJDtUyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=p/YWyfli
Subject: [Buildroot] [PATCH 2/4] package/python-dunamai: new host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Host-only package as dependency of poetry-dynamic-versioning.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 DEVELOPERS                                 |  1 +
 package/python-dunamai/python-dunamai.hash |  5 +++++
 package/python-dunamai/python-dunamai.mk   | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/python-dunamai/python-dunamai.hash
 create mode 100644 package/python-dunamai/python-dunamai.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d4774d0f1b..5371a7a59e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1111,6 +1111,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/

 N:	Fiona Klute <fiona.klute@gmx.de>
+F:	package/python-dunamai/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/test_nftables.py
diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
new file mode 100644
index 0000000000..a2a92b8699
--- /dev/null
+++ b/package/python-dunamai/python-dunamai.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dunamai/json
+md5  1b3ca932416961ea6953dbbc21e6d42c  dunamai-1.22.0.tar.gz
+sha256  375a0b21309336f0d8b6bbaea3e038c36f462318c68795166e31f9873fdad676  dunamai-1.22.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
new file mode 100644
index 0000000000..91ae7afc67
--- /dev/null
+++ b/package/python-dunamai/python-dunamai.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-dunamai
+#
+################################################################################
+
+PYTHON_DUNAMAI_VERSION = 1.22.0
+PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
+PYTHON_DUNAMAI_SITE = https://github.com/mtkennerly/dunamai/releases/download/v$(PYTHON_DUNAMAI_VERSION)
+PYTHON_DUNAMAI_SETUP_TYPE = pep517
+PYTHON_DUNAMAI_LICENSE = MIT
+PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
+HOST_PYTHON_DUNAMAI_DEPENDENCIES = host-python-poetry-core \
+	host-python-packaging
+
+$(eval $(host-python-package))
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
