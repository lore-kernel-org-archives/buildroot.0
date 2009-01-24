From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 09:28:45 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
In-Reply-To: <20081111113345.68C223C95C@busybox.net> (laird@uclibc.org's
	message of "Tue\, 11 Nov 2008 03\:33\:45 -0800 \(PST\)")
References: <20081111113345.68C223C95C@busybox.net>
Message-ID: <87zlhhglaa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laird" == laird  <laird@uclibc.org> writes:

 laird> Author: laird
 laird> Date: 2008-11-11 03:33:45 -0800 (Tue, 11 Nov 2008)
 laird> New Revision: 23998

 laird> Log:
 laird> package/freetype/freetype.mk: Add zib to dependencies

 laird> Looking into adding a configure cache to the build (like the GIT buildroot version)
 laird> This means that freetype needs to know about zlib so make
 laird> sure it had it as a dependency.
 laird> Also remove install rule for staging as it matches default.

That seems wrong. It should probably be $(if $(BR2_PACKAGE_ZLIB),zlib)
or you should select zlib if freetype really needs it.

 laird> -FREETYPE_DEPENDENCIES = uclibc pkgconfig
 laird> +FREETYPE_DEPENDENCIES = uclibc pkgconfig zlib

-- 
Bye, Peter Korsgaard
