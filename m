From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 3 Dec 2012 23:17:13 +0000
Subject: [Buildroot] How to handle modularity in buildroot?
In-Reply-To: <CAE21AQpHdjzrJYnUBY6qwVBvd1HKpFGcKoTAsWcHyOFpua-yeA@mail.gmail.com>
References: <CAE21AQpHdjzrJYnUBY6qwVBvd1HKpFGcKoTAsWcHyOFpua-yeA@mail.gmail.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C610B824F7@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Charles
> Manning
> Sent: Monday, December 03, 2012 4:01 PM
> To: buildroot at busybox.net
> Subject: [Buildroot] How to handle modularity in buildroot?
> 
> Hello All
> 
> Ok, first off... I must absolutely congratulate and thank everyone for
> a really useful build system.
> 
> Until now I had been using openembedded to build smaller file systems
> for embedded systems. OE is way overkill for most embedded systems and
> is like trying to use a chainsaw to cut butter. Buildroot is much
> faster than OE and is way easier to navigate.
> 
> There are a few things I could do in OE that I am struggling with in
> buildroot - no doubt mainly due to my learner status. One of these is
> handling modularity.
> 
> Is there an easy way to have modular/hierarchical projects? For
> example I would like to have a base file system that holds common
> stuff but then have variants (eg. production vs development).
> 
> In OE this is easy: just create a "basic system" package which is
> included in the recipes for each of the variants.
> 
> How would this be tackled in buildroot?

I believe what you are looking for is 'make defconfig'.  This will 
provide a basic set of configuration options to get you going, then
you'll have to edit the things like processor family, processor type,
whether you want uClibc vs {e,}glibc, etc.

The default config is usually okay for a first attempt, however, I like
to provide to others in my company a set of config files to choose from.
Those, I derive from just cranking through the menuconfig and save the
options off when I get done.

If you are looking for more than this, there are a few other default
config files to attempt.  To list those config files do a 'make help'.

Hope this helps!

Andy

> 
> Thanks
> 
> Charles
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
