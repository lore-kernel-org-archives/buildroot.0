From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 1 Sep 2018 04:02:23 -0400
Subject: [Buildroot] [PATCH v2 1/1] qt5webengine: update chromium
 license file names
In-Reply-To: <20180829223242.31c40388@windsurf>
References: <20180829063034.10766-1-laurent.hartanerot@gmail.com>
 <20180829105124.14758-1-laurent.hartanerot@gmail.com>
 <20180829223242.31c40388@windsurf>
Message-ID: <20180901080223.vzr47rcedmledhee@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Laurent,

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

Laurent: I am glad you take care of licenses in QtWebEngine. It was in
my todo list for the last couple of month. I forgot to maintain it
through the bumps of Qt :/ and I am sorry about that.

> Thanks for this new iteration. Unfortunately, I still see a number of
> problems, some of them dating back from the origin of the qt5webengine
> package (so Ga?l if you're around, your feedback/help would be nice).
> 

Thomas: If I remember well, I was told to include all QtWebEngine
licenses (in v4?) and I simply run a dummy script of my own to find all
files that have some license information inside.

Then, I looked if the module was compiled and I added it into the list.
But it is hard to know in advance if the module is going to be build or
not.

Note: QtWebKit does not include the WebKit license.

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

Right, I was not aware about variable name clashing when I submitted the
patch.

Good catch.

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

This is a good idea to split file into versions.

I tested the v3 and it works fine.

But, if you do not mind, I would name the file using the Qt version
number variable $(QT5_VERSION_MAJOR).

	include package/qt5/qt5webengine/chromium-$(QT5_VERSION_MAJOR).inc

	1. We make sure to update the license file through the bumps of
	major version of Qt (5.11 to 5.12...). Otherwise, we will have
	an issue telling that the file is missing and make cannot
	include it.

	2. Qt version 5.9 and upcoming version 5.12 are also LTS which
	is confusing a bit (even if they are the latest supported in
	buildroot).

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Gael
