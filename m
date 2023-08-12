Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFA0C001E0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 19:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA39B41591;
	Sat, 12 Aug 2023 19:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA39B41591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Edj96yFFMlhD; Sat, 12 Aug 2023 19:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C36341554;
	Sat, 12 Aug 2023 19:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C36341554
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15C511BF3CD
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E38E281947
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 19:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E38E281947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDp05FVxoNAF for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 19:29:32 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 634888193E
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 634888193E
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MSt8Q-1qMc3q05UM-00UMyl; Sat, 12 Aug 2023 21:29:28 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 21:28:33 +0200
Message-ID: <20230812192842.135682-5-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812192842.135682-1-dalang@gmx.at>
References: <20230812192842.135682-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:eAdzxmkGyiunlYc93f4vuzxNWB1a1j72uS0brig7iCmxtgM9UGK
 Fpex+GpeSDiH47Se8FBWos4EUrPty5DcYrlOScs8Yuiw++EWzzQ1DpRVc/b525O6tgEl5cr
 IviIDESVuVXehb7xYo4QKjhtMH7+1g771cP5P/M/uGHDwN2ZyXYTLk46iKBC0NdG9WHtwvk
 jM+9QaRVrl43gerkXLaIw==
UI-OutboundReport: notjunk:1;M01:P0:jvkcauqeWLg=;YgozbLvT3/yAhQOTHXbS8APCqOG
 cSHaxjZB9fUGAB4N0F1mIl8nxqAlsMpBCgpUCVdjYTnngB372IPk4r3YDHF2HgE3kSlNKcJaD
 pq62jTj9/3VBo7b2oAn7XPK8VdrEeKhlYAQ4p1xPMYXCm81q+C644iMQVT4biAAhbPJ9+4elt
 IJj2UxJrM+glUy9hyF3A4fs2L5KYbfM+Lf0sdMkuwJXIcAYmrK4EdezJA9Q3XzaihzVfITA14
 3OPkya3WXi5cLFXzO7WzgveUS7JIJJq4tVFgjpQyWep0BX8XJNo+t12KYNs2kv/Xw4i5cWMru
 iHiMYNfiRtloF3bZXJSDjipQOtPE9Fq8Ltzv5rH1wRhyLrJUBTWgF4hh+qGKecu3FQTDCwSTN
 BBnF8bmX44AvKVu1Qq/sbQVzJyEwlNzs3y61rwHP7rZFPT4fUlBXVF4Rd/hHnk3DenzHqLPnv
 77FQy0AFtbVeGA7OzcwWxtynxTo3C1jQFGSL143RByYXzj/O2M5P9aPgIzGBXjCt2v3sLXuWH
 r66R+dpcZnvpQV2wdBafS13EKOIkpJLzz0on6PEPnBI1Wb4PJUKwtq7C/pqcw95ZLaA0LFl5F
 r3KBj8/YJnHHl7iu7cnCamCDnHnyVvdtGzTRl5rc2LPaqcw/MHPsRdkIt/G2d7B2Vu1Vox/dr
 7dH79MmzUqxVzF1gCcBRgXjIAPs4x97f4BLgLle7lYF06V32IaAbvZtCC1w7Bn+WQF54hq4gl
 SgJZ0RLtqn65T/KY2BBkxOo8mY26TdBkLAKxm7V5Whmvn/d/BTDC5zAuh3wKOohB7woHmJxiq
 d0O7CLfwyEp8UjAnVPcGpVZWQqTfM5HdwXhl3HzcgL9VM2CLMJJ6I0Yle8xrpeYekeLdCMZEO
 hWYiaVQkpvEfNlamGUIfQj1s2dbqW2cfu+HEY0O7s4NuDWCXn4VMx2SvegpsvkpDCywtVG0E3
 twvUjUO8F7n2UU9xCLACxb21OXM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691868568; x=1692473368; i=dalang@gmx.at;
 bh=heq7SVinlq29NPxaQgVnUmrnTUPezi2ec+YXbMPoO/8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=rXf0FA9BSOyf23/ZMbn0ojyUgQtfPLDaSbwy/2p5rb/yxYyLdBUvoBU9brLvEE/WXQSHX/u
 LotuXpih5O46HzKD12Pcv8Qug5kyPdV32mzJ+s9IP6sActpdMhW5+4PofBy5LKLntU0EA3WSX
 ck8QXuzM3eVngiCXe64Iblb2UQUeqX5aTS14esvkfKMr083Ap1sKls5CTEmLLo1gEbk0+Nr5b
 onYo79NeclkdnMJVug+xo6u+InDEYtF15curfzn7Apsm4XA/OF7haCYaS0dyxIfDww6mBAein
 ZBfsYMEWRlIITzCzgW6yyZEdHiaFyF9oTk+TNb1gJiFZCok4M9ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=rXf0FA9B
