From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Sep 2009 09:01:02 +0200
Subject: [Buildroot] multiple architectures
In-Reply-To: <20090930062658.GG25852@moomers.org>
References: <20090930062658.GG25852@moomers.org>
Message-ID: <20090930090102.0189852d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 30 Sep 2009 01:26:58 -0500,
Igor Serebryany <igor47@moomers.org> a ?crit :

> 	I need both an x86 and an amd64 version of my buildroot
> filesystem and kernel. I've been making this happen by a very
> inefficient process - keeping two copies of the buildroot source (one
> for each arch), making local/projectname an svn working copy, making
> all changes to the x86 version and using 'svn update' to merge changes
> 	back into the amd64 version.
> 
> 	I'm sure there must be a better way. How do people on here
> manage maintaining identical builds for multiple architectures? 

Use out-of-tree compilation with O=, with two different configurations
files.

Say ~/buildroot contains your Buildroot source code :

 * Store your x86 configuration in ~/buildroot/config.x86 and your
   x86_64 configuration in ~/buildroot/config.x86_64

 * To run the x86 compilation, do :

    cd ~/buildroot/
    cp config.x86 .config
    make O=~/buildroot-x86

 * To run the x86_64 compilation, do :

    cd ~/buildroot/
    cp config.x86_64 .config
    make O=~/buildroot-x86_64

Of course, when you make a change to one of the .config, make sure that
you update the corresponding config.{x86,x86_64}.

Do that solves your problem ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 197 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090930/bf48a650/attachment.pgp>
