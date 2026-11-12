Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BDD606A31C
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AUY0fSTj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9526409BE;
	Thu, 12 Nov 2026 14:59:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLCJpzJSW8Wa; Thu, 12 Nov 2026 14:59:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F382A40AC8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794495563;
	b=khRLWTkgkgPTEF+vZdJzEFeeu9DyhbhfgZMDsGETdn+L4s/+POQY6k+3tjGP5q+q0lfY
	 T+qLXaKPDlLaVIge4UdMWdwC1NGMjClEGhJQgAdxtZC+w4fqwrduQPEUfvB2srEjbGGB5
	 fRkv0gJAtsw9w26WX69gMtB+XdNw0eafPNQTdwImagHv4rPcoNT/o/k6F0ZSbMNtIfr6N
	 ZB8su1fNXJOPhBP7pqOPFHGj3MqVF1fb0ngzN/hUKAiiknPMpL9MPrikqDJhwSW4KVifn
	 w9PQN3/SkhcXcdBytfKRmy+pLlERatUCdxIVp/FQIP7xLIFjUz3QytG7eaUQ3T+o+hA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794495563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FMA56Z07V+LpxoUTOlmyGCqz+YfE/by8vmabAZvIsAs=;
	b=cZHFvtXrUDLBYZU+NrDhPM70dSGnKffUMVBZxGZ+l6ZK9cuYgfLhVOBnxXZUyylnyhcP
	 MThpKwCuqIZwkvQ7kQaMjZs3k0Q6xVv4Rfh6Nd4SZ8XkS8REA3QNRJneOvT8yDhte0aJ2
	 WvbBlRxtC7Ead+tQr+362f5xB8gO0gBT/zAD4ugbw/vND8mvZ5N0Q6CiHnEfCsFLVrBBG
	 VDWICiQRqg7qmZPA2AYP8tQl0SYXky7nGvshqczntIreqXz+dt8Mjk2SBBvO291oBlO+D
	 2WU9Q1wdeqWsrcpstoHkYaqGj1a2dZYB6okQtMv7mQsmN46+ExMF4EPmtPaAru74u2g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794495563;
	bh=FMA56Z07V+LpxoUTOlmyGCqz+YfE/by8vmabAZvIsAs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AUY0fSTjvBvturP/1uop35YCW3EACepTGjVyoEJPXWWUkjMWQwAEdcRzxRTVNLIJK
	 6zo8VPDWP2iRHzsM0bDld95nhJHORqC+7xJ0lFe281urbZ68PmPndxq7rJuVU0mOJz
	 pD9h51WsQK0jC6cZ8T3xjOqQ7+M+mi2i2bKsLvfZov4eXhQVVmSjOTZJQQxogEJBvr
	 2VJWtX8D4rGZyIQmNQ4JmeH3QtObyKfKoGCXKZpna5Jh6TLMRC11B3suTK7kjbtT7y
	 FPjlo73F6ZgzmoSgoevvXR5TTDgTFaNYjMiBTaI2b9zEhGO9ds9d9WwklZbDsfAZc2
	 /AK27RgLRKdGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F382A40AC8;
	Thu, 12 Nov 2026 14:59:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF12A156
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 14:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFD8860751
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 14:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvAffoH5nLTL for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 14:59:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 49206606DE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49206606DE
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 14:59:18 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3EE2E5FFA3;
 Thu, 12 Nov 2026 15:59:15 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 12 Nov 2026 15:59:09 +0100
Message-ID: <20261112145909.505297-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/testing: postgis: new runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/17971315092
---
 DEVELOPERS                                    |   1 +
 support/testing/tests/package/test_postgis.py | 148 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 support/testing/tests/package/test_postgis.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 84298a36ab..1d2960f9b3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2045,6 +2045,7 @@ F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_php.py
 F:	support/testing/tests/package/test_php/
 F:	support/testing/tests/package/test_pigz.py
+F:	support/testing/tests/package/test_postgis.py
 F:	support/testing/tests/package/test_postgresql.py
 F:	support/testing/tests/package/test_pppd.py
 F:	support/testing/tests/package/test_pppd/
