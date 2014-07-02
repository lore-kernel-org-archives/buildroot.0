From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 2 Jul 2014 08:51:16 +0100
Subject: [Buildroot] Binutils version used on MIPS
In-Reply-To: <20140701201445.3caa5150@free-electrons.com>
References: <20140701201445.3caa5150@free-electrons.com>
Message-ID: <53B3B9F4.9010800@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/2014 07:14 PM, Thomas Petazzoni wrote:
> Vicente, Markos,
> 
> For the MIPS architecture, the current default binutils version in the
> Buildroot internal toolchain backend is 2.21:
> 
>         prompt "Binutils Version"
>         depends on !BR2_arc
>         default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
>         default BR2_BINUTILS_VERSION_2_24 if BR2_microblaze || BR2_powerpc64le
>         default BR2_BINUTILS_VERSION_2_22
> 
> Do you know if there's a good reason to keep using 2.21, as opposed to
> a more recent version such as 2.23 or 2.24 ? It would be good to have a
> little bit of testing done with binutils 2.23 or 2.24 and if it's
> successful, bump the default version used on MIPS.
> 
> Thanks!
> 
> Thomas
> 
Hi Thomas,

No good reason and thanks for noticing. We will send a patch to use the
latest one by default.

-- 
markos
