From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Dec 2009 20:47:46 +0100
Subject: [Buildroot] [git commit master] defconfigs: use new default
	location for STAGING_DIR
In-Reply-To: <a038bef50912161135g96cd695m27e23a7811e37fe7@mail.gmail.com>
	(Chris Packham's message of "Wed, 16 Dec 2009 14:35:16 -0500")
References: <20091216190433.314B077792@busybox.osuosl.org>
	<a038bef50912161135g96cd695m27e23a7811e37fe7@mail.gmail.com>
Message-ID: <87vdg666ql.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 >> -BR2_STAGING_DIR="/usr/local/$(ARCH)/gcc-$(BR2_GCC_VERSION)-uclibc"
 >> +BR2_STAGING_DIR="$(BASE_DIR)/staging"
 >> ?# BR2_FPU_SUFFIX is not set
 >> ?BR2_TOPDIR_PREFIX=""
 >> ?BR2_TOPDIR_SUFFIX=""

 Chris> Not that I know anything about arm_toolchain_defconfig but from its
 Chris> name and the old BR2_STAGING_DIR value I'm guessing it attempts to
 Chris> generate a standalone toolchain and install it in /usr/local. You
 Chris> might want to change this one back.

Yes I noticed.
I actually think we should probably just delete that defconfig - Having
a generic arm defconfig (which tries to write files under /usr/local/
where most normal users don't have permissions), uses OABI and has the
AT91 stuff enabled is probably not that useful after all.

-- 
Bye, Peter Korsgaard
