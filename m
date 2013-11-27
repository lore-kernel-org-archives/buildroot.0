From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 18:16:56 +0100
Subject: [Buildroot] libglib2 (or maybe libffi) build failure
In-Reply-To: <529625D8.4080507@newflow.co.uk>
References: <52960F8C.5040003@newflow.co.uk> <20131127171511.2abd4873@skate>
 <52961D17.6020904@newflow.co.uk> <20131127173755.6019dd2f@skate>
 <529621B0.60106@newflow.co.uk> <20131127175114.619d17d5@skate>
 <529625D8.4080507@newflow.co.uk>
Message-ID: <20131127181656.35b2521c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mark Jackson,

On Wed, 27 Nov 2013 17:03:20 +0000, Mark Jackson wrote:

> Aha ... the previous "buildroot" entry in $PATH is the cuplrit.

Ok. It's true that having an already existing cross-compiler and
Buildroot installation in the PATH can possibly cause some issues,
though I'd like this to work properly.

> The foo.log file contains lines such as:-
> 
> 15616 open("/home/mpfj/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig/libcrypto.pc", O_RDONLY)
>                        ^^^^^^^^^
> I guess it's now in a confused state, so I should do a full clean ?

Can you give us the contents of host/usr/bin/pkg-config ? It is a
wrapper shell script that sets a bunch of variables and calls pkgconf.

I would nonetheless like to have your full "foo.log", to see more
precisely what's going on with pkg-config.

> If so, can you tell me if it's possible to keep 2 different toolchains in use ?
> 
> The original "buildroot" path was to my "known-good" buildroot setup (based on
> 2013.02), but I'm looking to update things to the latest.
> 
> I'd rather not destroy my existing toolchain setup, so is it possible to set things
> up to handle 2 buildroots at the same time ?

It is possible, just don't have one in the PATH in a permanent way. The
way I typically do things is by adjusting the PATH only in the
shell/terminal I'm going to use the toolchain, or even use the full
toolchain path.

Again, I believe we should continue to investigate this some more, I'd
like to understand the root of the problem and see if there's a
reasonable fix for it (even though I believe there might be several
other issues in trying to do a Buildroot build with an existing
Buildroot build in the PATH).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
