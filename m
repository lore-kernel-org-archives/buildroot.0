From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Mon, 06 Jul 2015 10:56:00 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-06-29
In-Reply-To: <20150630140738.526d72b8@free-electrons.com>
References: <20150630063014.44429100A75@stock.ovh.net>
 <20150630140738.526d72b8@free-electrons.com>
Message-ID: <559A88F0.20106@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/06/15 09:07, Thomas Petazzoni wrote:

>>       powerpc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9147a478f8a2c77461c72a40af5c3f3779bfbe56/
>
> sigsegv.h:118:9: error: unknown type name 'ucontext_t'
>   typedef ucontext_t *stackoverflow_context_t;
>
> Some PowerPC person to have a look?

This one boils down to uclibc for powerpc not supporting ucontext 
functions (sigsegv.h includes ucontext.h which includes conditional on 
__UCLIBC_HAS_CONTEXT_FUNCS__ sys/ucontext.h which defines ucontext_t).

Since libsigsegv isn't used in general by any package i think excluding 
the combination would be best. I'll send a patch.

Regards.
