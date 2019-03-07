From: Andreas Naumann <dev@andin.de>
Date: Thu, 7 Mar 2019 10:15:42 +0100
Subject: [Buildroot] [git commit] core/pkg-infra: restore completeness
 of packages files lists
In-Reply-To: <6b2a27b3-5bd0-442f-80fb-608c858b9828@cesnet.cz>
References: <20190208083943.3BB41884AC@busybox.osuosl.org>
 <6b2a27b3-5bd0-442f-80fb-608c858b9828@cesnet.cz>
Message-ID: <7d2bb948-ef9b-02b2-0ea1-9e565b0f05c9@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

> 
> This breaks top-level parallel build. Here's an example how it looks 
> when it breaks:
> 
> 2019-03-06T12:50:02 >>> expat 2.2.6 Fixing libtool files
> 2019-03-06T12:50:02 Making install in gnulib-lib
> 2019-03-06T12:50:02 /usr/bin/make? install-am
> 2019-03-06T12:50:02 >>> ethtool 4.19 Installing to target
> 2019-03-06T12:50:02 
> PATH="/home/jkt/work/prog/_build/br-cfb/host/bin:/home/jkt/work/prog/_build/br-cfb/host/sbin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/home/jkt/ 
> 
> .local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0:/usr/lib/llvm/6/bin:/usr/lib/llvm/4/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin" 
> /usr/bin/make? DESTDIR=/home/jkt/work/prog/_build/br-cfb/target install 
> -C /home/jkt/work/prog/_build/br-cfb/build/ethtool-4.19/
> 2019-03-06T12:50:02 /bin/mkdir -p 
> '/home/jkt/work/prog/_build/br-cfb/target/usr/sbin'
> 2019-03-06T12:50:02 /bin/mkdir -p 
> '/home/jkt/work/prog/_build/br-cfb/host/lib'
> 2019-03-06T12:50:02 /bin/sh ../libtool?? --mode=install /usr/bin/install 
> -c ?libgettextlib.la '/home/jkt/work/prog/_build/br-cfb/host/lib'
> 2019-03-06T12:50:02 /usr/bin/install -c ethtool 
> '/home/jkt/work/prog/_build/br-cfb/target/usr/sbin'
> 2019-03-06T12:50:02 comm: 
> /home/jkt/work/prog/_build/br-cfb/build/.files-list-staging.new: No such 
> file or directory
> 2019-03-06T12:50:02 make[1]: *** [package/pkg-generic.mk:287: 
> /home/jkt/work/prog/_build/br-cfb/build/expat-2.2.6/.stamp_staging_installed] 
> Error 1
> 2019-03-06T12:50:02 make[1]: *** Waiting for unfinished jobs....

I've sent a patch patch for this 2 days ago (core/pkg-infra: Fix package 
files statistics for parallel build). I dont know if it will be accepted 
but would be interested if it works for you.


best regards,
Andreas

> 
> I can't offer much insight into how to best fix this, unfortunately, 
> whether to add some locking or whether to make this per-package.
> 
> This is just with a patched top-level Makefile to remove the 
> .NOTPARALLEL stanza, with no per-package build dire patches atec.
> 
> With kind regards,
> Jan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
