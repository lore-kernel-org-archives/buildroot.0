From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 16 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [PATCH 1/2] meson: new package
In-Reply-To: <20160718105725.46864568@itchy>
References: <1468072147-17509-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468072147-17509-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20160717162325.GM3614@free.fr> <20160718105725.46864568@itchy>
Message-ID: <04c80b4a-0df1-9235-a178-f794e7e6eb0b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-16 10:57, Eric Le Bihan wrote:
> Hi!
> 
> Le Sun, 17 Jul 2016 18:23:25 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
[snip]
>> However, I wonder how much we should have it *now* in Buildroot.
>>
>> As you said as a reply to my previous review, there are not many
>> packages that use the meson buildsystem, and that you did not plan on
>> providing one in the foreseeable future.
>>
>> What was your interest in adding meson in Buildroot, if you do not
>> have at least one package to submit that uses it?
> 
> IHMO, besides providing packages for programs to be run on embedded
> devices, Buildroot should also provide tools for developing for such
> devices: compilers, tools to generate flash images, debuggers and of
> course build systems such as Meson.

 Well, we have to draw the line somewhere. Currently, we clearly draw the line
at build systems. We don't allow users to use autoreconf, scons, cmake, ...
externally. Well, they can use it if they select a package that happens to use
these build systems, but there is no user-selectable option to enable e.g.
host-cmake.

 We discussed it here at the Buildroot developer meeting, and the general
agreement is that we should only introduce this build system when we have a
package that actually uses it.

 Until then, users can just install meson on their host. As you write, it's
pretty simple to use for cross-compilation.


> It is true that Meson is relatively young and has a small user base
> ATM, but as it is relatively easy to use and tries to handle
> cross-compilation from the start, it may generate attraction (or not!).
> 
> But the same applies to the Rust series I also posted. This series
> provides the Rust compiler and Cargo, the package manager, but no
> target package depending on them. This new language is branded as being
> oriented towards system programming and the compiler can generate code
> for ARM and MIPS, which shows it is meant to be used for developing for
> embedded devices.

 I'll reply to that independently. It's different because rust is really doing
cross-compilation.


> Some users may be glad to have support for these tools out-of-the-box
> in Buildroot, even though they are not developing programs to be
> packaged for upstream. This is why I submitted this patch series.
> 
>> Host packages that are not used by any target package, and that have
>> no entry in Kconfig, will never be exercised by the autobuilders, so
>> we won't be able to catch any build failure. Also, they are prone to
>> bit-rot, because they are not used, and thus breakage is never caught,
>> and thus no one fixes them.
> 
> True. Even though host packages may only be built for x86, they may have
> some dependencies between themselves that may break.
> 
> From what I understand the only host packages which are allowed to
> appear in the "host utilities" configuration menu are the tools that
> may be invoked by user scripts. These ones will be exercised by
> the autobuilders, right?
> 
> Maybe other packages such as exotic/new compilers and build
> systems should also be allowed, in order to be tested and to inform the
> user that Buildroot provides them...

 New compilers yes (again, after discussion here at the Developer Meeting), but
build systems no.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
