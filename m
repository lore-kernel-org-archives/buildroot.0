From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 17 Sep 2017 10:11:51 -0400
Subject: [Buildroot] [PATCH v8 0/3] Qt WebEngine support
In-Reply-To: <20170912124033.yf7eexsilmguwmc2@gportay>
References: <20170815203854.14456-1-gael.portay@savoirfairelinux.com>
 <488835700.260243.1502835037832.JavaMail.zimbra@savoirfairelinux.com>
 <178556773.368025.1502922075670.JavaMail.zimbra@savoirfairelinux.com>
 <3a741945-7242-c931-ad9c-231b86c70b30@gmail.com>
 <20170912124033.yf7eexsilmguwmc2@gportay>
Message-ID: <20170917141151.7gsonxarwxe5sfk3@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Tue, Sep 12, 2017 at 08:40:33AM -0400, Ga?l PORTAY wrote:
> ...
> 
> Another platform that everybody have (but we used to forget) is a PC.
> 
> I started to test QTWE on my laptop using pc_x86_64_bios_defconfig, but
> I do not have the time to go further.
> 
> I met the following error at runtime.
> 
> 	QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
> 	gbm: failed to open any driver (search paths /usr/lib/dri)
> 	gbm: Last dlopen error: /usr/lib/dri/i965_dri.so: cannot open shared object file: No such file or directory
> 	failed to load driver: i965
> 	gbm: failed to open any driver (search paths /usr/lib/dri)
> 	gbm: Last dlopen error: /usr/lib/dri/kms_swrast_dri.so: cannot open shared object file: No such file or directory
> 	failed to load driver: kms_swrast
> 	gbm: failed to open any driver (search paths /usr/lib/dri)
> 	gbm: Last dlopen error: /usr/lib/dri/swrast_dri.so: cannot open shared object file: No such file or directory
> 	failed to load swrast driver
> 	Could not create GBM device (Invalid argument)
> 	Could not open DRM device
> 	Aborted
> 
> I enabled these configs (my laptop has an i915 chipset):
> 
> 	- BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
> 	- BR2_PACKAGE_LINUX_FIRMWARE_I915
> 	- BR2_PACKAGE_MESA3D_OPENGL_EGL
> 	- BR2_PACKAGE_MESA3D_OPENGL_ES
> 
> All, I do not know that much about graphic/opengl. I think I will need
> some help to make it works.
> 
> > Regards
> > 
> > Zoltan Gyarmati
> > https://zgyarmati.de
> 
> Regards,
> Gael

I am able to make QtWE works on x86 too.

Regards,
Gael
