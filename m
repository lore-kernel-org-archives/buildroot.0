From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 22:11:09 +0100
Subject: [Buildroot] [git commit] scanpypi: get rid of commented lines and
 also strip the package strings
Message-ID: <20180118211116.0B58E83EE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2e29fccdffbbd9e9a0a9749d91e368a2b091910
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/scanpypi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index 765bfdc..88fcb4a 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -293,6 +293,10 @@ class BuildrootPackage():
         self.pkg_req = self.setup_metadata['install_requires']
         self.pkg_req = [re.sub('([-.\w]+).*', r'\1', req)
                         for req in self.pkg_req]
+
+        # get rid of commented lines and also strip the package strings
+        self.pkg_req = [item.strip() for item in self.pkg_req if item[0] != '#']
+
         req_not_found = self.pkg_req
         self.pkg_req = map(pkg_buildroot_name, self.pkg_req)
         pkg_tuples = zip(req_not_found, self.pkg_req)
