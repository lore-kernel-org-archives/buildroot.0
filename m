From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 28 Apr 2012 14:53:32 +0000 (UTC)
Subject: [Buildroot] How do you add to library path?
References: <jnc1d9$t1p$1@dough.gmane.org> <201204280018.27254.arnout@mind.be>
Message-ID: <jnh09c$m1a$2@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-27, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Thursday 26 April 2012 19:42:01 Grant Edwards wrote:
>> What's the right way to permanently add a directory to the search path
>> for dynamic libraries?  (Preferably at build-time, rather than at
>> run-time.)
>
>  You could use the -rpath linker option, but that risks conflicts with
> libraries installed on the host (the linker puts rpath in front of the
> library search path, disregarding the sysroot, so if a library with the
> same name exists in that path on the host, the linker will link with that
> one instead of the cross-compiled one).

Thanks, that's an interesting option.  For now I've set
LD_LIBRARY_PATH. That seems sub-optimal, since the libraries are
always going to be in a location that's known at build-time.  I'll
take a look at the rpath option (and the other related methods).

-- 
Grant
