From: mlweber1 at rockwellcollins.com <mlweber1@rockwellcollins.com>
Date: Mon, 16 Dec 2013 08:07:45 -0600
Subject: [Buildroot] [PATCH 1/1] smcroute: new package
In-Reply-To: <3a2395ee-73bc-4723-a368-61194e9c0a08@email.android.com>
References: <1386872059-28046-1-git-send-email-mlweber1@rockwellcollins.com>
 <3a2395ee-73bc-4723-a368-61194e9c0a08@email.android.com>
Message-ID: <OF808C467A.175074BD-ON86257C43.004D34F3-86257C43.004D9D54@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 12/15/2013 
02:34:15 PM:

> From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> To: Matt Weber <mlweber1@rockwellcollins.com>, buildroot at busybox.net
> Cc: Sean Gerhardt <sagerhar@rockwellcollins.com>
> Date: 12/15/2013 02:34 PM
> Subject: Re: [Buildroot] [PATCH 1/1] smcroute: new package
> 
> Matt Weber <mlweber1@rockwellcollins.com> wrote:
> >
> >Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
> >Signed-off-by: Sean Gerhardt <sagerhar@rockwellcollins.com>
> >---
> > package/Config.in            |    1 +
> > package/smcroute/Config.in   |   11 +++++++++++
> > package/smcroute/smcroute.mk |   15 +++++++++++++++
> > 3 files changed, 27 insertions(+), 0 deletions(-)
> > create mode 100755 package/smcroute/Config.in
> > create mode 100755 package/smcroute/smcroute.mk
> >
> >diff --git a/package/Config.in b/package/Config.in
> >index 40c9e31..fd04224 100644
> >--- a/package/Config.in
> >+++ b/package/Config.in
> >@@ -880,6 +880,7 @@ source "package/rtptools/Config.in"
> > source "package/samba/Config.in"
> > source "package/sconeserver/Config.in"
> > source "package/ser2net/Config.in"
> >+source "package/smcroute/Config.in"
> > source "package/socat/Config.in"
> > source "package/socketcand/Config.in"
> > source "package/spawn-fcgi/Config.in"
> >diff --git a/package/smcroute/Config.in b/package/smcroute/Config.in
> >new file mode 100755
> >index 0000000..a66cb94
> >--- /dev/null
> >+++ b/package/smcroute/Config.in
> >@@ -0,0 +1,11 @@
> >+config BR2_PACKAGE_SMCROUTE
> >+   bool "smcroute"
> >+   help
> >+     SMCRoute is a command line tool to manipulate the multicast
> >+     routes of a UNI kernel. It supports both IPv4 and IPv6 multicast
> >+     routing.  SMCRoute can be  used as an alternative to dynamic
> 
> Twice double space on this line.
Agreed.

> 
> >+     multicast routers like mrouted or pimd in setups where static
> >+     multicast routes should be maintained and/or no proper IGMP or
> >+     MLD signaling exists.
> >+
> >+     https://github.com/troglobit/smcroute
> >diff --git a/package/smcroute/smcroute.mk 
b/package/smcroute/smcroute.mk
> >new file mode 100755
> >index 0000000..82efa81
> >--- /dev/null
> >+++ b/package/smcroute/smcroute.mk
> >@@ -0,0 +1,16 @@
> >
> 
+################################################################################
> >+#
> >+# smcroute
> >+#
> >
> 
+################################################################################
> >+SMCROUTE_VERSION =  1.99.2
> 
> Double space
Agreed.

> 
> >+SMCROUTE_SITE = $(call github,troglobit,smcroute,$(SMCROUTE_VERSION))
> >+SMCROUTE_SOURCE = 
troglobit-smcroute-$(SMCROUTE_VERSION)-0-g58388f6.tar.gz
> 
> Why is it needed to specify _SOURCE here? It shouldn't be .. 
It seems like the releases are labeled in a way that requires this. 
Without 
specifying the source archive name, the archive that's requested to be 
downloaded
"smcroute-$(SMCROUTE_VERSION).tar.gz" ends up as the file we noted as the 
SOURCE.

Thanks,
Matt Weber
mlweber1 at rockwellcollins.com
