From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 11 Mar 2008 16:42:56 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <46a136670803110914l7cf179c6m5c866f53b4963bbf@mail.gmail.com>
References: <20080311154910.4CAEC120137@busybox.net>
	<1205250865.10692.235.camel@nigel-x60>
	<46a136670803110914l7cf179c6m5c866f53b4963bbf@mail.gmail.com>
Message-ID: <1205253776.10692.239.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> The build will fail because the path has two /gnu parts in it.

How does this not affect all the other packages and only binutils?

As you can see from the grep below, there are quite a number of packages
using SITE:=mirror/gnu/ and not SITE:=mirror/

Maybe I'm missing something?

-N

> 
> On Tue, Mar 11, 2008 at 11:54 AM, Nigel Kukard <nkukard@lbsd.net>
> wrote:
>         
>         > Author: ninevoltz
>         > Date: 2008-03-11 08:49:09 -0700 (Tue, 11 Mar 2008)
>         > New Revision: 21293
>         >
>         > Log:
>         > fixed path problem
>         >
>         > Modified:
>         >    trunk/buildroot/toolchain/binutils/binutils.mk
>         >
>         >
>         > Changeset:
>         > Modified: trunk/buildroot/toolchain/binutils/binutils.mk
>         >
>         ===================================================================
>         
>         
>         I added /gnu/  because most of the other packages have it.
>         
>         grep -r '$(BR2_GNU_MIRROR)/gnu' buildroot/
>         
>         The path will be invalid if you remove it?
>         
>         
>         _______________________________________________
>         buildroot mailing list
>         buildroot at uclibc.org
>         http://busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080311/3e7c45e3/attachment-0001.pgp 
