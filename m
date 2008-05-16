From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 16 May 2008 09:53:30 +0200
Subject: [Buildroot] ARM build error with llseek.c
In-Reply-To: <326f33790805151641l495774fdpf0efe19c9f060135@mail.gmail.com>
References: <326f33790805081549v3afdc776u56cdeb8e57167782@mail.gmail.com>
	<1CF6EDDF0820924DA43C9A52FE7325950B4DA9C3@MI8NYCMAIL17.Mi8.com>
	<326f33790805081624g2daf1407v15e8e84ad1914b77@mail.gmail.com>
	<1CF6EDDF0820924DA43C9A52FE7325950B4DAA2E@MI8NYCMAIL17.Mi8.com>
	<326f33790805081812sc3b8d29v948f331f7fe84653@mail.gmail.com>
	<326f33790805081813lff2c266wfc23c361119452df@mail.gmail.com>
	<326f33790805112024l75b6e2d5x41f4fb229b982274@mail.gmail.com>
	<2590773a0805151620r18b9f1b3qb81e255beee1ad71@mail.gmail.com>
	<326f33790805151641l495774fdpf0efe19c9f060135@mail.gmail.com>
Message-ID: <20080516075330.GA22291@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 15, 2008 at 04:41:48PM -0700, Arun Reddy wrote:
>Thanks Chris,
>
>Looks like the issue was with LFS not being enabled in uclibc
>(CONFIG_UCLIBC_HAS_LFS) and also BusyBox not having
>BR2_PACKAGE_BUSYBOX_HIDE_OTHERS selected. I did a make clean for everything
>and rebuilt, and got past that error.
>
>I am fairly certain I understand why LFS needed to be enabled, because I was
>reading up on a couple threads online about llseek.c being used for large
>file support in general, while lseek.c is used for small files. I want LFS
>for my purposes, and it is possible that by not selecting LFS in the uclibc
>menuconfig, that a specific function or variable wasn't defined correctly in
>a header file used by llseek.c, and therefore it couldn't compile correctly.
>This is of course my best assumption.
>
>As for selecting BusyBox's hide others option, I am unsure as to why that
>works, but found it here as a suggestion.

It works because if you enable it then you use busybox and not the big
util-linux.

As for your trouble with toggling LFS and other settings. This is
believed to be fixed in my tree, i.e. the user doesn't have to take care
of doing make uclibc-clean gcc-clean et al when she toggles LARGEFILE,
SJLJ or chooses to add or remove support for a language in her
cross-compiler or stuff like that.

PS: It would be helpful if you could send your errors to the list (as
text, of course) and not send a link to some picture of the error
message. TIA
