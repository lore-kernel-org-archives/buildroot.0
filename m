From: Erik Andersen <andersen@codepoet.org>
Date: Mon, 29 Jan 2007 17:41:14 -0700
Subject: [Buildroot] svn commit: trunk/buildroot: package toolchain
	toolchain/gcc toolchai etc...
In-Reply-To: <20070121125852.7783048587@busybox.net>
References: <20070121125852.7783048587@busybox.net>
Message-ID: <20070130004114.GA14588@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun Jan 21, 2007 at 04:58:52AM -0800, aldot at uclibc.org wrote:
> Author: aldot
> Date: 2007-01-21 04:58:51 -0800 (Sun, 21 Jan 2007)
> New Revision: 17433
> 
> Log:
> - provide means to "install uClibc headers in the target filesystem" without a native compiler
> 
> 
> Added:
>    trunk/buildroot/toolchain/uClibc/Config.in.2
>    trunk/buildroot/toolchain/uClibc/Makefile.in
> 
> Modified:
>    trunk/buildroot/package/Config.in
>    trunk/buildroot/toolchain/Makefile.in
>    trunk/buildroot/toolchain/gcc/Config.in.2
>    trunk/buildroot/toolchain/uClibc/uclibc.mk

I do not understand this change...  'make install_headers' is
only available in the latest uClibc snapshots, thus this fails on
uClibc 0.9.28 and 0.9.28.1.  But this also redundant as uClibc's
'make install_dev' is called by the buildroot 'uclibc_target'
target regardless, and thus you get uClibc headers in the target
whether or not BR2_PACKAGE_UCLIBC_TARGET_HEADERS happens to be
set.  Thus this option is currently useless and breaks the build
for older uClibc versions.

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
