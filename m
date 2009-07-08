From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Wed, 08 Jul 2009 10:52:43 +0200
Subject: [Buildroot] Question about autoreconfiguration of packages
Message-ID: <1247043163.3743.9.camel@couak.urd44.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

there is something I noticed when autoconfiguring a package before
configure and build it. The autoconfiguration is done by calling :
	* $buildrootdir/build_$arch/host_dir/usr/bin/aclocal
	* $buildrootdir/build_$arch/host_dir/usr/bin/autoconf
	* $buildrootdir/build_$arch/host_dir/usr/bin/autoheader
	* /usr/bin/automake

I'm wondering why we call automake from the host rather than automake
from the host built packages. Because, for example, if we don't have
gtk-doc-tools installed on the host system, it's not possible to
autoconfigure packages like glib2/gtk+/etc...

Is there a reason for this ?

If not, we have to add the gtk-doc package and build it for the host.

Regards,

-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
