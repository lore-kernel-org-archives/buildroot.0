From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon, 01 Jul 2013 19:04:51 +0200
Subject: [Buildroot] [PATCH v2] package/libsvg: new package
In-Reply-To: <87ip0uvhkx.fsf@dell.be.48ers.dk>
References: <1372593363-10994-1-git-send-email-c.schoenert@gmail.com>
 <87ip0uvhkx.fsf@dell.be.48ers.dk>
Message-ID: <51D1B6B3.10406@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter and Thomas,

Am 01.07.2013 09:56, schrieb Peter Korsgaard:
> 
> My idea was to simply automatically use the expat backend if
> BR2_PACKAGE_EXPAT is enabled, and not have an explicit option for it, so
> you can drop this suboption.

My intention was to give the user the choice if he want to use expat
regularly on the system but use libxml2 for building the libsvg package.
But in the end this makes not really sense and the proposal of you both
is of course a little bit more simplify. Sometime I'm thinking to
"complicated".

>  Carsten> +LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg
> 
> Ohh? You didn't have libpng/libjpeg as dependencies in v1?

Yes, in v1 there wasn't this dependencies. As I must see the
configure.in lacks the need for both packages. But while testing after a
cleanup of the build environment I saw  build errors because of missed
header png.h and jpeglib.h, jerror.h.

> Are they
> needed? If so, you need to select them in Config.in as well.

Will set the packages in the Config.in and rework the patch again.

Thanks for patience with me!

Regards
Carsten
