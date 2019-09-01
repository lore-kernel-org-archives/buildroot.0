From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Sep 2019 22:06:15 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/collectd:
 security bump to version 5.7.2
Message-ID: <20190901200423.5B14288DB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91bb43f529bb13ac7f4f648d2233b35468fb5c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issue:

- CVE-2017-7401: Incorrect interaction of the parse_packet() and
  parse_part_sign_sha256() functions in network.c in collectd 5.7.1 and
  earlier allows remote attackers to cause a denial of service (infinite
  loop) of a collectd instance (configured with "SecurityLevel None" and
  with empty "AuthFile" options) via a crafted UDP packet

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.hash | 2 +-
 package/collectd/collectd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/collectd/collectd.hash b/package/collectd/collectd.hash
index cf7e0b83f9..08682b6bc1 100644
--- a/package/collectd/collectd.hash
+++ b/package/collectd/collectd.hash
@@ -1,5 +1,5 @@
 # From https://collectd.org/files/SHA256SUM
-sha256	7edd3643c0842215553b2421d5456f4e9a8a58b07e216b40a7e8e91026d8e501	collectd-5.7.1.tar.bz2
+sha256	9d20a0221569a8d6b80bbc52b86e5e84965f5bafdbf5dfc3790e0fed0763e592	collectd-5.7.2.tar.bz2
 
 # Hash for license files
 sha256	ed0409b2b1c30566dab5fcdaf46ee70e140c99788e22f0267645a9357b476ae4	COPYING
diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index a6ffb8644d..7b2a517268 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COLLECTD_VERSION = 5.7.1
+COLLECTD_VERSION = 5.7.2
 COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
