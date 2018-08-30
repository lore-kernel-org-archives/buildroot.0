From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Thu, 30 Aug 2018 08:13:25 +0200
Subject: [Buildroot] [PATCH v2 1/1] qt5webengine: update chromium
 license file names
In-Reply-To: <20180829223242.31c40388@windsurf>
References: <20180829063034.10766-1-laurent.hartanerot@gmail.com>
 <20180829105124.14758-1-laurent.hartanerot@gmail.com>
 <20180829223242.31c40388@windsurf>
Message-ID: <20180830061324.f3qlys7hkubyjq4c@amesys-lha-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, Aug 29, 2018 at 10:32:42PM +0200, Thomas Petazzoni wrote:
> Hello Laurent,
>
> On Wed, 29 Aug 2018 12:51:24 +0200, Laurent Hartanerot wrote:
> > From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> >
> > Add license file name for qt5webengine-5.6
> >
> > Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
>
> Thanks for this new iteration. Unfortunately, I still see a number of
> problems, some of them dating back from the origin of the qt5webengine
> package (so Ga?l if you're around, your feedback/help would be nice).
>
> Laurent, the first issue is that when your patch is applied, legal-info
> still doesn't work when the build wasn't done, i.e if you do "make
> clean; make legal-info", it will fail with:

Ok, I did not know that 'legal-info' could be applied on a clean repo.

>
> cp: cannot stat '/home/thomas/projets/buildroot/output/build/qt5webengine-5.6.3/src/3rdparty/chromium/third_party/WebKit/Source/build/scripts/license.pyc': No such file or directory
>
> This is because you have added the license.pyc file in the list of
> license files, but this file only gets created at build time. And
> anyway, since it's Python byte-code, it's not very useful.
>
> How was this list of license files generated ? It seems like all files
> containing "copying" or "license" in their name were taken. But does it
> make sense to include those license.py files ?

Yes, I include all files with "copying" or "license".
But, it's not my best idea.
I will check if all files are consistent

>
> Another problem is that the legal-info for qt5webengine in version 5.11
> is also broken:
>
> cp: cannot stat '/home/thomas/projets/buildroot/output/build/qt5webengine-5.11.1/src/3rdparty/chromium/buildtools/third_party/libc++abi/trunk/LICENSE.TXT': No such file or directory
>

I don't test this part. I don't have defconfig with this configuration.
I will try to make a correct configuration to enable qt5webengine on qt5-11.

>
> > +CHROMIUM_LICENSE_FILES = \
>
> Another problem is the name of this variable: if we ever have a package
> called "chromium" (which is not unlikely, as it was submitted in
> https://patchwork.ozlabs.org/patch/942284/), then this
> CHROMIUM_LICENSE_FILES variable internal to qt5webengine will clash
> with the CHROMIUM_LICENSE_FILES of the legitimate chromium package.
>
> So the naming of this variable should be changed to
> QT5WEBENGINE_CHROMIUM_LICENSE_FILES or something like this.
>

Ok

> > +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> >  include package/qt5/qt5webengine/chromium.inc
>
> Perhaps this file should be renamed chromium-latest.inc
>
> > +else
> > +include package/qt5/qt5webengine/chromium.5.6.inc
>
> and this one chromium-lts.inc ?
>
> Could you send a couple of separate patches to fix those issues ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks

Laurent
