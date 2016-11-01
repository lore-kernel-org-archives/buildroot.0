From: Patrick Doyle <wpdster@gmail.com>
Date: Tue, 1 Nov 2016 09:30:33 -0400
Subject: [Buildroot] buildroot and SELinux
In-Reply-To: <CANCHnQph3GgcJdrozS0g52E9k+OQ1trWtZ3kWvsM2rMDFFbr7Q@mail.gmail.com>
References: <CAF_dkJDYo2pxYTYojvOiUcCw0p6dV46_H6C4s6GVm2-nR+wqRw@mail.gmail.com>
 <CANCHnQph3GgcJdrozS0g52E9k+OQ1trWtZ3kWvsM2rMDFFbr7Q@mail.gmail.com>
Message-ID: <CAF_dkJDX5Nnsy+XpxEfGRT5jwMgRSJcyA0xCaprL3O3391yYxg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jeroen,

Thank you for your reply.  And for your advice.

On Tue, Nov 1, 2016 at 6:49 AM, Jeroen Roovers <jer@airfi.aero> wrote:
> You could simply ensure that the up and running userland can't read
> the file, possibly by excluding userland support for reading cramfs or
> whatever filesystem you choose, so that only the kernel can read it at
> boot time, and then removing (rm) the file from the ramdisk during
> boot up and after you've used it.

That could work.  But it's that time between "during boot up and after
you've used it" bit that has me worried.  During that interval, a root
user who has compromised the system would be able to make a copy of
the executable.  That is what I would like to prevent, and am now
exploring SELinux and AppArmor to see they offer the tools to do this.
Also, implementing that strategy would require that I reboot the
system to restart the executable, which may not be the best answer.

I'm exploring ideas right now, and am open to advice.  The main intent
of my question on this list was to ensure that, if I went down the
SELinux path, I didn't box myself in a corner.

> Doing this with SELinux would require you to build a policy for that
> file so that its execution is only allowed in specific security
> contexts.
Assuming I can learn how to build the appropriate policy, how would I
bake that policy into the buildroot generated kernel/rootfs such that
it boots up enabled and immutable?  Does the policy get baked into the
kernel?  Or do I run tools on the cramfs to set the policy for that
file prior to its incorporation into the kernel?


Thanks again.

--wpd
