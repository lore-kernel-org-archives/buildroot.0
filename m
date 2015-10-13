From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:27:13 +0200
Subject: [Buildroot] [PATCH] connman: add missing dbus system bus
 configuration
In-Reply-To: <1444747538-2996-2-git-send-email-mike@mikebwilliams.com>
References: <1444747538-2996-1-git-send-email-mike@mikebwilliams.com>
 <1444747538-2996-2-git-send-email-mike@mikebwilliams.com>
Message-ID: <20151013232713.465c1f48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Tue, 13 Oct 2015 10:45:38 -0400, Mike Williams wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  package/connman/connman.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks for the patch. However, I believe it's not the proper way of
solving the problem. Can you try the below patch instead:

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 87d81ce..3b14a80 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -12,6 +12,7 @@ CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPLv2
 CONNMAN_LICENSE_FILES = COPYING
 CONNMAN_CONF_OPTS += \
+       --with-dbusconfdir=/etc \
        $(if $(BR2_PACKAGE_CONNMAN_DEBUG),--enable-debug,--disable-debug)               \
        $(if $(BR2_PACKAGE_CONNMAN_ETHERNET),--enable-ethernet,--disable-ethernet)      \
        $(if $(BR2_PACKAGE_CONNMAN_WIFI),--enable-wifi,--disable-wifi)                  \

This will make Connman automatically install its D-Bus configuration
file in /etc/dbus-1/system.d/.

If it works for you, can you send a new version of the patch? For this
new version, please include the explanation *inside* the commit log,
and not in the cover letter.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
