From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 15:59:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/xdebug: new package
In-Reply-To: <0c8218be-8091-e801-cee8-c256a6a67205@mind.be>
References: <20190923101651.3721-1-nicolas.carrier@orolia.com>
 <0c8218be-8091-e801-cee8-c256a6a67205@mind.be>
Message-ID: <20190923155932.1790cb65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 15:27:21 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > diff --git a/package/Config.in b/package/Config.in
> > index 2fc11065f6..95115ec469 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -141,6 +141,7 @@ menu "Debugging, profiling and benchmark"
> >  	source "package/valgrind/Config.in"
> >  	source "package/vmtouch/Config.in"
> >  	source "package/whetstone/Config.in"
> > +	source "package/xdebug/Config.in"  
> 
>  Hm. IIUC, this is really a PHP extension, *not* a debugger that happens to use
> PHP internally. Therefore, I would think that it fits more in the "External php
> extensions" menu.

Agreed, if it's a PHP extension, it should go in the PHP extensions
menu, and be called "php-xdebug".

> > index 0000000000..c0abb71896
> > --- /dev/null
> > +++ b/package/xdebug/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_XDEBUG
> > +	bool "xdebug"
> > +	select BR2_PACKAGE_PHP  
> 
>  If you select a package, you have to copy its dependencies.
> 
>  However, for a PHP package, it's more appropriate to depend on it I think. Note
> that if you move it to the external php extensions menu that dependency will be
> implicit.

If it goes in the PHP extensions menu, then it will automatically be
inside a "if BR2_PACKAGE_PHP...endif" block.

>  Note also that normally, PHP extensions can only be built for !STATIC. Did you
> run test-pkg?

... and in a if !BR2_STATIC_LIBS..endif block.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
