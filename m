From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 09:25:05 -0300
Subject: [Buildroot] [PATCH] glibc: remove version 2.21
In-Reply-To: <20160222132027.091e7c84@free-electrons.com>
References: <1456142845-5372-1-git-send-email-gustavo@zacarias.com.ar>
 <1456142845-5372-2-git-send-email-gustavo@zacarias.com.ar>
 <20160222132027.091e7c84@free-electrons.com>
Message-ID: <56CAFE21.4030803@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/02/16 09:20, Thomas Petazzoni wrote:

> Gustavo,
>
> On Mon, 22 Feb 2016 09:07:25 -0300, Gustavo Zacarias wrote:
>> Mask out glibc for sparc as well since it's no longer available.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> Is it SPARC entirely, or only some specific architecture variants of
> SPARC that are no longer supported ?
>
> Thomas

Quick SPARC lesson.
SPARC < V9 = 32 bits (AKA sparc arch).
SPARC >= V9 = 64 bits and 32 bits as well (similar to x86, AKA sparc64 
arch).
Now, you can use atomics for >= v9 and even on 32 bits, but normally 
even if you use 32 bit userland you want a 64 bit kernel anyway (IIRC 
solaris supports 32 bit kernel as well for old/transition versions, but 
AFAIK linux never went there).
So basically yes, sparc = no glibc, sparc64 = yes glibc, because we 
don't support multilib (in gentoo it wasn't 100% multilib in the past, 
except that binutils/gcc did support -m64/-m32, but there wasn't libc 
support, hence not really multilib).
If/when said support is in place someone can update it.
Regards.
