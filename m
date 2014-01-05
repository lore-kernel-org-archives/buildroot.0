From: =?UTF-8?B?Q8OpZHJpYyBDaMOpcGllZA==?= <cedric.chepied@gmail.com>
Date: Sun, 05 Jan 2014 12:57:20 +0100
Subject: [Buildroot] [PATCH] ZNC: new package
In-Reply-To: <877gae7nd8.fsf@dell.be.48ers.dk>
References: <1388876370-3441-1-git-send-email-cedric.chepied@gmail.com>
 <877gae7nd8.fsf@dell.be.48ers.dk>
Message-ID: <52c948a2.e358c20a.0e98.1fdc@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At Sun, 05 Jan 2014 11:07:47 +0100,
Peter Korsgaard wrote:
> 
> >>>>> "C?dric" == C?dric Ch?pied <cedric.chepied@gmail.com> writes:
>  > diff --git a/package/znc/znc.mk b/package/znc/znc.mk
>  > new file mode 100644
>  > index 0000000..59d10f2
>  > --- /dev/null
>  > +++ b/package/znc/znc.mk
>  > @@ -0,0 +1,22 @@
>  > +ZNC_VERSION = 1.2
>  > +ZNC_SOURCE = znc-$(ZNC_VERSION).tar.gz
>  > +ZNC_SITE = http://znc.in/releases
>  > +ACL_INSTALL_STAGING = YES
> 
> Why does it need to install into staging? It's a program and not a
> library, right?

It does not. This is a bad copy/paste. I made this patch too quickly. 

> 
> 
>  > +
>  > +# While the configuration system uses autoconf, the Makefiles are
>  > +# hand-written and do not use automake. Therefore, we have to hack
>  > +# around their deficiencies by passing installation paths.
>  > +ACL_INSTALL_STAGING_OPT = 			\
>  > +	prefix=$(STAGING_DIR)/usr 		\
>  > +	exec_prefix=$(STAGING_DIR)/usr 		\
>  > +	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib	\
>  > +	install-dev install-lib
>  > +
>  > +ACL_INSTALL_TARGET_OPT = 			\
>  > +	prefix=$(TARGET_DIR)/usr 		\
>  > +	exec_prefix=$(TARGET_DIR)/usr 		\
>  > +	install install-lib
> 
> Out of interest, what does PKG_DEVLIB_DIR do and why don't we pass it
> for TARGET?


Same remark, I'll fix it and submit a new patch.

Regards,

-- 
C?dric Ch?pied
<cedric.chepied@gmail.com>