Subject: [Buildroot] [PATCH v3 5/8] support/scripts/nvd_api_v2.py: new
 helper class
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The current NVD data feeds used for CVE and CPE checking will be retired
by 2023-12-05 [0]. Both have to be switched to the new v2 API. Since
fetching data from both sources workes the same, a common base class is
used to handle the API interaction.
To store the data locally a sqlite database is used.

[0]: https://nvd.nist.gov/General/News/change-timeline

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 DEVELOPERS                    |   1 +
 support/scripts/nvd_api_v2.py | 138 ++++++++++++++++++++++++++++++++++
 2 files changed, 139 insertions(+)
 create mode 100755 support/scripts/nvd_api_v2.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ffa3ee693..81f809a4c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -668,6 +668,7 @@ F:	package/paho-mqtt-cpp/
 F:	package/pangomm/
 F:	package/pangomm2_46/
 F:	package/sam-ba/
+F:	support/scripts/nvd_api_v2.py
 
 N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
diff --git a/support/scripts/nvd_api_v2.py b/support/scripts/nvd_api_v2.py
new file mode 100755
index 0000000000..3fdf32596f
--- /dev/null
+++ b/support/scripts/nvd_api_v2.py
@@ -0,0 +1,138 @@
+#!/usr/bin/env python3
+
+from datetime import datetime, timezone
+import os
+import requests
+import shutil
+import sqlite3
+import time
+
+NVD_API_VERSION = '2.0'
+NVD_API_BASE_URL = 'https://services.nvd.nist.gov/rest/json'
+
+
+class NVD_API:
+    """
+    A helper class that fetches data from a NVD API and
+    helps manage a sqlite database.
+    """
+    def __init__(self, nvd_path, service, database_file_prefix):
+        """
+        Initialize a new NVD API endpoint with service
+        as the URL postfix.
+        """
+        self.nvd_path = nvd_path
+        self.service = service
+        self.url = '%s/%s/%s' % (NVD_API_BASE_URL, service.lower(), NVD_API_VERSION)
+        self.db_file = os.path.join(nvd_path, '%s-%s.sqlite' % (database_file_prefix, NVD_API_VERSION))
+        self.db_file_tmp = '%s.tmp' % self.db_file
+
+    def init_db(self):
+        """
+        Needs to be implemented by derived classes.
+        Used to make sure that database tables exist.
+        """
+        pass
+
+    def save_to_db(self, start_index, total_results, content):
+        """
+        Needs to be implemented by derived classes.
+        Used to save the data given by a single API request
+        to the database.
+        """
+        pass
+
+    def cleanup_db(self):
+        """
+        Clean up any files that where left by previously
+        failed runs.
+        """
+        if os.path.exists(self.db_file_tmp):
+            os.remove(self.db_file_tmp)
+
+    def open_db(self, tmp=False):
+        """
+        Open and return a connection to the sqlite database.
+        """
+        if tmp:
+            return sqlite3.connect(self.db_file_tmp)
+        return sqlite3.connect(self.db_file)
+
+    def download(self, last_update):
+        """
+        Download all entries from NVD since last_update (if not None).
+        For each downloaded page save_to_db is called to together with
+        progress information.
+        NVD rate limiting allows 5 requests per 30 seconds or one every
+        6 seconds.
+        """
+        args = {}
+        start_index = 0
+        total_results = 0
+        results_per_page = 0
+
+        print('Downloading new %s' % self.service)
+
+        if (last_update is not None):
+            args['lastModStartDate'] = last_update.isoformat()
+            args['lastModEndDate'] = datetime.now(tz=timezone.utc).isoformat()
+
+        while True:
+            args['startIndex'] = start_index
+
+            for attempt in range(5):
+                try:
+                    page = requests.get(self.url, params=args)
+                    page.raise_for_status()
+                    content = page.json()
+                except Exception:
+                    time.sleep(6)
+                else:
+                    break
+
+            if content is None:
+                # Nothing was downloaded
+                return False
+
+            results_per_page = content['resultsPerPage']
+            total_results = content['totalResults']
+            start_index = content['startIndex']
+
+            start_index += results_per_page
+
+            if self.save_to_db(start_index, total_results, content) is not True:
+                return False
+
+            self.connection.commit()
+
+            if start_index >= total_results:
+                return True
+
+            # Otherwise rate limiting will be hit.
+            time.sleep(6)
+
+    def check_for_updates(self):
+        """
+        Check if the database file exists and if the last
+        update was more than 24 hours ago.
+        """
+        self.cleanup_db()
+        last_update = None
+        if os.path.exists(self.db_file):
+            last_update = os.stat(self.db_file).st_mtime
+            if last_update >= time.time() - 86400:
+                return []
+            # NVD uses UTC timestamps
+            last_update = datetime.fromtimestamp(last_update, tz=timezone.utc)
+            shutil.copy2(self.db_file, self.db_file_tmp)
+
+        self.connection = self.open_db(True)
+        self.init_db()
+
+        success = self.download(last_update)
+        self.connection.close()
+        if success:
+            shutil.move(self.db_file_tmp, self.db_file)
+        else:
+            print("Update failed!")
+            os.remove(self.db_file_tmp)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
