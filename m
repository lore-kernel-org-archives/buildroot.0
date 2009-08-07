From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2009 00:43:46 +0200
Subject: [Buildroot] [PATCH] Re: buildroot-libtool.patch failed with
 dbus 1.3.0
In-Reply-To: <4A7C9F65.4060104@eclis.ch>
References: <4A7C85F0.7070604@eclis.ch> <20090807221717.53039a10@surf>
	<4A7C9F65.4060104@eclis.ch>
Message-ID: <20090808004346.443b9e49@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 07 Aug 2009 23:40:53 +0200,
Jean-Christian de Rivaz <jc@eclis.ch> a ?crit :

> Thanks for the trick! It seem that dbus archives contain a new
> ltmain.sh since the dbus version 1.2.16. I have successfully tested
> the following patch with dbus version 1.2.12, 1.2.14, 1.2.16 and
> 1.3.0. On each test I also verified that dbus-glib compile.

Ok. We don't usually support several versions of a package, except for
very special cases. And for the moment 1.3.0 is only a development
version.

Could you send a patch that just bumps the version to 1.2.16 and
switches DBUS_LIBTOOL_PATCH to NO ?

BTW, the issue is that dbus < 1.2.16 uses libtool 1.5.x, which is
notoriously broken for cross-compilation. That's why we have this
package/buildroot-libtool.patch thing that can be enabled/disable using
<PKG>_LIBTOOL_PATCH (default is enabled). dbus >= 1.2.16 uses libtool
2.2.x, which seems to have been fixed (i.e it works without the patch).

BTW, I'm precisely currently trying to improve how we handle libtool.
But the result of this work is only for after 2009.08.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
