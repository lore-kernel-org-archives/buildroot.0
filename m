From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:39:51 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/python-requests:
 needs hashlib for python 2
Message-ID: <20180501073419.2776A7FE7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56ef4bd820c3a1448a70af0a5d40cd8648abacff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Requests need hashlib to run with Python 2. Otherwise it is not possible to
import, due to missing e.g. md5.

[Peter: tweak commit message]
Signed-off-by: Sven Haardiek <sven.haardiek@iotec-gmbh.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 2c2f6f6630294fa256a4f66db5a4ab1f920b0a65)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-requests/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index d2726fb26a..30158b8d25 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_REQUESTS
 	select BR2_PACKAGE_PYTHON_CHARDET # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
