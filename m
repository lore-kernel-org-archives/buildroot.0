From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 22 Oct 2017 09:17:16 +0200
Subject: [Buildroot] [V3 3/3] prosody: tweak configuration
In-Reply-To: <20171022071716.792-1-francois.perrad@gadz.org>
References: <20171022071716.792-1-francois.perrad@gadz.org>
Message-ID: <20171022071716.792-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

done by patches:
  - enable syslog
  - add pidfile

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/prosody/0001-enable-syslog.patch | 22 ++++++++++++++++++++++
 package/prosody/0002-add-pidfile.patch   | 21 +++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 package/prosody/0001-enable-syslog.patch
 create mode 100644 package/prosody/0002-add-pidfile.patch

diff --git a/package/prosody/0001-enable-syslog.patch b/package/prosody/0001-enable-syslog.patch
new file mode 100644
index 000000000..af67f0f03
--- /dev/null
+++ b/package/prosody/0001-enable-syslog.patch
@@ -0,0 +1,22 @@
+enable syslog
+
+note: the posix module is auto-loaded by default
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
+index a0fc6c9e..af3cc0e4 100644
+--- a/prosody.cfg.lua.dist
++++ b/prosody.cfg.lua.dist
+@@ -163,7 +163,7 @@ archive_expires_after = "1w" -- Remove archived messages after 1 week
+ log = {
+ 	info = "prosody.log"; -- Change 'info' to 'debug' for verbose logging
+ 	error = "prosody.err";
+-	-- "*syslog"; -- Uncomment this for logging to syslog
++	"*syslog"; -- Uncomment this for logging to syslog
+ 	-- "*console"; -- Log to the console, useful for debugging with daemonize=false
+ }
+ 
+-- 
+2.11.0
+
diff --git a/package/prosody/0002-add-pidfile.patch b/package/prosody/0002-add-pidfile.patch
new file mode 100644
index 000000000..cc8d12ee9
--- /dev/null
+++ b/package/prosody/0002-add-pidfile.patch
@@ -0,0 +1,21 @@
+add pidfile
+
+see https://prosody.im/doc/configure#posix-only_options
+
+diff --git a/prosody.cfg.lua.dist b/prosody.cfg.lua.dist
+index af3cc0e4..675db12f 100644
+--- a/prosody.cfg.lua.dist
++++ b/prosody.cfg.lua.dist
+@@ -181,6 +181,9 @@ log = {
+ -- Location of directory to find certificates in (relative to main config file):
+ certificates = "certs"
+ 
++-- This must match the PIDFILE used in S50prosody
++pidfile = "/var/run/prosody/prosody.pid"
++
+ ----------- Virtual hosts -----------
+ -- You need to add a VirtualHost entry for each domain you wish Prosody to serve.
+ -- Settings under each VirtualHost entry apply *only* to that host.
+-- 
+2.11.0
+
-- 
2.11.0
