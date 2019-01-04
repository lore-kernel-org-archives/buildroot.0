From: David J. Fogle <Dave@exitstrategytech.com>
Date: Fri, 4 Jan 2019 18:16:59 +0000
Subject: [Buildroot] [PATCH] systemd: set vconsole support option to default
 y
Message-ID: <8e4371b94ff9458b901d240de1c97cce@exitstrategytech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patch defaults the systemd vconsole support option to y. The reasoning is a matter of convention, Linux systems have vconsoles in almost all cases. Personally, I spent a few hours feeling I had broken something when I was switching to systemd. In an effort to prevent future buildroot users from suffering this fate, we are enabling this support by default, as it is far less likely to *not* want vterms, and if that is the use-case, it can be disabled as needed. 

Signed-off-by: David Fogle <david.j.fogle@gmail.com>
---
?package/systemd/Config.in | 1 +
?1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 25f322e8f3..920b65db44 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -325,6 +325,7 @@ config BR2_PACKAGE_SYSTEMD_TMPFILES
?
?config BR2_PACKAGE_SYSTEMD_VCONSOLE
??????? bool "enable vconsole tool"
+?????? default y
??????? help
????????? systemd-vconsole-setup is an early boot service that
????????? configures the virtual console font and console keymap.
-- 
2.19.2
