Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715BFC369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 16:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B1481F03;
	Mon, 14 Apr 2025 16:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5HYC3uRQGzgN; Mon, 14 Apr 2025 16:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1B2A82C3C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B2A82C3C;
	Mon, 14 Apr 2025 16:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED3C250
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FB5160791
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HbjlgGpf8OY0 for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 16:16:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5EF660BB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5EF660BB5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5EF660BB5
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 16:16:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.122.10]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqb1c-1tI3Av3CEq-00ojw9; Mon, 14
 Apr 2025 18:16:01 +0200
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 18:15:42 +0200
Message-ID: <20250414161545.2863615-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:xo0v6o99oF4KOu9m+JZ1yq1eCDbwrMfW6LM5bOvhw23ibbsd3Ql
 5buwOZwuKKgLFaU5p/iWepyZXEWptXSwunuiiFOqf5JSLeTN0sXZUbmzjXwcGz44vGyaJ6F
 uqnqi6WmCKXLivn4ocf4vo5O2ydVAOoBpdop8Srn7Yf06jV6LpQs+kV0yt0nfVjFocDRbh5
 90k+2h2MJT8NRVMcVYuBg==
UI-OutboundReport: notjunk:1;M01:P0:VDAxX+Tmy18=;iwuZyQ+Ba98OJo8nEnI7IUfavM5
 sWW4PHS42CTvOJ6Pp9M4nlR2bzC7e/v/g2NvtAMgwkGPWsRi44QfpwKUxl6Yma1WoK80tZGWM
 Cvh2blCA/2yEHOWFJBbRyztbp2uzLS1lCDVrzTSblNX4HdcSc59iQWA7VbIFtaPq4smoMLaqY
 iOXlpxkB4RYjr/m6NRvYuh6FWlQMognq6ILO5IkPhLBV86Y8A9P+CfR2FW95EjLy5tvJJ/m7h
 fCt1QZSqERpiKgW6C0hAp2JYKv517wQ3203E6aOeZUa0P26Awyz9rc3AbT1wj9LuBJs2oDBOE
 W+WjarSTrZMFi+PpU91cKRVXrRuJAEVVD6O56H8b6np13j9mxa1S8TclqyEOscx+IK2L4JLFS
 gHT3SCHYx3fHjB+Itc7K7qK8FJGhq+1I/SQYzS1wow1Fh0GNMYNyYLW4VBUoIiWuREQZUwVOx
 qmfo2X44u1jRQjsZMzB+kiPBFBacoZlpLskeFAMHbxPcNnGflHouA2sUUOc+DwAtEqVcllPx+
 YRP3UA3LYKpDa4jtMOZh5CyrzFEfUOJEUB7xc06dndgHVt9tTCW9OFwCIYEM8PYUQ2qsOdG3r
 GsHrPwtCNr8vaC5mLaqkOrfd/cgqgh1OhPiv9/aKtolEeX7vzNu78oIP10YDeb6qE120BgN1r
 ELjT5HAMTS74OQLaW7r6rdT8aSy3Lkw3ue4u8jQJ0GXJ0u0sAx+QbXBTvHasXx7ssIaGTZoWG
 uiU3w2x9ljYwem7KVB4C92r6HXyp1afSVQ4jRVgfTNThPwqevQH+CqKZ2MAE22/JHKCHhP2Dt
 zba5rKY2eYMTKfDTBWhuWX5hHbSmMuAiHEBXzISeHElh7r7l6+4hejP39izhNWoPki7m+jSAQ
 GS9Gav1oFgPKoh01PL/6+qJGj/8xJfTcDuGl38MVuDrLPAcIcD3CallAnBwKsO7KbeDRUZ7p0
 iuysW2W+schNuIHb/x4EwRMBKMbRQBQGuE0BLwUNLyFLRuhPR21SBtLzAi0j+mYF5OZ+RYsmK
 uPbC/NU48xEnrLa4z1SypLly5hSLZaIqdInhH/v6dlnLmK6l8Pmu6v+PBUl6VBAj6IShCOvRX
 wiXuOWohOwFFQPWm2lOEX8QrUCc6OFzctCv4u3UWmAYwqw/+RVqHZF4SA2XYXDCfbi6+M/daX
 LCFfM2gVAlxGb1iNJTfUnXGkHYdg47xYSdE6K4pjjbIgD7BeJkqmEipU+2zTfNOrynrlWO3Eg
 AHmCfE7pAG3EyP6vOkRvuiB+thWb02fc5CASZBS/qXQoWDQ1k/VC4HUe7U5zm6gV9SS21mWIe
 t0L9cadTcCEgdoEGLOiavlabvYZP5y4Oi7Kd4dVoiq1MA2GmAkYjkxJ205NrvHRS4h395UPxT
 nRwHdPuZhG6ClX3mEs/+5nat8v0TgCVdwpwPd9BmQtL9Wdjp6xASJXy4wZGG7cLg6nr5I+O5k
 URoG8RBkDNAUj5sENKSPZxkE5YNJd8/8dQVecZ7S8nUc7BFO8
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1744647361; x=1745252161; i=fiona.klute@gmx.de;
 bh=MySOe1GvBUS+gVH1XMPRQm7JyV65K8+rpZaH/7+mepM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qARN+P89pOiz8rmUCaRixVQaibbsXBHn6gZuYmx3+OsNu5MkrNRfrCbpO1AABB8C
 9/ec2xcwZzMB2+GGOWhNr//d7I3SDVhC+6RT4AsFxTFJJRDXGQx/uakx3cdQTf8RN
 xWY/0/gEsvIFLDMLrMtmJFzmFlIqhCChQ69gDzqAyql2brIQJnbiMlmTxS7T1fg/T
 fYxjEWJsgSszt2mM5UKETQk/Gs01G8tg9zh5waYG7uIJH2a9Ty+4jEnXFxJXFndV6
 JPO3JOM5r9LjZubW06bClCORvWtFhqGjkchNH1G6TjwbHpPkUeM5PU/Hg8c50b3mR
 QI5gRq8HnCjjlhMrYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=qARN+P89
Subject: [Buildroot] [PATCH v4 1/4] package/python-gobject: bump version to
 3.52.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Upstream changelog:
https://gitlab.gnome.org/GNOME/pygobject/-/blob/3.52.3/NEWS?ref_type=tags

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 1dbd40d038..e49c7ddd08 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.50/pygobject-3.50.0.sha256sum
-sha256  8d836e75b5a881d457ee1622cae4a32bcdba28a0ba562193adb3bbb472472212  pygobject-3.50.0.tar.xz
+# from https://download.gnome.org/sources/pygobject/3.52/pygobject-3.52.3.sha256sum
+sha256  00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf402f1eaeec086d82  pygobject-3.52.3.tar.gz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 001f355844..3021937887 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.50
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
-PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.xz
+PYTHON_GOBJECT_VERSION_MAJOR = 3.52
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
 PYTHON_GOBJECT_LICENSE_FILES = COPYING
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
