From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 09:40:58 -0300
Subject: [Buildroot] [PATCH] glibc: remove version 2.21
In-Reply-To: <20160222133337.743dba7f@free-electrons.com>
References: <1456142845-5372-1-git-send-email-gustavo@zacarias.com.ar>
 <1456142845-5372-2-git-send-email-gustavo@zacarias.com.ar>
 <20160222132027.091e7c84@free-electrons.com>
 <56CAFE21.4030803@zacarias.com.ar>
 <20160222133337.743dba7f@free-electrons.com>
Message-ID: <56CB01DA.1060601@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/02/16 09:33, Thomas Petazzoni wrote:

> I don't really see why you're talking specifically about atomics here,
> but OK with the rest.

Because newer glibc versions need them for thread barriers, see glibc 
source in sysdeps/sparc/sparc32/atomic-machine.h

>> So basically yes, sparc = no glibc, sparc64 = yes glibc, because we
>> don't support multilib (in gentoo it wasn't 100% multilib in the past,
>> except that binutils/gcc did support -m64/-m32, but there wasn't libc
>> support, hence not really multilib).
>
> I don't follow the relation with multilib support. Care to expand on
> this?

Since you can't build a 32-bit linux kernel for v9+ then you need a gcc 
capable of -m64 for v9, even if your userland is 32-bit.
There's no separation in cpu mode for SPARC 32/64 bits like there is for 
x86, so you can use the new instructions even in 32-bit "mode".
Regards.
