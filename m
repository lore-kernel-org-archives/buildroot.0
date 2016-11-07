From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 23:03:02 +0100
Subject: [Buildroot] busybox error
In-Reply-To: <d563d924-cd16-f433-f1f4-e3f37cfef008@mind.be>
References: <CANO2Q29C45jEphAw5nzo_x7j4WjumkfNyE0qf+_B-G1pw_VqbQ@mail.gmail.com>
 <d563d924-cd16-f433-f1f4-e3f37cfef008@mind.be>
Message-ID: <20161107230302.69f0ef4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 Nov 2016 22:58:01 +0100, Arnout Vandecappelle wrote:

>  You have done some very serious hacking, so don't be surprised if things don't
> work.
> 
>  busybox runlevel can only be enabled when busybox FEATURE_UTMP is enabled.
> However, Buildroot will explicitly disable that option when musl is used as libc
> because musl doesn't provide utmpxname (and another one too I think).
> 
>  I don't know how you managed to break this, but it must be by manually copying
> some files into the build directory. If you do something like that, you're on
> your own. It's like pulling a screw out of the engine of your car and going to
> your car dealer complaining that something doesn't work.
> 
>  Now, I could be mistaken, so if you can reproduce the issue after doing 'make
> clean; make', please provide your buildroot .config and busybox .config (if it
> was customized).

FWIW, Siva provided me off-list (or rather without Cc'ing the list) his
Buildroot .config file, which selects the glibc C library. But his
build log indeed indicates a toolchain built the musl C library.

Which hints very clearly that Siva didn't do a "make clean all" after
changing the toolchain configuration.

Siva: please read
https://buildroot.org/downloads/manual/manual.html#full-rebuild.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
