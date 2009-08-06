From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 Aug 2009 23:25:59 +0000 (UTC)
Subject: [Buildroot] [Bug 545] Webkit doesn't see gtk-doc.make
In-Reply-To: <bug-545-163@https.bugs.busybox.net/>
References: <bug-545-163@https.bugs.busybox.net/>
Message-ID: <20090806232559.CE04177711@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=545





--- Comment #1 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-08-06 23:25:58 UTC ---
(In reply to comment #0)
> Webkit doesn't see gtk-doc.make
> 
> rm -rf /home/dan/xenon/buildroot/project_build_i386/uclibc/buildroot-config
> mkdir -p /home/dan/xenon/buildroot/project_build_i386/uclibc
> cp -dpRf package/config/buildroot-config
> /home/dan/xenon/buildroot/project_build_i386/uclibc/buildroot-config
> /home/dan/xenon/buildroot/toolchain_build_i386/bin/sed -i -e
> 's/AUTOMAKE_FLAGS=.*/AUTOMAKE_FLAGS="--foreign --add-missing --copy"/'
> /home/dan/xenon/buildroot/build_i386/webkit-r44552/autogen.sh
> /home/dan/xenon/buildroot/toolchain_build_i386/bin/sed -i -e
> 's/LIBTOOLIZE_FLAGS=.*/LIBTOOLIZE_FLAGS="--force --automake --copy"/'
> /home/dan/xenon/buildroot/build_i386/webkit-r44552/autogen.sh
> # Don't run the configure step yet
> cd /home/dan/xenon/buildroot/build_i386/webkit-r44552;
> AUTOGEN_CONFIGURE_ARGS=--version ./autogen.sh
> Warning: not running gtk-docize.
> automake: cannot open < gtk-doc.make: No such file or directory
> make: ***
> [/home/dan/xenon/buildroot/build_i386/webkit-r44552/.stamp_hook_post_extract]
> Error 1
> 

A lots of package have the same problem :
 * cairo (fixed by patch)
 * libglib2 (see bug 453)
 * libgtk2 (see bug 459)
 * dbus-glib

Every package using gtk-doc should be patched in the same way than cairo to
work fine with autoreconf.

Regards,


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
