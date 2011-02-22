From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Feb 2011 00:40:11 +0100
Subject: [Buildroot] [git commit master 1/1] package/multimedia: mark
	festival packages as broken
Message-ID: <20110222234940.283838F5A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a6ada2c94667fd6e1030cfeffd088703b263ddf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After spending a couple of hours on it today, I'm still unable to get
speech-tools to build and install properly with a uClibc toolchain.

So I'm giving up. Mark the entire thing broken as the text-to-speech
stuff is unlikely to be used very much on the kind of small systems
we're targetting.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/festival/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/festival/Config.in b/package/multimedia/festival/Config.in
index 2be32f9..e05fde9 100644
--- a/package/multimedia/festival/Config.in
+++ b/package/multimedia/festival/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_FESTIVAL
 	bool "festival text-to-speech system"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BROKEN # doesn't build
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_SPEECH_TOOLS
 	help
-- 
1.7.3.4
