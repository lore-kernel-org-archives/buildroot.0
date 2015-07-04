From: Mike <mikez@OpenPlayer.org>
Date: Sat, 4 Jul 2015 14:01:42 -0500
Subject: [Buildroot] Hash checking infrastructure
Message-ID: <20150704140142.3aa5c982@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A small nit about how the hash checking is
working (or in special cases, not working):

Use case:

When using a package source directory override,
the usual version number field is replaced with
the string 'custom'.

If the package being over-ridden has a hash file
in its Buildroot configuration directory,
the hash checker attempts to check the:
<package name>-custom-<archive type> in the 
download directory.

Reference section 8.11.6:
"... will no longer attempt to download, extract 
and patch the package."

I think the behavior should also include skipping
the hash check.

Mike
