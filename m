From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Mar 2012 23:02:21 +0100
Subject: [Buildroot] [PATCH 4/5] Fix installation for the lighttpd
	package
In-Reply-To: <572e22d29e9c195b39b38256f7ca024eb7e54110.1332408273.git.maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Thu, 22 Mar 2012 10:27:19 +0100")
References: <cover.1332408273.git.maxime.ripard@free-electrons.com>
 <cover.1332408273.git.maxime.ripard@free-electrons.com>
 <572e22d29e9c195b39b38256f7ca024eb7e54110.1332408273.git.maxime.ripard@free-electrons.com>
Message-ID: <87mx781ehe.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 Maxime> ++++ lighttpd-1.4.30/doc/config/lighttpd.conf	2012-03-22 09:55:31.402424839 +0100

Please add a git-style description of what the patch does and your
signed-off-by.


 Maxime> +@@ -13,7 +13,7 @@
 Maxime> + ## if you add a variable here. Add the corresponding variable in the
 Maxime> + ## chroot example aswell.
 Maxime> + ##
 Maxime> +-var.log_root    = "/var/log/lighttpd"
 Maxime> ++var.log_root    = "/var/log"
 Maxime> + var.server_root = "/srv/www"
 Maxime> + var.state_dir   = "/var/run"
 Maxime> + var.home_dir    = "/var/lib/lighttpd"
 Maxime> +@@ -90,7 +90,7 @@
 Maxime> + ##
 Maxime> + ## Use IPv6?
 Maxime> + ##
 Maxime> +-server.use-ipv6 = "enable"
 Maxime> ++# server.use-ipv6 = "enable"
 Maxime> + 
 Maxime> + ##
 Maxime> + ## bind to a specific IP
 Maxime> +@@ -101,8 +101,8 @@
 Maxime> + ## Run as a different username/groupname.
 Maxime> + ## This requires root permissions during startup. 
 Maxime> + ##
 Maxime> +-server.username  = "lighttpd"
 Maxime> +-server.groupname = "lighttpd"
 Maxime> ++# server.username  = "lighttpd"
 Maxime> ++# server.groupname = "lighttpd"
 Maxime> + 
 Maxime> + ## 
 Maxime> + ## enable core files.
 Maxime> +@@ -138,7 +138,7 @@
 Maxime> + ##
 Maxime> + ## Path to the error log file
 Maxime> + ##
 Maxime> +-server.errorlog             = log_root + "/error.log"
 Maxime> ++server.errorlog             = log_root + "/lighttpd-error.log"

Why? The access log is still called access.log, so why rename this?

 Maxime> + 
 Maxime> + ##
 Maxime> + ## If you want to log to syslog you have to unset the 
 Maxime> +@@ -188,7 +188,7 @@
 Maxime> + ## linux-sendfile - is recommended for small files.
 Maxime> + ## writev         - is recommended for sending many large files
 Maxime> + ##
 Maxime> +-server.network-backend = "linux-sendfile"
 Maxime> ++server.network-backend = "writev"

Why?

-- 
Bye, Peter Korsgaard
