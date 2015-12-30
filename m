From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Dec 2015 16:48:56 +0100
Subject: [Buildroot] sysroot
In-Reply-To: <CA+C+_XRofByfgd5oo5R1CZykm=vhsXQLD0ESODbkwxXwiTF9QA@mail.gmail.com>
References: <CA+C+_XRofByfgd5oo5R1CZykm=vhsXQLD0ESODbkwxXwiTF9QA@mail.gmail.com>
Message-ID: <5683FCE8.6000206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-12-15 04:10, Mathew Benson wrote:
> What is the best way to add 32 bit headers (i.e. gnu/stubs-32.h) to the sysroot
> directory on a 64 bit build?  I need to create a sysroot for some new code
> development and I'd rather use the correct files that buildroot would have
> pulled in if it was a 32 bit build, rather than piece together a sysroot manually.  

 Could you clarify what you intend to do? The sysroot we create for a 64-bit
build cannot be used for 32-bit binaries. The only exception is if you build a
completely standalone executable (i.e. not linked with libc). And that's such an
exceptional case that we don't support it.

 If you want to build 32-bit executables, create a 32-bit buildroot environment.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
