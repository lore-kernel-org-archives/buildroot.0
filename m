From: Brian C. Lane <bcl@brianlane.com>
Date: Sun, 13 Aug 2006 15:42:29 -0700
Subject: [Buildroot] Building for ARM
In-Reply-To: <44DE650C.2060402@brianlane.com>
References: <44DE650C.2060402@brianlane.com>
Message-ID: <44DFAAD5.10707@brianlane.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Brian C. Lane wrote:



> 
> export PATH=../buildroot/build_armeb/staging_dir/bin:$PATH
> make CROSS-COMPILE="armeb-linux-" ARCH="arm" bzImage

This should have been CROSS_COMPILE with an underscore. But even with
that it wasn't compiling correctly, until I discovered the defconfig
make targets. Using the versatile_defconfig target worked. Now I just
have to get qemu to run it without crashing.

Thanks for the help,

Brian

- --
- ---[Office 73.1F]--[Outside 75.4F]--[Server 86.8F]--[Coaster 73.1F]---
Linux Software Developer                      http://www.brianlane.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Remember Lexington Green!

iD8DBQFE36rVIftj/pcSws0RAhD8AJ9DQtZ9jg909CTe44gq8B+Gt5DvBACZAWix
UbVuZcN/XN2YIG4MrXReIRY=
=8We5
-----END PGP SIGNATURE-----
