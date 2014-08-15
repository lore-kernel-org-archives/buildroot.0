From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 00:17:25 +0200
Subject: [Buildroot] [PATCH] manual: Add atomic intrinsics to the
 dependencies section
In-Reply-To: <1407154628-12791-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140803113216.03e0fb94@free-electrons.com>
 <1407154628-12791-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140816001725.27388fce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Mon,  4 Aug 2014 16:17:08 +0400, Anton Kolesov wrote:

> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 93e6a3e..4b4d056 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -265,6 +265,10 @@ use in the comment.
>  ** Dependency symbol: +!BR2_PREFER_STATIC_LIB+
>  ** Comment string: +dynamic library+
>  
> +* Atomic intrinsics
> +** Dependency symbol: +!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS+
> +** Comment string: +atomic intrinsics+

Actually, the more I think about this, and the more I believe it should
be a property of the architecture rather than a property of the
toolchain. So it should probably rather be
BR2_ARCH_HAS_ATOMIC_INTRINSICS. And then, since it's a property of the
architecture, i.e not something the user can enable/disable, there is
no point in adding Config.in comment for that. So we would handle that
like we handle BR2_USE_MMU, not like we handle BR2_LARGEFILE.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
