From: Charles Manning <cdhmanning@gmail.com>
Date: Tue, 4 Dec 2012 12:49:14 +1300
Subject: [Buildroot] How to handle modularity in buildroot?
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C610B824F7@ex-mb1.corp.adtran.com>
References: <CAE21AQpHdjzrJYnUBY6qwVBvd1HKpFGcKoTAsWcHyOFpua-yeA@mail.gmail.com>
 <F9C551623D2CBB4C9488801D14F864C610B824F7@ex-mb1.corp.adtran.com>
Message-ID: <201212041249.14541.manningc2@actrix.gen.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 04 December 2012 12:17:13 ANDY KENNEDY wrote:

> >
> > Is there an easy way to have modular/hierarchical projects? For
> > example I would like to have a base file system that holds common
> > stuff but then have variants (eg. production vs development).
> >
> > In OE this is easy: just create a "basic system" package which is
> > included in the recipes for each of the variants.
> >
> > How would this be tackled in buildroot?
>
> I believe what you are looking for is 'make defconfig'.  This will
> provide a basic set of configuration options to get you going, then
> you'll have to edit the things like processor family, processor type,
> whether you want uClibc vs {e,}glibc, etc.
>
> The default config is usually okay for a first attempt, however, I like
> to provide to others in my company a set of config files to choose from.
> Those, I derive from just cranking through the menuconfig and save the
> options off when I get done.
>
> If you are looking for more than this, there are a few other default
> config files to attempt.  To list those config files do a 'make help'.
>
> Hope this helps!

Thanks Andy

I am aware of this mechanism but I don't think it really gets me what I am 
after.

I think that with defconfig, I would be able to make defconfig, then tweak the 
config to get a variant. But now if I change the base config, I then have to 
go through the process again for the variant.

What I would like is the ability to have:
* A base package
* Production rootfs = base + production files.
* Development rootfs = base  + development files.

Then a change to the base package automatically flows through the production + 
development rootfs.


Is there a way to accomplish that?

Thanks

Charles
