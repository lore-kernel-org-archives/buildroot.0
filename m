From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Tue, 09 Jun 2015 10:47:18 +0200
Subject: [Buildroot] Option for debug support in DirectFB package
In-Reply-To: <20150609101508.034c93f0@free-electrons.com>
References: <55760F79.8080501@openmailbox.org>
 <20150609001953.1c241187@free-electrons.com>
 <ea9e1bad9d8e6c95d8611537b5224ccc@openmailbox.org>
 <20150609101508.034c93f0@free-electrons.com>
Message-ID: <3a6dc50e783cb1b103efd1125ae08e71@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-06-09 10:15, Thomas Petazzoni a ?crit?:
> A global option is a bit problematic, because we have discovered that
> --enable-debug is clearly not used for the same thing in all packages.
> Some packages add -Werror, some add some other funky stuff, some simply
> enable debugging symbols. --enable-debug is not a standard, formalized
> option with a well-defined meaning. So I don't think a global option
> that applies to all autotools packages make sense here.

OK, I understand.

So I will provide the patch with BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT as 
suggested by Arnout.
Since BR2_PACKAGE_DIRECTFB_DEBUG is still present, I will make it depend 
on BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT (default yes). 
(--disable-debug-support is ignored if --enable-debug is set.)
Of course it is still possible to remove BR2_PACKAGE_DIRECTFB_DEBUG 
later...

-- 
C?dric
