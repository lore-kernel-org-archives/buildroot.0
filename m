From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 21:11:34 +0200
Subject: [Buildroot] [git commit] Config.in: add BR2_HOST_GCC_AT_LEAST_4_5
Message-ID: <20161026191410.B7DF581E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e488b56cffa33ae4cd2bb4f7dd954dde0e28b2d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In preparation to the addition of new dependencies in the
kvm-unit-tests package, add the BR2_HOST_GCC_AT_LEAST_4_5 symbol.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 21173b7..5cf0c4d 100644
--- a/Config.in
+++ b/Config.in
@@ -23,9 +23,14 @@ config BR2_HOST_GCC_VERSION
 	string
 	option env="HOST_GCC_VERSION"
 
+config BR2_HOST_GCC_AT_LEAST_4_5
+	bool
+	default y if BR2_HOST_GCC_VERSION = "4 5"
+
 config BR2_HOST_GCC_AT_LEAST_4_6
 	bool
 	default y if BR2_HOST_GCC_VERSION = "4 6"
+	select BR2_HOST_GCC_AT_LEAST_4_5
 
 config BR2_HOST_GCC_AT_LEAST_4_7
 	bool
