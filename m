From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Mar 2012 14:02:56 +0100
Subject: [Buildroot] [PATCH 6/6] apply-patches.sh: use series file to
	apply patches in proper order
In-Reply-To: <20120321132607.20647967@skate> (Thomas Petazzoni's message of
 "Wed, 21 Mar 2012 13:26:07 +0100")
References: <87k42e5nt8.fsf@macbook.be.48ers.dk>
 <1332336387-3434-1-git-send-email-ludovic.desroches@atmel.com>
 <20120321132607.20647967@skate>
Message-ID: <87ehsm3y4f.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Do we really want to support this use case within apply-patches.sh
 Thomas> directly? Packages such as argus, cvs, input-tools, mii-diag,
 Thomas> setserial, sysklogd, sysvinit and thttpd all handle this by adding a
 Thomas> special xxx_POST_PATCH_HOOK that applies the patches in
 Thomas> debian/patches/. In other words:

 Thomas>  * The package infrastructure applies the Debian patch, which creates
 Thomas>    the debian/patches/ directory

The difference is that the Debian diff with quilt format is no longer
distributed as a (compressed) diff, but a tarball extra files, so the
current <pkg>_PATCH handling doesn't really work for that.

But like I mentioned earlier, I don't have a problem with us dropping
support for this special case as long as we find a solution for packages
like liblockfile.

For now I applied the patch so liblockfile builds again.

-- 
Bye, Peter Korsgaard