diff --git a/support/testing/tests/package/test_postgis.py b/support/testing/tests/package/test_postgis.py
new file mode 100644
index 0000000000..6bb5e8b296
--- /dev/null
+++ b/support/testing/tests/package/test_postgis.py
@@ -0,0 +1,148 @@
+import os
+
+import infra.basetest
+
+
+class TestPostGIS(infra.basetest.BRTest):
+    # We use a specific configuration for:
+    # - using Aarch64, to have more than 256MB memory,
+    # - to have an ext4 rootfs image exposed as a virtio storage
+    #   (rather than cpio initrd). This will save some memory, as the
+    #   rootfs image is big.
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.63"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_POSTGIS=y
+        BR2_PACKAGE_POSTGRESQL=y
+        BR2_PACKAGE_POSTGRESQL_FULL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def __init__(self, names):
+        super(TestPostGIS, self).__init__(names)
+        self.db_admin = "postgres"
+        self.db_user = "br_user"
+        self.db_name = "br_database"
+        self.backup_file = "dump.sql"
+        self.pgdata_dir = "/var/lib/pgsql"
+
+    def get_psql_cmd(self, user, database, query, opts=None):
+        cmd = f"psql --username={user} --dbname={database}"
+        cmd += f' --command="{query}"'
+        if opts is not None:
+            cmd += " " + opts
+        return cmd
+
+    def run_user_db_query(self, user, database, query, opts=None):
+        cmd = self.get_psql_cmd(user, database, query, opts)
+        self.assertRunOk(cmd)
+
+    def run_admin_sql_query(self, query, opts=None):
+        self.run_user_db_query(self.db_admin, self.db_admin, query, opts)
+
+    def run_sql_query(self, query, opts=None):
+        self.run_user_db_query(self.db_user, self.db_name, query, opts)
+
+    def cleanup_database(self):
+        # This cleanup is useful when run-test -k is used. It makes
+        # this test idempotent. Since the drive storage is preserved
+        # between reboots, this cleanup will prevent errors during the
+        # user/db creation.
+
+        # Drop the test database, if it exists.
+        cmd = f"dropdb --username={self.db_admin} "
+        cmd += f"--if-exists {self.db_name}"
+        self.assertRunOk(cmd)
+
+        # Drop the test user, if it exists.
+        cmd = f"dropuser --username={self.db_admin} "
+        cmd += f"--if-exists {self.db_user}"
+        self.assertRunOk(cmd)
+
+    def create_tables(self):
+        sql_query = "CREATE TABLE my_points ("
+        sql_query += "id SERIAL PRIMARY KEY, geom geometry);"
+        self.run_sql_query(sql_query)
+
+        sql_query = "CREATE TABLE my_poly ("
+        sql_query += "id SERIAL PRIMARY KEY, geom geometry);"
+        self.run_sql_query(sql_query)
+
+    def insert_data(self):
+        # We create 9 points on a 3x3 grid.
+        for x in range(0, 41, 20):
+            for y in range(0, 41, 20):
+                sql_query = "INSERT INTO my_points (geom) "
+                sql_query += f"VALUES ('POINT ({x} {y})');"
+                self.run_sql_query(sql_query)
+
+        # We create a square polygon which only overlap one point.
+        sql_query = "INSERT INTO my_poly (geom) "
+        sql_query += "VALUES ('POLYGON ((30 10, 30 30, 10 30, 10 10, 30 10))');"
+        self.run_sql_query(sql_query)
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-m", "512M",
+                                    "-smp", "2",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # Check the postgresql server is ready.
+        self.assertRunOk("pg_isready")
+
+        # Query the server version from the client.
+        sql_query = "SELECT version();"
+        self.run_admin_sql_query(sql_query,
+                                 opts="--tuples-only --no-align")
+
+        self.cleanup_database()
+
+        # Create a new user.
+        cmd = f"createuser --username={self.db_admin} "
+        cmd += "--no-superuser --no-createdb --no-createrole "
+        cmd += self.db_user
+        self.assertRunOk(cmd)
+
+        # Create a new database.
+        cmd = f"createdb --username={self.db_admin} "
+        cmd += f"--owner={self.db_user} "
+        cmd += f'{self.db_name} "Test Database for Buildroot Test"'
+        self.assertRunOk(cmd)
+
+        # Enable PostGIS in the new database.
+        sql_query = "CREATE EXTENSION IF NOT EXISTS postgis;"
+        self.run_user_db_query(self.db_admin, self.db_name, sql_query)
+
+        # Query the postgis extension version
+        sql_query = "SELECT postgis_version();"
+        self.run_sql_query(sql_query, opts="--tuples-only --no-align")
+
+        self.create_tables()
+        self.insert_data()
+
+        # We query which point intersects the square.
+        sql_query = "SELECT ST_AsText(my_points.geom) "
+        sql_query += "FROM my_points, my_poly "
+        sql_query += "WHERE ST_Intersects(my_points.geom, my_poly.geom);"
+        cmd = self.get_psql_cmd(self.db_user, self.db_name, sql_query,
+                                opts="--tuples-only --no-align")
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "POINT(20 20)")
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
