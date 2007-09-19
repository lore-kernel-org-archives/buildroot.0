From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 16:01:25 +0200
Subject: [Buildroot] OLSR in buildroot - patch 02
In-Reply-To: <a63ecaf0709190643kd2b7a2fh7bcec0fd980c048f@mail.gmail.com>
References: <a63ecaf0709190643kd2b7a2fh7bcec0fd980c048f@mail.gmail.com>
Message-ID: <20070919140125.GB23465@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 10:43:09AM -0300, Sushi Sensei wrote:
>Added Config.in patch and some changes more
>-- 
>------------------------------------------------------
>--- Timeo Danaos et dona ferentes ---
>------------------------------------------------------

>Index: package/Config.in
>===================================================================
>--- package/Config.in	(revisi??n: 19874)
>+++ package/Config.in	(copia de trabajo)
>@@ -122,6 +122,7 @@
> 	  Support for networking and related packages
> 
> if BR2_NETWORK_SUPPORT
>+source "package/olsr/Config.in"
> source "package/argus/Config.in"
> source "package/avahi/Config.in"
> source "package/boa/Config.in"
>Index: package/olsr/files/S50olsr
>===================================================================
>--- package/olsr/files/S50olsr	(revisi??n: 0)
>+++ package/olsr/files/S50olsr	(revisi??n: 0)
>@@ -0,0 +1,22 @@
>+#!/bin/sh
>+#
>+# Starts OLSRD deamon
>+#
>+case "$1" in
>+  start)
>+  	echo -n "Starting OLSRd deamon: "
>+	start-stop-daemon --start --quiet --pidfile /var/run/olsrd.pid --exec /usr/sbin/olsrd

NAK, for the third time.
