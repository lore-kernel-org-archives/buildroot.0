From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 13 Dec 2010 12:27:08 -0500
Subject: [Buildroot] [PATCH] toolchain-external: check sysroot *after*
	copying
In-Reply-To: <20101213175244.72901d85@surf>
References: <1292171123-32551-1-git-send-email-vapier@gentoo.org>
	<20101213175244.72901d85@surf>
Message-ID: <201012131227.08896.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 13, 2010 11:52:44 Thomas Petazzoni wrote:
> On Sun, 12 Dec 2010 11:25:23 -0500 Mike Frysinger wrote:
> > The current toolchain checking code will probe the files in the
> > sysroot to make sure things are sane, but it does this *before* it
> > actually copies the files in question over.  Thus from a clean build,
> > it's impossible to actually use the external toolchain option.
> > 
> > So re-order things so we initialize the local sysroot first and then
> > check the result.
> 
> SYSROOT_DIR points to the original sysroot of the toolchain, not the
> one we copy locally for Buildroot. So the original sysroot of the
> toolchain is already available when starting a new build.

ok, so i misinterpreted the errors fixed by the other toolchain patches ive 
posted around the same time as this one.  for more details, consult those.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/0472f868/attachment.pgp>
