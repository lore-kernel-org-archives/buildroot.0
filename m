From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 24 Jan 2015 11:52:42 +0100
Subject: [Buildroot] [PATCH] mono: bump to version 3.12.0
In-Reply-To: <87a918603a.fsf@dell.be.48ers.dk>
References: <1421787624-6841-1-git-send-email-angelo.compagnucci@gmail.com>
 <87a918603a.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9VmJ5+87vjEKrbREArNy_9iC-kfAPLvi9SuGs4FDkkJUag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

There is an error on mips architecture,

In file included from ../../mono/utils/mono-stack-unwinding.h:10:0,
                 from ../../mono/utils/mono-threads.h:14,
                 from ../../mono/metadata/sgen-gc.h:39,
                 from sgen-os-posix.c:33:
sgen-os-posix.c: In function 'suspend_thread':
../../mono/utils/mono-context.h:475:61: error: 'mips_sp' undeclared
(first use in this function)
 #define MONO_CONTEXT_GET_SP(ctx) ((gpointer)((ctx)->sc_regs[mips_sp]))
                                                             ^
sgen-os-posix.c:73:17: note: in expansion of macro 'MONO_CONTEXT_GET_SP'
   stack_start = MONO_CONTEXT_GET_SP (&ctx) - REDZONE_SIZE;
                 ^
../../mono/utils/mono-context.h:475:61: note: each undeclared
identifier is reported only once for each function it appears in
 #define MONO_CONTEXT_GET_SP(ctx) ((gpointer)((ctx)->sc_regs[mips_sp]))
                                                             ^
sgen-os-posix.c:73:17: note: in expansion of macro 'MONO_CONTEXT_GET_SP'
   stack_start = MONO_CONTEXT_GET_SP (&ctx) - REDZONE_SIZE;

I'm investigating the root of the problem.

Sincerely, Angelo

2015-01-24 9:42 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > This patch bumos version of mono to the latest 3.12.0
>  > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> This causes a number of build issues. Care to take a look?
>
> http://autobuild.buildroot.net/?reason=mono-3.12.0
>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
