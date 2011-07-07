From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2011 17:12:31 +0200
Subject: [Buildroot] Feature request - pull sources from repose
In-Reply-To: <20110707161943.714c9791@skate>
References: <5725744097739393062@unknownmsgid> <20110707161943.714c9791@skate>
Message-ID: <20110707171231.0e3efbf1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 7 Jul 2011 16:19:43 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> This is already implemented. In a package, you can do :
> 
> <pkg>_SITE = git://foobar.com/barfoo.git
> <pkg>_SITE_METHOD = git
> <pkg>_VERSION = some-git-tag-or-commit-id-or-branch
> 
> Same with Subversion and Bazaar.

I should probably have said that this wouldn't work with uClibc. This
is due to the fact that uClibc is not a normal Buildroot package that
relies on the common infrastructure. It's a very special component,
built by its own Makefile.

However, we have an option to build an uClibc snapshot tarball. If you
just tell Buildroot to do this, it will grab the latest daily tarball
of uClibc. You can also tell Buildroot to select an arbitrary tarball,
by date.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
