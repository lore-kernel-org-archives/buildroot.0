From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Dec 2010 09:11:18 +0100
Subject: [Buildroot] [PATCH] zlib: fix installing when static-only
In-Reply-To: <201012112252.52313.vapier@gentoo.org> (Mike Frysinger's message
	of "Sat, 11 Dec 2010 22:52:50 -0500")
References: <1291759032-1336-1-git-send-email-vapier@gentoo.org>
	<871v5onfhx.fsf@macbook.be.48ers.dk>
	<201012112252.52313.vapier@gentoo.org>
Message-ID: <87mxobl8bd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> On Saturday, December 11, 2010 16:53:14 Peter Korsgaard wrote:
 >> >>>>> "Mike" == Mike Frysinger writes:
 Mike> The switch from manual targets to using zlib's targets to fix shared
 Mike> building/installing doesn't work quite right as zlib itself doesn't
 Mike> handle static-only installs fully.
 >> 
 >> Ehh, that seems very similar to the zlib-1.2.5-fix-static-install.patch
 >> we already have?

 Mike> i dont know what you're referring to.  there are no patches currently:
 Mike> 	http://git.buildroot.net/buildroot/tree/package/zlib

Argh, you're right. I fixed it back in November, but apparently forgot
to git add the file:

commit ab2f5567c1ca67c7f761486495d3d42f2b7c8eff
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Wed Nov 24 16:14:52 2010 +0100

    zlib: cleanup, fix install for static only build
    
    Use 'make install' for installation, add a patch to make it work for
    static only builds, and add uninstall/clean targets while we're at it.
    
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

I've fixed that now, thanks. The patch has also been sent upstream.

-- 
Bye, Peter Korsgaard
