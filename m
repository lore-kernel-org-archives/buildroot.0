From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2009 10:45:10 +0200
Subject: [Buildroot] [PATCH 05/13] midori: remove configuration comment
 on X.org dependency
In-Reply-To: <874otaj4dw.fsf@macbook.be.48ers.dk>
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
	<cover.1247846596.git.thomas.petazzoni@free-electrons.com>
	<0c7ee23c9c2b876661fc410f4cb2647f262c2b1c.1247846597.git.thomas.petazzoni@free-electrons.com>
	<874otaj4dw.fsf@macbook.be.48ers.dk>
Message-ID: <20090720104510.43facc42@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 18 Jul 2009 01:06:51 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I don't completely agree. For toolchain issues such as WCHAR I think
> the comments can be very helpful as it isn't obvious why a package
> isn't visible.

True, but they're also very unpretty in the package list.

> For package dependencies, 'select' should be used for library
> dependencies. For huge things like X, I think it's OK to not show any
> comments as the user most likely doesn't expect an X package to be
> available if they haven't enabled X.

Yes.

> Related to this, I think we should move the X applications into a
> seperate sub menu.

Agreed. I've just started proposing some cleanups. More will follow if
I find some time.

> The stuff that can work with either directfb or X is a bit more
> tricky.

Definitely.

>  Thomas> Let's get rid of them, and let the user figure out using the
>  Thomas> help of each package available in the configuration system.
> 
> How? The package won't be visible if it has unmet dependencies.

Well, someone is currently working on xconfig support for Buildroot
(the patches should be coming out if I find the time to review them).
And xconfig allows to see all options, including the ones that cannot
be selected at the moment. Maybe a similar thing could be added to the
menuconfig interface ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
