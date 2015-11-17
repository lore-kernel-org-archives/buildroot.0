From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Nov 2015 17:24:57 -0300
Subject: [Buildroot] [PATCH] liquid-dsp: blacklist CS powerpc toolchains
In-Reply-To: <20151117211943.3b638229@free-electrons.com>
References: <1447784444-5336-1-git-send-email-gustavo@zacarias.com.ar>
 <20151117211943.3b638229@free-electrons.com>
Message-ID: <564B8D19.9070508@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/11/15 17:19, Thomas Petazzoni wrote:

> You forgot to use the same dependencies in the comment, to avoid it
> being displayed in cases where the package can anyway not be enabled.
> I've applied to master after fixing this. Thanks!
>
> Thomas

Hi Thomas.
I believe that would be a no-op, since:


comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
         depends on !(BR2_TOOLCHAIN_USES_GLIBC || 
BR2_TOOLCHAIN_USES_MUSL) || BR2_STATIC_LIBS

It is a glibc toolchain (well, eglibc i believe, but same deal), and 
glibc toolchains can't do static, so unreachable.

Regards.
