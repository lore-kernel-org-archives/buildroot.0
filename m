From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 22:35:52 +0200
Subject: [Buildroot] [PATCH 1/9] skalibs: new package
In-Reply-To: <20160809221626.0982822d@itchy>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1470690140-18803-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20160809100622.4b18f1c7@free-electrons.com>
 <20160809221626.0982822d@itchy>
Message-ID: <20160809223552.6fcfc332@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Aug 2016 22:16:26 +0200, Eric Le Bihan wrote:

> > Use just "glibc" instead of "(e)glibc", we have removed eglibc
> > support.  
> 
> As explained in my reply to Waldemar B. [1], I've found a fix, so this
> limitation will be removed.

Great!


> > Instead of doing this loop to find the size of the different types,
> > what about using the following compiler pre-built defines (like you're
> > doing for little endian vs. big endian detection below) :
> > 
> > $ sparc-linux-gcc -dM -E - </dev/null | grep SIZEOF
> > #define __SIZEOF_INT__ 4
> > #define __SIZEOF_POINTER__ 4
> > #define __SIZEOF_LONG__ 4
> > #define __SIZEOF_LONG_DOUBLE__ 16
> > #define __SIZEOF_SIZE_T__ 4
> > #define __SIZEOF_WINT_T__ 4
> > #define __SIZEOF_PTRDIFF_T__ 4
> > #define __SIZEOF_FLOAT__ 4
> > #define __SIZEOF_SHORT__ 2
> > #define __SIZEOF_WCHAR_T__ 4
> > #define __SIZEOF_DOUBLE__ 8
> > #define __SIZEOF_LONG_LONG__ 8  
> 
> I did not know about this. Thanks for the suggestion. I'll rework the
> patch.

Note that I have no idea if this is supported by all gcc versions, or
by other compilers.

> s6-rc is the service management program. The definitions of the services
> and their dependencies are written in plain text files, then compiled
> as a binary database. As it is not sensible to compile this on the
> device, I provide a host variant of the compiler (s6-rc-compile) to
> build the binary database during TARGET_FINALIZE_HOOKS. The host
> variant of s6-rc requires the host variant of skalibs, execline and s6.

Thanks for the information. It would be useful to have this information
part of the commit log.

However, your explanation also means that there is no need to have any
of those host packages in menuconfig.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
