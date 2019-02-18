From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 23:26:19 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/systemd: set
 vconsole support option to default y
Message-ID: <20190218222426.583B9821ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8f80ebb4d0eb0c5c7689a3c1532314a9e560f96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Without support for vconsole, systemd will abruptly kill anything
spawned on the console, thus preventing users from loging in from
the console, effectively locking them out if the target does not
have another mean of logging in (no sshd, no serial line...)

We fix that by making support for vconsole default to y, since
logging in from the console if more frequent than not. Users can
still de-activate it when they know they don't need it.

Note that logging from a serial line is not impacted, and still
works whether vconsole is enabled or not.

Signed-off-by: David Fogle <david.j.fogle@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fc0787e76ea236a5e7469df4e26c1ca61624b873)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7b613df02c..807269b385 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -321,6 +321,7 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
 
 config BR2_PACKAGE_SYSTEMD_VCONSOLE
 	bool "enable vconsole tool"
+	default y
 	help
 	  systemd-vconsole-setup is an early boot service that
 	  configures the virtual console font and console keymap.
