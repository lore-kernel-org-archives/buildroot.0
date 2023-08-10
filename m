Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149A9C001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 05:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF7AC408D0;
	Thu, 10 Aug 2023 05:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF7AC408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HepyYwk4zRoF; Thu, 10 Aug 2023 05:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CC8E415A7;
	Thu, 10 Aug 2023 05:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC8E415A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EE141BF3F6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7681341757
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7681341757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id viwWBAT4RJBY for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 05:49:56 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D10D4176B
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D10D4176B
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.222]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mr9G2-1pyiQA1FdG-00oJL8; Thu, 10 Aug 2023 07:49:52 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 07:48:48 +0200
Message-ID: <20230810054856.100816-4-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810054856.100816-1-dalang@gmx.at>
References: <20230810054856.100816-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:sbjvoeNEBwQTNBQI7pg6yVuiC89i0VyS+cynd8KDIW3vYUYMbop
 gfJyTmeFGVTot3vZFgDk7NhwMCFq1TfxkroJ3gBqnbq07BHi4fnN4DWfLm/D31XGFwuuyh3
 P1F7cIqeOknaYprtmBwIBAC72O8SGvxgTHILxx9EeK5gflssC6XNElVflKEHT35KHhiYP+P
 OHvdsrZW14EHtzst+NTYg==
UI-OutboundReport: notjunk:1;M01:P0:hDfU5iLpgd0=;/o7Yp4WN0j0YbY3ILAkiQp6AIiZ
 8VmGrYUGL2GwMPuoiujUl8QvkjcCz97Sm5aXIhgoa+sSPmVgKbAc1I2fecTaywMkBlCWv2Q0c
 W76KbBl8XejZngE8/bQ/F/Fh99yaz5oNBSMMO6YeqkIIUj/IvCgV1NIa7ec1c2Ai4g0OH7R5w
 MuVkil9V6SFh3ZSyQpThxBxcl2NGUM4xMeWCPogiONO5mr5DjZu+kBFiznqMBilxdgeD3NMS1
 9gu3VeYJJh3CQW3CXpkpPNafKLr/GNd/RQjKB7NO+WBoh0fuWba38LeAbOrKk+csHGEhkU3Er
 x4tmT71/L4Co1aI/cidJVVMGMilpc0A4vgSk/3aybOhSgg7kvD6lITDdCgUjYvGqFiSzh3++c
 jWmNzyWM4GOEOm9BQ+CQeZbVe7BSDW1eMUqKeoNsiZkR3knl7myDCJUsftzIQab8Uqw1rgK/U
 4tYYmH+NzvuU5T2M4s9oKhKvNFNuWIRGCzw0qa5mjiGkCUpet+H+WSsjeNmeYEtLeVwboGjUa
 lwY2VuIOWfiAvmMu/bSrE2jWeBriCFaKGNSANqx1mjUjIIp8iJ1LvInv0vrRMip+O9Mp7VjmQ
 WJfNxgSxSXoXIGdin293LpVP+it51PuvXr41/9VSzifnFQMDxCCaJCkp7OVwyDq/lytEmbJaJ
 Mp+E6YxeicpwdNr47m5NlT3x/F00+oCSa3a1tvKDrnwVieGfAxq7Ke2J3qsqb2uNrWrCHK/03
 pF52BB3un9ejrp4J7W64JpkQ2aXZW5ocZdkw/FRTDmB1YqyU3IPrVwL7lwxl3o1DYyhiosUXh
 ZjqJQmOWRdlMAcdtypjXnMcylHv189RUet+rOPRJBNJHUEq3r60qg6MCMGkpulLZmqLAQ6by6
 E1Mq0z48mKjx+UnUPH8njZb7x37Ek2idmzuiIB/8Xvx+vQ2kRI1WdVGOeoLAzLoh7p6MZKLxT
 AwrTwd//ZrUfxIlIlpF3kyUvEtA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691646592; x=1692251392; i=dalang@gmx.at;
 bh=heq7SVinlq29NPxaQgVnUmrnTUPezi2ec+YXbMPoO/8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Cl2p4cgXp9KbHTPhJx1RlSHBQW7Fpfpag4Sy58inZ1SB+BFSTXOQiLkQNHlzRJDAQQrHHyX
 qjV/sGoxoPiZr0znND6bw292GW3wQi8bNvY4UnQj7/TLlDeiyGIgEn7fYOfVro3OmGq2KIJbk
 l3uMVMGM9QEdmEL5vLBjmSC+hvvPnK/JZoj8QD/nedN6ukwadRxqCFyFCakzgiFjjqnwhFRWk
 7lPuFmFBCYckepcc3nx1qLvHGXhML0k1CZaGYkgzbZQ33M/aZVAL4dmj07z2LlVHgpXO2ZA1w
 y7Bvbfqzx8pOnsHUYFheVnVqu3/iMZ9i8aEtrYv4ATnZiDqlWZcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=Cl2p4cgX
Subject: [Buildroot] [PATCH v2 4/7] support/scripts/nvd_api_v2.py: new
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
