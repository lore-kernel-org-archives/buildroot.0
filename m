From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 19 Oct 2007 01:21:15 +0300
Subject: [Buildroot] Ignored patches - WHY?
In-Reply-To: <a63ecaf0710180612n7f2de529g361b037b40c34727@mail.gmail.com>
References: <a63ecaf0710180612n7f2de529g361b037b40c34727@mail.gmail.com>
Message-ID: <4717DC5B.9000508@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sushi Sensei wrote:
> I have send some patches ( 0001534, 0001533, 0001532) this week with
> the Patch Tracking page, the week before I have send the same patches
> without notices of this inclusion or error, some patch was send 2 or 3
> week before and was ignored... There are some problem with this
> patches??

Hi Sushi,

I'm sorry I can not apply this patch : br2-olsr.patch:

Index: package/olsr/S50olsr
===================================================================
--- package/olsr/S50olsr        (revisi?n: 20228)
+++ package/olsr/S50olsr        (copia de trabajo)
@@ -6,7 +6,7 @@
 case "$1" in
   start)
        echo "Starting OLSRd daemon: "
-       /usr/sbin/olsrd -d 0 -nofork &
+       /usr/bin/olsrd -d 0 -nofork &
        ;;
   stop)
        echo "Stopping OLSRd daemon: "

-- 

Because an daemon should reside in /usr/sbin directory ,
please check other buildroot packages such as dropbear, mdnsresponder, and so on - they are all in sbin dir.
You should change OLSR_TARGET_BINARY:=usr/bin/olsrd instead.

Please adjust and resubmit.
Thanks!

Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
