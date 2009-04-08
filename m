From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2009 10:58:58 -0700
Subject: [Buildroot] DBUS keeps getting installed...
In-Reply-To: <200904081213.21064.lsargent@txdigital.com>
References: <200904081213.21064.lsargent@txdigital.com>
Message-ID: <20090408105858.2af75456@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 8 Apr 2009 12:13:21 -0500,
Lloyd Sargent <lsargent@txdigital.com> a ?crit :

> Perhaps I misread something, but I was under the impression that if
> DBUS was not set, then it wouldn't be included in the build?
> 
> Any help would be appreciated. This has been going on for the last 20
> or 30 builds.

What does your .config contains (not only the BR2_PACKAGE_DBUS line) ?

There are two dependy mechanisms in Buildroot, which can sometimes get
confusing :

 * The Kconfig dependency stuff ;
 * The makefile dependency stuff.

In your case, it is possible that a package depends on dbus being built
in its .mk file, but that dependency is not visible in the Kconfig
stuff. After a quick look, I don't see for which package that could the
case, but maybe I missed something.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
