From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 14 Jan 2011 17:17:41 -0500
Subject: [Buildroot] [PATCH 3/7] toolchain: add a USE_MMU build option
In-Reply-To: <87zkr36tjx.fsf@macbook.be.48ers.dk>
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<201101141627.50341.vapier@gentoo.org>
	<87zkr36tjx.fsf@macbook.be.48ers.dk>
Message-ID: <201101141717.42051.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, January 14, 2011 16:53:38 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
> Hi,
> 
>  >> What archs currently have working nommu support in uClibc?
> 
>  Mike> any arch can be built as "nommu".  it simply means certain
>  Mike> functions are not enabled (like fork) while others are not as
>  Mike> complicated (like malloc).  so there is no technical limitation
>  Mike> that only certain arches support nommu.  -mike
> 
> Naturally, but which one are used in the wild? E.G. what is supported by
> linux-2.6.37 and uClibc-0.9.32-rc1 ?

again, you can run any "nommu" userland with a kernel with the mmu running.  
if you're asking which arches in mainline linux kernel allow people to build 
with CONFIG_MMU disabled, you're talking about arm, blackfin, frv, h8300, 
m32r, m68k, microblaze, mips, sh, and xtensa.  i dont believe there is any 
limitation in uClibc and if there is, that's easy enough to fix.  nommu is 
merely a subset of mmu functionality from userspace's perspective.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110114/2753084e/attachment.asc>
