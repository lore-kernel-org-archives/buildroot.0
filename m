From: Heiko Thiery <Heiko.Thiery@kontron.com>
Date: Sun, 27 Oct 2019 07:55:26 +0000
Subject: [Buildroot] [PATCH] package/softether: remove 'v' prefix from
 github-fetched packages
In-Reply-To: <20191027063929.14361-1-matthew.weber@rockwellcollins.com>
References: <20191027063929.14361-1-matthew.weber@rockwellcollins.com>
Message-ID: <5bc8de3d68584062a125116170628767@kontron.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

utils/test-pkg -k -p softether fails

ERROR: No hash found for pru-software-support-5.1.0.tar.gz
make: *** [package/pkg-generic.mk:146: /home/hthiery/br-test-pkg/br-arm-full/build/host-pru-software-support-5.1.0/.stamp_downloaded] Fehler 1

I think the problem is when <pkg>_SOURCE is not explicitly specified it will be generated with the $(VERSION) without the 'v' that does not match the filename in the hash file.


--

Heiko

________________________________
From: Matt Weber <matthew.weber@rockwellcollins.com>
Sent: Sunday, October 27, 2019 7:39:29 AM
To: buildroot at buildroot.org
Cc: Matt Weber; Heiko Thiery
Subject: [PATCH] package/softether: remove 'v' prefix from github-fetched packages

Fixes version parsing for release-monitoring.org support.

Cc: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

---
Thanks Heiko for the script that found this one!
---
 package/softether/softether.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 1a31abd4bd..b7c6738b9a 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################

-SOFTETHER_VERSION = v4.28-9669-beta
-SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
+SOFTETHER_VERSION = 4.28-9669-beta
+SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,v$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-pkgconf host-softether libopenssl readline
--
2.17.1

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191027/b3f3a9e6/attachment.html>
