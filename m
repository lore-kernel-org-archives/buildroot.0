From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 20:24:20 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
 for-2011.02/fix-ccache-support
In-Reply-To: <87tyiruefy.fsf@macbook.be.48ers.dk>
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<874oarx2r5.fsf@macbook.be.48ers.dk>
	<AANLkTimzwXT4JMAv_oZxcCrRSEbGc8reZ+GfYhb8RHUZ@mail.gmail.com>
	<87tyiruefy.fsf@macbook.be.48ers.dk>
Message-ID: <20101206202420.331a9f8f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 06 Dec 2010 16:08:17 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> It afaik got moved in the first place to fix issues with external
> toolchains (E.G. where sysroot is important) and various configure
> scripts not using CFLAGS, so I don't think this will work.

Yes.

> Perhaps we should simply bite the bullet and add simple shell wrappers
> in HOST_DIR / STAGING_DIR for gcc/g++/ld which add --sysroot when
> we're using an external toolchain, and then get rid of --sysroot in
> TARGET_CC.

Maybe. But for the moment, I think doing the little mungling done in
cdrkit.mk that fixes all CMake-based packages is quite reasonable.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
