Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC4FCA0FEC
	for <buildroot@archiver.kernel.org>; Fri,  1 Sep 2023 19:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB879613DA;
	Fri,  1 Sep 2023 19:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB879613DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkTNYW5mep4Y; Fri,  1 Sep 2023 19:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01FAF61084;
	Fri,  1 Sep 2023 19:28:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01FAF61084
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C30081BF576
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B7E140246
 for <buildroot@lists.busybox.net>; Fri,  1 Sep 2023 19:28:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B7E140246
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RR2zLKHjeIwi for <buildroot@lists.busybox.net>;
 Fri,  1 Sep 2023 19:28:14 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2E3140227
 for <buildroot@buildroot.org>; Fri,  1 Sep 2023 19:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2E3140227
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.144]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MIwz4-1qMGYK1Cbi-00KSJF; Fri, 01 Sep 2023 21:28:10 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Fri,  1 Sep 2023 21:27:11 +0200
Message-ID: <20230901192719.102415-3-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230901192719.102415-1-dalang@gmx.at>
References: <20230901192719.102415-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:5wPpoed44C7850MoeW69Y0WIFXlqlzAWACVZxVs5ZWyDmmg1gel
 Pb6UvEAud070jwW7sLIkkFkY+HUYDgmXd6F0vbfouR+ID8ZqP2zjE0Gf/q7GrNwVJYaud7j
 jN/K+Xeusdt6+sxjHq8+1J4WwRQY0kqRrPTd0Adj2KKLwa4qVWcTmWFXC4iGxUzEMCLY7dL
 BhGF2ubStsM2PSUAc4HBw==
UI-OutboundReport: notjunk:1;M01:P0:EmtVi75H1rc=;o1cAQpUq1Y8cj/lyuUn/WkWGd0V
 Svx8uXAFW8XnNmq1FjqUhOD8Ne6WYUnSEuVwK1tKShxXnxLodtEvoS9rWu3eVRpVDxUEmXO+T
 j/q6GLod/LyvZujVmyO5ahUVtRo4rqAHbUgJWqTj7s+5wPDpuonCsGhIiYRIJZmO/DIi1d7ZY
 pSzrcLH/ofxdF1102XKhKOtX8oI4a7RiDP5EfL7m7n4LVfaS2IzNAa/nsqIbSftE4dBFh5xrm
 v3aAiHUTFJ1zO3uWB0U9Ty7VRKMSLsYPNLreXGmdiTBN0p4cm1v9pGqHj433F9rVOpzGN6P6g
 OjcQf7cTxOk0Y+LvQHmqvAhRIleO5agFbiTRF+ulYspOlQsCfTJz0C+vHB1uUQCHS66mm7CZn
 aiTxURnA57E2YZiRrTcckE81OdR8AoQdnEC8s7e5vYgYZAxas3+pxuyz9zvvsR0zTRFuAyYyf
 x3jAsISMEk6leVDaVES9CB34Hk8+rytlNESksEAgmvfnJStqW1DL1J7dD258riE+7FaIvVHB3
 FhwEJeCl4VH58n1Qer1J+wun09aWVO+Q582Ues1t8Zt3TWlvaLM396X0I8wJEQKrjZJLO1TJB
 MgLeMjGfKAb6p73z3YqZaZnaQiPlL1qZwNXiVkSJTtqWfcmMBgl5v9RrTc5nFmJ0ks2JF/n4t
 1uuMjnewk0UnHZXvTqjf90AsxoBTgBWGOVetmMeKNZPTWx4NCo8g+LeZd+v6ZrL7HSU/R5K+r
 p4b45C6xuTzsEvpX/vqMUS6M4mk1bI9lyduoxSaGQ4OSGL8O+vfIVXoEGo2a5sziikCy/ezD3
 p0Ej9hWpYcyqCy4VRwmX+6bvoYpZaZUxGW0Ms7E5dabkqcnbCV8pOJCJvraYvDi34USh6HnfQ
 ulb4JP+Ye3wZzDQZRXI/k2Dg24uy1UrVcpniSi5I/QdNJoIR7j54kiaybGHrIs4ad8OIAcPTk
 BjlCxezX8E6j99NZp5cdn+T3j4U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693596490; x=1694201290; i=dalang@gmx.at;
 bh=Rq6dlOycYFQetFtCazHf6aLDnftmF1bLpgLgaitHfSM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=C8Doi/5fLvMd+DwczcEzSssr+CIXh9Zw2epvSG83KVp43ziuGlyAYjTD/mma5exBLm8fE+9
 LYZ5ZXyP+uUv336awWljIYKohIuKpqInqGUucafYTjJzpgvHzBa7qouA8aWZJKpDcqAYr9g5W
 x1jKTltJqrESCy/5vO/IX4lpxLyhCOqaZy6Pdex7RihaRnvQk48uFAY1OLSjfpXHdn8izyJHt
 pPNtrVfkbRt1kKUWgbVl1aMLXxJGV7cY3Vdb5bzEbr96e3Z2/98Y5qjVvVpXd71cJeAAIRupP
 ceXe8yqgvcJVBPGv53b8az2SBII6cNJi3Ce2x6aggG1Dy2qh8hFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=C8Doi/5f
Subject: [Buildroot] [PATCH v4 3/6] support/scripts/nvd_api_v2.py: new
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
With the new API JSON pages are downloaded, meaning that we have to come
up with a storage solution ourselves. Therefore nvd_api_v2.py manages a
generic set of methods to initialize and update a sqlite database.

