From: Michael S. Zick <minimod@morethan.org>
Date: Sat, 28 Apr 2012 05:44:20 -0500
Subject: [Buildroot] How do you add to library path?
In-Reply-To: <201204280018.27254.arnout@mind.be>
References: <jnc1d9$t1p$1@dough.gmane.org> <201204280018.27254.arnout@mind.be>
Message-ID: <201204280544.24157.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri April 27 2012, Arnout Vandecappelle wrote:
> On Thursday 26 April 2012 19:42:01 Grant Edwards wrote:
> > What's the right way to permanently add a directory to the search path
> > for dynamic libraries?  (Preferably at build-time, rather than at
> > run-time.)
> 
>  You could use the -rpath linker option, but that risks conflicts with
> libraries installed on the host (the linker puts rpath in front of the
> library search path, disregarding the sysroot, so if a library with the
> same name exists in that path on the host, the linker will link with that
> one instead of the cross-compiled one).
>

At a guess (untried by myself), it might be possible to use objcopy to
add/change the rpath information __after__ the build is otherwise complete.

I.E: For the case where the rpath information added is for the target's use,
rather than the build host's use.

I do not know for certain if objcopy can access or change the rpath 
information field in an object, I have never seen or read about it being done.

Mike

>  Regards,
>  Arnout
> 
