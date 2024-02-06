Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CC5C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED21A61065;
	Tue,  6 Feb 2024 20:50:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gy9IYQWauWEo; Tue,  6 Feb 2024 20:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B963460BA6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B963460BA6;
	Tue,  6 Feb 2024 20:50:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4FCF1BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1BC34070B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:50:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jb9Nbjj1RDVP for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA164011D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AA164011D
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:50:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54D47873BD; Tue,  6 Feb 2024 20:50:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 21:49:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46a985eb4dacac201dfc8b2b8d272ee3112ef80f
X-Git-Newrev: 9add4cbfeaafaf3b1c31140429278cd68bd72150
X-Patchwork-Hint: ignore
Message-Id: <20240206205007.54D47873BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add a postgresql runtime
 test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9add4cbfeaafaf3b1c31140429278cd68bd72150
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                       |   1 +
 support/testing/tests/package/test_postgresql.py | 197 +++++++++++++++++++++++
 2 files changed, 198 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4b8d195f9f..d0ab37f5c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1821,6 +1821,7 @@ F:	support/testing/tests/package/test_openblas.py
 F:	support/testing/tests/package/test_pciutils.py
 F:	support/testing/tests/package/test_perftest.py
 F:	support/testing/tests/package/test_pigz.py
+F:	support/testing/tests/package/test_postgresql.py
 F:	support/testing/tests/package/test_python_distro.py
 F:	support/testing/tests/package/test_python_gnupg.py
 F:	support/testing/tests/package/test_python_hkdf.py
diff --git a/support/testing/tests/package/test_postgresql.py b/support/testing/tests/package/test_postgresql.py
new file mode 100644
index 0000000000..bd41fc3f1b
--- /dev/null
+++ b/support/testing/tests/package/test_postgresql.py
@@ -0,0 +1,197 @@
+import os
+
+import infra.basetest
+
+
+class TestPostgreSQL(infra.basetest.BRTest):
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
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.72"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_PACKAGE_POSTGRESQL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def __init__(self, names):
+        super(TestPostgreSQL, self).__init__(names)
+        self.db_admin = "postgres"
+        self.db_user = "br_user"
+        self.db_name = "br_database"
+        self.backup_file = "dump.sql"
+        self.pgdata_dir = "/var/lib/pgsql"
+
+    def run_user_db_query(self, user, database, query, opts=None):
+        cmd = f"psql --username={user} --dbname={database}"
+        cmd += f' --command="{query}"'
+        if opts is not None:
+            cmd += " " + opts
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
+        sql_query = "CREATE TABLE fruits ("
+        sql_query += "id integer PRIMARY KEY, name varchar(16) NOT NULL);"
+        self.run_sql_query(sql_query)
+
+        sql_query = "CREATE TABLE colors ("
+        sql_query += "id integer PRIMARY KEY, name varchar(16) NOT NULL);"
+        self.run_sql_query(sql_query)
+
+        sql_query = "CREATE TABLE fruit_colors ("
+        sql_query += "fruit_id integer REFERENCES fruits(id), "
+        sql_query += "color_id integer REFERENCES colors(id), "
+        sql_query += "UNIQUE (fruit_id, color_id));"
+        self.run_sql_query(sql_query)
+
+    def insert_data(self):
+        fruits = ["Banana", "Blueberry", "Orange", "Raspberry"]
+        fruit_id = 1
+        for fruit in fruits:
+            sql_query = "INSERT INTO fruits (id, name) "
+            sql_query += f"VALUES ({fruit_id}, '{fruit}');"
+            self.run_sql_query(sql_query)
+            fruit_id += 1
+
+        colors = ["Blue", "Orange", "Red", "Yellow"]
+        color_id = 1
+        for color in colors:
+            sql_query = "INSERT INTO colors (id, name) "
+            sql_query += f"VALUES ({color_id}, '{color}');"
+            self.run_sql_query(sql_query)
+            color_id += 1
+
+        fruit_colors = [(1, 4), (2, 1), (3, 2), (4, 3)]
+        for fruit_color in fruit_colors:
+            fruit_id, color_id = fruit_color
+            sql_query = "INSERT INTO fruit_colors (fruit_id, color_id) "
+            sql_query += f"VALUES ({fruit_id}, {color_id});"
+            self.run_sql_query(sql_query)
+
+    def query_database(self):
+        sql_query = "SELECT "
+        sql_query += "fruits.name AS fruit, colors.name AS color "
+        sql_query += "FROM fruits, colors, fruit_colors "
+        sql_query += "WHERE fruits.id = fruit_colors.fruit_id "
+        sql_query += "AND colors.id = fruit_colors.color_id "
+        sql_query += "ORDER BY fruit;"
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
+        # Check the server binary can execute.
+        self.assertRunOk("postgres --version")
+
+        # Check the client binary can execute.
+        self.assertRunOk("psql --version")
+
+        # Check the server is ready.
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
+        self.create_tables()
+
+        self.insert_data()
+
+        self.query_database()
+
+        # Update a table.
+        sql_query = "UPDATE fruits SET name = 'Lemon' WHERE id = 1;"
+        self.run_sql_query(sql_query)
+
+        # Backup the test database.
+        cmd = f"pg_dump --username={self.db_user} --dbname={self.db_name} "
+        cmd += f"--file={self.backup_file} --inserts"
+        self.assertRunOk(cmd)
+
+        # Drop all the tables.
+        sql_query = "DROP TABLE fruit_colors, fruits, colors;"
+        self.run_sql_query(sql_query)
+
+        # Query the server status.
+        cmd = f"su - {self.db_admin} -c 'pg_ctl status -D {self.pgdata_dir}'"
+        self.assertRunOk(cmd)
+
+        # Stop the server.
+        cmd = f"su - {self.db_admin} -c 'pg_ctl stop -D {self.pgdata_dir}'"
+        self.assertRunOk(cmd)
+
+        # Check the server is no longer ready.
+        _, exit_code = self.emulator.run("pg_isready")
+        self.assertNotEqual(exit_code, 0)
+
+        # Restart the server.
+        cmd = f"su - {self.db_admin} -c 'pg_ctl start -D {self.pgdata_dir}'"
+        self.assertRunOk(cmd)
+
+        # Restore the backup.
+        cmd = f"psql --username={self.db_user} --dbname={self.db_name} "
+        cmd += f"--file={self.backup_file}"
+        self.assertRunOk(cmd)
+
+        # Query on last time our data, to check the backup restoration
+        # succeeded.
+        self.query_database()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