[0]: https://nvd.nist.gov/General/News/change-timeline

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v3 -> v4:
- use f-strings
- add meta table instead of tmp file
- drop error handling

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 DEVELOPERS                    |   1 +
 support/scripts/nvd_api_v2.py | 137 ++++++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100755 support/scripts/nvd_api_v2.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..046a022fc9 100644
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
index 0000000000..f50a362f88
--- /dev/null
+++ b/support/scripts/nvd_api_v2.py
@@ -0,0 +1,137 @@
+#!/usr/bin/env python3
+
+from datetime import datetime, timedelta, timezone
+from pathlib import Path
+import requests
+import sqlite3
+import time
+
+NVD_API_VERSION = '2.0'
+NVD_API_BASE_URL = 'https://services.nvd.nist.gov/rest/json'
+# NVD rate limiting allows 5 requests per 30 seconds -> one every 6 seconds.
+NVD_SLEEP_TIME_SEC = 30 / 5
+# Number of minutes that are subtracted from the update timestap given by NVD.
+NVD_TIMESTAMP_SUBTRACT_MINUTES = 1
+# Only update the database if the given number of seconds elapsed.
+NVD_CHECK_TIMEOUT_SECONDS = 120 * 60
+
+
+class NVD_API:
+    """A helper class that fetches data from a NVD API and helps manage a sqlite database.
+
+    This class defines two functions that need to be implemented in a derived class.
+    init_db: Called to create database tables.
+    save_to_db: Called to actually analyse and save the downloaded data."""
+
+    def __init__(self, nvd_path, service, database_file_prefix):
+        """Initialize a new NVD API endpoint.
+
+        nvd_path             - The local path of the database, typically DL_DIR/buildroot-nvd.
+        service              - The service that gets appended to the API URL, should be 'CVEs' or 'CPEs'.
+        database_file_prefix - The prefix of the sqlite database, typically 'nvdcve' or 'nvdcpe'.
+        """
+        self.nvd_path = nvd_path
+        self.service = service
+        self.url = f'{NVD_API_BASE_URL}/{service.lower()}/{NVD_API_VERSION}'
+        self.db_file = Path(nvd_path, f'{database_file_prefix}-{NVD_API_VERSION}.sqlite')
+        self.db_connection = None
+
+    def init_db_meta(self) -> None:
+        """Create the internal meta table that stores the last update date."""
+        self.db_connection.execute('CREATE TABLE IF NOT EXISTS meta ( \
+            id INTEGER UNIQUE, \
+            last_update TIMESTAMP)').close()
+
+    def init_db(self) -> None:
+        """Used to make sure that database tables exist.
+
+        Database connection is active at this point (self.db_connection).
+        Needs to be implemented by derived classes.
+        """
+        pass
+
+    def save_to_db(self, content) -> bool:
+        """Used to save the data given by a single API request to the database.
+
+        content is the json downloaded from NVD.
+        Needs to be implemented by derived classes.
+        """
+        pass
+
+    def download(self, last_update) -> None:
+        """Download all entries from NVD since last_update (if not None).
+
+        For each downloaded page save_to_db is called.
+        """
+        args = {}
+        start_index = 0
+        total_results = 0
+        results_per_page = 0
+
+        print(f'Downloading new {self.service}')
+
+        if (last_update is not None):
+            args['lastModStartDate'] = last_update.isoformat()
+            args['lastModEndDate'] = datetime.now(tz=timezone.utc).isoformat()
+
+        while True:
+            args['startIndex'] = start_index
+
+            page = requests.get(self.url, params=args)
+            page.raise_for_status()
+            content = page.json()
+
+            if content is None:
+                # Nothing was downloaded
+                return False
+
+            results_per_page = content['resultsPerPage']
+            total_results = content['totalResults']
+            start_index = content['startIndex']
+            timestamp = content['timestamp']
+
+            start_index += results_per_page
+
+            # Call the save method of the derived class
+            if not self.save_to_db(content):
+                return False
+
+            print(f'[{start_index:0{len(str(total_results))}}/{total_results}]')
+
+            if start_index >= total_results:
+                # Update the meta table with the timestamp given by NVD but
+                # subtract a minute to make sure nothing is missed the next time.
+                timestamp = datetime.fromisoformat(timestamp) - timedelta(minutes=NVD_TIMESTAMP_SUBTRACT_MINUTES)
+                self.db_connection.execute('INSERT OR REPLACE INTO meta VALUES (0, ?)', (timestamp,)).close()
+                self.db_connection.commit()
+                return True
+
+            self.db_connection.commit()
+
+            # Otherwise rate limiting will be hit.
+            time.sleep(NVD_SLEEP_TIME_SEC)
+
+    def check_for_updates(self) -> None:
+        """Check if new data needs to be fetched from NVD.
+
+        If the last update happened more than 24 hours ago,
+        a new download is triggered.
+        """
+        self.db_connection = sqlite3.connect(self.db_file)
+        self.init_db_meta()
+        self.init_db()
+
+        last_update = None
+        result = self.db_connection.execute('SELECT last_update FROM meta WHERE id = 0').fetchone()
+        if result:
+            # NVD uses UTC without specifying the timezone on their timestamp
+            now = datetime.now(tz=timezone.utc)
+            last_update = datetime.fromisoformat(result[0])
+            delta = now - last_update.replace(tzinfo=timezone.utc)
+            if delta.total_seconds() < NVD_CHECK_TIMEOUT_SECONDS:
+                # Don't run the download if the last update
+                # is less than two hours ago.
+                return
+
+        if not self.download(last_update):
+            print('Update failed!')
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
