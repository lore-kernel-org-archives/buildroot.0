From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Jul 2009 01:06:51 +0200
Subject: [Buildroot] [PATCH 05/13] midori: remove configuration comment
	on X.org dependency
In-Reply-To: <0c7ee23c9c2b876661fc410f4cb2647f262c2b1c.1247846597.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri\,
	17 Jul 2009 18\:03\:12 +0200")
References: <cover.1247846596.git.thomas.petazzoni@free-electrons.com>
	<cover.1247846596.git.thomas.petazzoni@free-electrons.com>
	<0c7ee23c9c2b876661fc410f4cb2647f262c2b1c.1247846597.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874otaj4dw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Configuration comments make the configuration system
 Thomas> messy. And if we want to tell the user about the possible
 Thomas> missing depencies for each and every package, there would be
 Thomas> an unmaintable mess of configuration comments.

I don't completely agree. For toolchain issues such as WCHAR I think
the comments can be very helpful as it isn't obvious why a package
isn't visible.

For package dependencies, 'select' should be used for library
dependencies. For huge things like X, I think it's OK to not show any
comments as the user most likely doesn't expect an X package to be
available if they haven't enabled X.

Related to this, I think we should move the X applications into a
seperate sub menu.

The stuff that can work with either directfb or X is a bit more
tricky.

 Thomas> Let's get rid of them, and let the user figure out using the
 Thomas> help of each package available in the configuration system.

How? The package won't be visible if it has unmet dependencies.

-- 
Bye, Peter Korsgaard
