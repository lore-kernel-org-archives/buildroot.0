From: Chris Zankel <chris@zankel.net>
Date: Mon, 19 Nov 2012 13:45:50 -0800
Subject: [Buildroot] Xtensa in the autobuilders, first build failures
In-Reply-To: <20121118232518.091b6154@skate>
References: <20121118232518.091b6154@skate>
Message-ID: <50AAA88E.3090603@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 11/18/2012 02:25 PM, Thomas Petazzoni wrote:
> As you have probably noticed, we merged your Xtensa support in
> Buildroot a few days ago. I'm really happy that your patches came in,
> as it means that the removal of the Xtensa architecture will not be
> visible (we removed it during this development cycle, and later
> re-introduced it thanks to your patches).
Thanks

However, I noticed that it was not the most recent version where I
incorporated suggestions from Arnout, so will provide a small patch on
top of it.

> I have also added one Xtensa toolchain configuration in our
> autobuilder, and we are therefore starting to see a few Xtensa-related
> build issues. Note that this is not at all a blocking issue for now:
> when a new architecture is introduced, we expect to have build
> failures. I'm listing below the failures we had, in case you have some
> time to look at them:
>
>  * Failure to build gdbserver for the target, and gdb for the target as
>    well, both for the same reason: PTRACE_GETXTREGS and
>    PTRACE_SETXTREGS are not defined by the kernel headers apparently.
>    I'm not sure if they are just missing from the kernel headers, of
>    the ptrace support is missing in the kernel. See:
>
>    http://autobuild.buildroot.org/results/1d2f307b2aa59bebca3bcb9ea854839f4b1d14fb/build-end.log
>    http://autobuild.buildroot.org/results/ec58e302030b8f72b19e9bada16dabb076c60261/build-end.log
Yes, I do have a patch for gdb. There are actually two ways to fix it,
either in uClibc or gdb. I'm also working with Tensilica to get those
changes upstream, so I have to avoid providing additional patches.

>
>    It would be nice if you could have a look at this.
>
>  * Xtensa apparently does not have libffi support. However, it is quite
>    a bit of work to get libffi support, so maybe we should just mark
>    libffi as not available on Xtensa (which is quite annoying because
>    libffi is a dependency for a huge number of packages, but we have
>    the same problem with other architectures as well). See:
>
>    http://autobuild.buildroot.org/results/e097c27d38e49d4bf4e07f95c52e995709c08aa8/build-end.log
Thanks, I will look into it.

> Besides those issues, I'm just reminding you that we are still very
> interested in having a Qemu Xtensa configuration to be able to run the
> Xtensa systems we generate with Buildroot.
I'm juggling between kernel, uClibc, and buildroot, so, please allow me
some more time.


Regarding patches, should I send them to you and cc buildroot, or only
to the mailing list? What's the best path to get them looked at and
integrated into the tree?


Thanks,
-Chris
