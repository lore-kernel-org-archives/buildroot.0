From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 12 Feb 2017 12:55:37 -0200 (BRST)
Subject: [Buildroot] [PATCH v2] infra/ccache: avoid color diagnostics
 with GCC older than v4.9
In-Reply-To: <20170212141425.GE11105@free.fr>
References: <1486733648-14658-1-git-send-email-casantos@datacom.ind.br>
 <1486899181-8210-1-git-send-email-casantos@datacom.ind.br>
 <20170212141425.GE11105@free.fr>
Message-ID: <609383214.9983962.1486911337173.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, arnout at mind.be,
> gustavo at zacarias.com.ar
> Sent: Sunday, February 12, 2017 12:14:25 PM
> Subject: Re: [PATCH v2] infra/ccache: avoid color diagnostics with GCC older than v4.9

> Carlos, All,
> 
> On 2017-02-12 09:33 -0200, Carlos Santos spake thusly:
>> Ensure that the GCC_COLORS environment variable is empty when calling
>> ccache. When GCC_COLORS is set, ccache passes '-fdiagnostics-color' to
>> GCC but this flag requires GCC v4.9 or later. Older versions complain
>> about the unrecognized command line option.
> 
> So, while fixing my own patch about the issue [0], I noticed that I was
> not even able to make it fail in the first place...
> 
> I'm using this defconfig, which uses a gcc-4.7:
> 
>    BR2_x86_i686=y
>    BR2_CCACHE=y
>    BR2_TOOLCHAIN_EXTERNAL=y
> 
> and Thomas reported he was also unable to reproduce the failure with:
> 
>    BR2_sh=y
>    BR2_sh4a=y
>    BR2_CCACHE=y
>    BR2_TOOLCHAIN_EXTERNAL=y
>    BR2_INIT_NONE=y
>    BR2_SYSTEM_BIN_SH_NONE=y
>    # BR2_PACKAGE_BUSYBOX is not set
>    BR2_PACKAGE_DEVMEM2=y
>    # BR2_TARGET_ROOTFS_TAR is not set
> 
> which also uses gcc-4.7.
> 
> Can you provide a reliable way to reproduce the issue, please?

What does "echo $GCC_COLORS" say? And remember that you must not
redirect the output to a file or pipe.

Carlos Santos (Casantos) - DATACOM, P&D
?Something must be done. This is something. Therefore we must do it.?
(from the BBC series ?Yes, Prime Minister?, ?Power to the people?)
