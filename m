From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 14:13:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix --with-egl-platforms
References: <20170611115128.8662-1-bernd.kuhls@t-online.de>
 <20170611140646.61e12638@windsurf.home>
Message-ID: <nnov0exniq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 11 Jun 2017 14:06:46 +0200 schrieb Thomas Petazzoni:

>> +MESA3D_CONF_OPTS += \
>> +	--with-platforms=$(subst $(space),$(comma),
$(MESA3D_EGL_PLATFORMS))
> 
> Then we should rename the variable to just MESA_PLATFORMS.

yes, this is planned as part of a wip patch which brings more changes to 
the mesa3d package:

https://github.com/bkuhls/buildroot/
commit/46d3dd4207dba1ba447a8ff4ed74e6a9538b5870

> Also, this variable is going to be empty when
> BR2_PACKAGE_MESA3D_OPENGL_EGL is disabled, so we will be passing
> --with-platforms=
> 
> Is this correct ?

Yes.

Regards, Bernd
