From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 12:24:53 +0100
Subject: [Buildroot] [PATCH 05/15] toolchain: rework C++ options
In-Reply-To: <87fwu4lytt.fsf@macbook.be.48ers.dk>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<e24f28446cde0a4d1dad1bfb5e55c070c9345770.1291541115.git.thomas.petazzoni@free-electrons.com>
	<87fwu4lytt.fsf@macbook.be.48ers.dk>
Message-ID: <20101212122453.19ce3f39@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Dec 2010 23:38:38 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas>  - We could have two independent options: one to tell
>  Thomas> whether the toolchain has C++ support (on which packages
>  Thomas> would depend on) and another to tell whether the C++ library
>  Thomas> should be installed (that packages would select). This would
>  Thomas> allow to have a C++-free target filesystem even if the
>  Thomas> toolchain used actually supports C++.
> 
> Is that really important? I would expect people who really care about
> such stuff to build a custom toolchain for their project.

No strong opinion on this, so I just deleted this part from the commit
log.

> If there's interest, perhaps it would make more sense to generalize
> this library-cleanup step for all libs and do something like the
> mklibs stuff.

Yeah, would probably be a better idea.

> Here we add an option to build a ctng toolchain (glibc/uclibc)
> with/without C++ support.
> 
> .. But here we say that all external glibc toolchains have C++
> support. That doesn't seem to be always true.

Indeed. Generally, most glibc toolchains will probably have C++
support, but that's not necessarly the case. So I move the option
outside the CUSTOM_UCLIBC thing, so that it is visible for any CUSTOM
external toolchain.

>  Thomas> +config BR2_TOOLCHAIN_EXTERNAL_C_PLUS_PLUS
>  Thomas> +	bool "Toolchain has C++ support ?"
> 
> No space before '?'

Fixed.

> 'Enable this option if your external toolchain has'

Fixed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
