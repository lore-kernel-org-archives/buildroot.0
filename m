From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Jan 2013 09:27:22 +0100
Subject: [Buildroot] Error when adding media-ctl as package
In-Reply-To: <50ED24FE.3070703@yahoo.fr>
References: <50EC1EBF.80807@yahoo.fr> <50EC7F16.3090008@mind.be>
 <50ED24FE.3070703@yahoo.fr>
Message-ID: <20130109092722.7cb8409b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Patrick,

On Wed, 09 Jan 2013 09:06:22 +0100, Patrick wrote:
> The line 10964 is the following:
> 
>    PKG_CHECK_MODULES(libudev, libudev, have_libudev=yes, have_libudev=no)

This macro should have been expanded during the autoreconf. So there is
some .m4 file missing with the definition of this PKG_CHECK_MODULES()
macro.

Could you add:

MEDIA_CTL_DEPENDENCIES = host-pkgconf

in your media-ctl.mk file?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
