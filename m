From: Mark Corbin <mark.corbin@embecosm.com>
Date: Fri, 17 Aug 2018 14:33:01 +0100
Subject: [Buildroot] Custom Sources for Kernel Headers
Message-ID: <a88396ad-23da-c9c2-de34-d3467ee82ea9@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm working on a patch to allow the custom selection of the toolchain
kernel headers in a similar fashion to the kernel source, i.e. custom
tarball, custom repository etc. This is primarily to allow a RISCV64
toolchain to build against the headers from the appropriate git
repository without building a kernel, but I guess that it would also be
useful for anybody who wants to build a custom toolchain.

I am a little confused about the hash checking. I can see some
conditions where the header source is added to BR_NO_CHECK_HASH_FOR, but
I can't actually find any hash files for the headers or the kernel. So
I'm guessing that as there are no hash files the header/kernel source
never gets checked anyway?

I've added Subversion support for the kernel headers download as per the
existing git/hg technique. This was missing from linux-headers.mk - I
just wondered whether there was any reason for this? Also, will
Buildroot generate a tarball from an svn repository as it does for git
and hg?

I don't have any way of testing svn and hg support at the moment. Could
these be tested elsewhere if I posted my patch?

Thanks

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pEpkey.asc
Type: application/pgp-keys
Size: 3139 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180817/37d7deb7/attachment.key>
