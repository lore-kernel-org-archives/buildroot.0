From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 25 Mar 2010 18:08:49 +0000 (UTC)
Subject: [Buildroot] external toolchain and sysroot
References: <1272730299.20100325182803@ya.ru> <hog24r$1nu$1@dough.gmane.org>
	<93399903.20100325201240@ya.ru> <44830928.20100325201616@ya.ru>
Message-ID: <hog8rg$sis$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-03-25, Yury Luneff <bitterman@ya.ru> wrote:
> i've fixed uemacs makefile.
>
> And the other problem was not with openvpn but with vsftpd which .mk did 
> not include "${TARGET_LDFLAGS}" at all.
>
> It seem to be a common problem in buildroot for now.

Based on my sample of three packages (two had the problem), I'm
guessing it's a very common problem.  It looks like the buildroot
developers use external toolchains that don't require a --sysroot
option.  I don't know why that is, since external toolchains get
copied into staging before they are used.  That implies that they
won't work without a --sysroot option...

-- 
Grant Edwards               grant.b.edwards        Yow! My polyvinyl cowboy
                                  at               wallet was made in Hong
                              gmail.com            Kong by Montgomery Clift!
