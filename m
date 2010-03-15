From: Dominic Reynolds <dominicreynolds@gmail.com>
Date: Mon, 15 Mar 2010 10:24:35 -0600
Subject: [Buildroot] flex target binary used during host compile
Message-ID: <20100315162435.GB3080@mail.lantnern.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a quick question about an issue I'm having building buildroot
(2010.02). I'm compiling on an x86_64 host and compiling for a powerpc
target.

I'm using buildroot to build the target fs, kernel, and target utilities
(basically everything except uboot and busybox). 

My build is failing while compiling lm_sensors and the problem is that the
build step using flex is finding the flex binary from the
"staging_dir/usr/bin" (which is a binary for the target) and so can't
complete.

I looked through the build artificats and the build command explicitly sets
up the path so that this PATH is defined completely by the build - so I'm
confused as to where the problem would be. My staging_dir/usr/bin directory
contains host toolchain binaries as well as target utility binaries (like
flex) - which seems confusing (as if you have staging_dir/usr/bin in your
path you are going to get inconsistent arhitecture for programs that are
found).

Anyone have any ideas what might be going on?

cheers,
dominic
