From: Allan Clark <allanc@chickenandporn.com>
Date: Mon, 15 Feb 2010 16:43:01 -0800
Subject: [Buildroot] how to package without ./configure ?
In-Reply-To: <6FADFC617AC54BA0A81944E2AF1D1FFB@apexjs>
References: <6FADFC617AC54BA0A81944E2AF1D1FFB@apexjs>
Message-ID: <37c712e1002151643v4efc4c42lb1775d07ce53ef61@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 15, 2010 at 15:03, Sagaert Johan <sagaert.johan@skynet.be>wrote:

>  Hi
>
> I have a package  that only contains a shell script (bootstrap.sh) to
> generate ./configure
> Once i have run the script manualy i can continue with make.
>
> How can i  change the makefile so that the bootstrap.sh is first executed
> (just after the extraction ) before the eval autotargets stuff  call the
> ./confure step ?
>
> Or  is the eval autotargets not suitable for this package ?
>
> (this is the package :
> http://ftp.de.debian.org/debian/pool/main/libu/libupnp4/libupnp4_1.8.0~cvs20080628.orig.tar.gz
>  )
>

I checked, your project can "autoreconf -vfi && ./configure && make
distcheck", why not do that in your release process (I have a patch for your
distcheck), use the resulting tarball for buildroot, and then it needs no
pre-action.

Allan
-- 
allanc at chickenandporn.com  "??" http://linkedin.com/in/goldfish
please, no proprietary attachments (http://tinyurl.com/cbgq)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100215/0d2f0024/attachment.htm>
