From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 18:32:48 +0100
Subject: [Buildroot] [PATCH 4/9] manual: faq: add entry about the
 relocatable toolchain
In-Reply-To: <c99516cd998754307f0a5e3b19579316f37d9f95.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
 <c99516cd998754307f0a5e3b19579316f37d9f95.1360795941.git.s.martin49@gmail.com>
Message-ID: <20130214183248.51280157@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 13 Feb 2013 23:59:05 +0100, Samuel Martin wrote:
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  docs/manual/faq-troubleshooting.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index f91a8ef..8b0882a 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -126,3 +126,24 @@ directory as the new root, will most likely fail.
>  If you want to run the target filesystem inside a chroot, or as an NFS
>  root, then use the tarball image generated in +images/+ and extract it
>  as root.
> +
> +[[faq-relocatable-toolchains]]
> +Are Buildroot toolchains relocatable?
> +-------------------------------------
> +
> +Because Buildroot uses several toolchain backends, there is one anwser
> +per backend:
> +
> +Using the external or crosstool-NG toolchain backend
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +These toolchains are mostly likely relocatable; the _Buildroot compiler
> +wrapper_ is relocatable.
> +
> +However, some tools built and installed into the +HOST_DIR+ may not be
> +relocatable, with some absolute pathes hard-coded inside.

I find this text rather confusing. What does "mostly likely" means for
the reader? The reader surely wants to know if the toolchain is
relocatable or not.

Therefore, I think this text should be changed to clarify what is meant
by "toolchain". Is it just the bare toolchain (gcc, binutils, libc,
kernel headers), or is it the complete toolchain that Buildroot
produces, with all the additional libraries and headers?

Also, you mention the "Buildroot compiler wrapper", but nowhere in the
documentation we explain what it is, and I don't think it should be
explained in the documentation, except in a section dedicated to "Deep
Buildroot internals", but certainly not to answer a FAQ question about
relocatable toolchains.

I would rather think that a section discussing how to use the "SDK"
produced by Buildroot, and how it can be shared with application
developers, could mention that the SDK is currently not relocatable,
but that we are working on fixing this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
