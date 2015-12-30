From: Mathew Benson <mathew.benson@gmail.com>
Date: Wed, 30 Dec 2015 12:42:54 -0600
Subject: [Buildroot] sysroot
In-Reply-To: <5683FCE8.6000206@mind.be>
References: <CA+C+_XRofByfgd5oo5R1CZykm=vhsXQLD0ESODbkwxXwiTF9QA@mail.gmail.com>
 <5683FCE8.6000206@mind.be>
Message-ID: <CA+C+_XTdzafsUvNhP=HAmqQbQVuzX5kjo3=QYAeNph2mghiiyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

First, I'm not complaining.  I recently discovered Buildroot and I love
it.  Kudos to the maintainers.  I'm just learning it so I'm fumbling about
a bit.

I'm building a networked appliance that will run two applications.  Both
applications are already written.  One I wrote and maintained myself over
the past 4 years, but its 32 bit.  Upgrading it to 64 bit would have a
massive impact on other projects.  Its planned.  Just not for a little
while.  The other application is being written but requires 64 bit
drivers.  The drivers are not open source, so I don't have access to the
code.  The CPU is a 64 bit Intel to accommodate the 64 bit driver.  I did
get it almost working.  I verified I can run 32-bit applications by
compiling host code, copying it over, and copying the needed 32 bit
libraries over.  Obviously not the best solution.  I got it to cross
compile 32 bit, with manual tweaks.  I had to change several .so linker
scripts from "/lib" and "/usr/lib" to "/lib32" and "/usr/lib32", and
changing symbolic links in "/usr/lib32" from "/lib" to "/lib32".  I see
that buildroot is not intended for this use case, so I'm ok with my manual
work around.

Though, I haven't quite got it to run correctly.  Its either a dynamic
linking issue or just a misconfigured buildroot image.  When I run my
executable, I get an error that suggests the system is interpreting the elf
binary as a shell script.  I'm not sitting at that computer, so I can't
copy the exact error.  Something like "error:  unexpected "("".

I did create a 32 bit and a 64 bit buildroot environment.  I had merged
them into a single multilib 64 bit environment, though now I'm thinking it
would just be cleaner to keep them separate.

On Wed, Dec 30, 2015 at 9:48 AM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> On 29-12-15 04:10, Mathew Benson wrote:
> > What is the best way to add 32 bit headers (i.e. gnu/stubs-32.h) to the
> sysroot
> > directory on a 64 bit build?  I need to create a sysroot for some new
> code
> > development and I'd rather use the correct files that buildroot would
> have
> > pulled in if it was a 32 bit build, rather than piece together a sysroot
> manually.
>
>  Could you clarify what you intend to do? The sysroot we create for a
> 64-bit
> build cannot be used for 32-bit binaries. The only exception is if you
> build a
> completely standalone executable (i.e. not linked with libc). And that's
> such an
> exceptional case that we don't support it.
>
>  If you want to build 32-bit executables, create a 32-bit buildroot
> environment.
>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151230/d7270db0/attachment.html>
