From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Aug 2018 23:43:49 +0200
Subject: [Buildroot] Custom Sources for Kernel Headers
In-Reply-To: <a88396ad-23da-c9c2-de34-d3467ee82ea9@embecosm.com>
References: <a88396ad-23da-c9c2-de34-d3467ee82ea9@embecosm.com>
Message-ID: <20180817234349.092a32af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mark,

On Fri, 17 Aug 2018 14:33:01 +0100, Mark Corbin wrote:

> I'm working on a patch to allow the custom selection of the toolchain
> kernel headers in a similar fashion to the kernel source, i.e. custom
> tarball, custom repository etc. This is primarily to allow a RISCV64
> toolchain to build against the headers from the appropriate git
> repository without building a kernel, but I guess that it would also be
> useful for anybody who wants to build a custom toolchain.

I was wondering if we really wanted to add support for "custom Linux
kernel headers", since we already have the option to say "use the
kernel headers from the Linux kernel being built", where the Linux
kernel package provides lots of freedom to define where it should be
downloaded from.

However, I do see a possible use-case where you may want to build a
toolchain, but not necessarily a kernel image, so perhaps it makes
sense to add support for custom versions/downloads of the kernel
headers.

> I am a little confused about the hash checking. I can see some
> conditions where the header source is added to BR_NO_CHECK_HASH_FOR, but
> I can't actually find any hash files for the headers or the kernel. So
> I'm guessing that as there are no hash files the header/kernel source
> never gets checked anyway?

When there is no .hash file in a package, no hash verification happens:
https://git.buildroot.org/buildroot/tree/support/download/check-hash#n34.

> I've added Subversion support for the kernel headers download as per the
> existing git/hg technique. This was missing from linux-headers.mk - I
> just wondered whether there was any reason for this?

Nobody needed it until now, probably because storing the kernel source
code in a Subversion repository is a crazy thing to do :-)

> Also, will Buildroot generate a tarball from an svn repository as it
> does for git and hg?

Yes, it will also generate a tarball, that's what we do for all
version control systems.

> I don't have any way of testing svn and hg support at the moment.
> Could these be tested elsewhere if I posted my patch?

If you can't test them, perhaps it's better to not support them? People
who need that can easily add the necessary code.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
