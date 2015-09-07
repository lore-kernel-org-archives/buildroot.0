From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Sep 2015 09:01:35 +0100
Subject: [Buildroot] [PATCHv4 1/2] udisks: bump to version 1.0.5
In-Reply-To: <87y4gklrzq.fsf@dell.be.48ers.dk>
References: <1441203680-29193-1-git-send-email-Vincent.Riera@imgtec.com>
 <87y4gklrzq.fsf@dell.be.48ers.dk>
Message-ID: <55ED445F.7040905@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On 09/05/2015 06:02 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > This version depends on libgudev when using systemd, otherwise it fails
>  > with an error like this one:
> 
>  > checking for GUDEV... no
>  > configure: error: Package requirements (gudev-1.0 >= 147) were not met:
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  > ---
>  > Changes v3 -> v4: improve the libgudev dependency comment [Thomas]
>  > Changes v2 -> v3: add a comment about the libgudev dependency
>  > Changes v1 -> v2: depend on libgudev when using systemd
> 
>  > +++ b/package/udisks/udisks.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>  
>  > -UDISKS_VERSION = 1.0.4
>  > +UDISKS_VERSION = 1.0.5
>  >  UDISKS_SITE = http://hal.freedesktop.org/releases
>  >  UDISKS_LICENSE = GPLv2+
>  >  UDISKS_LICENSE_FILES = COPYING
>  > @@ -22,6 +22,15 @@ UDISKS_DEPENDENCIES = 	\
>  
>  >  UDISKS_CONF_OPTS = --disable-remote-access --disable-man-pages
>  
>  > +# When eudev is used as the udev provider, libgudev is automatically
>  > +# provided as it is part of eudev. However, when systemd is used as the
>  > +# udev provider, libgudev is not provided, and needs to be built
>  > +# separately. This is why we select the libgudev package only if systemd
>  > +# is used.
>  > +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>  > +UDISKS_CONF_OPTS += libgudev
> 
> Ehh, don't you mean UDISKS_DEPENDENCIES here?
> 

Ooops!, yes, UDISKS_DEPENDENCIES of course.

Should I send another version or can you amend that?

Thanks,

Vincent.
