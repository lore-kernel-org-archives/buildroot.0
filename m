From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Jan 2011 14:19:47 +0100
Subject: [Buildroot] Problem building avahi
In-Reply-To: <20110106135549.7f6ef437@surf> (Thomas Petazzoni's message of
	"Thu, 6 Jan 2011 13:55:49 +0100")
References: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
	<20110105171027.1e64ffe6@surf>
	<D473AD103FC84CD18D1AF9AB6EAE9D2B@WSA.local>
	<20110106123238.1c227155@surf> <87ei8qgqju.fsf@macbook.be.48ers.dk>
	<20110106135549.7f6ef437@surf>
Message-ID: <87aajegoek.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Ok, good. At least this has exhibited an interesting bug of
 Thomas> Buildroot that we'll have to fix.
 >> 
 >> Yeah.

 Thomas> Something like "grep -v" the lines that have already been changed to
 Thomas> start with $(STAGING_DIR)/usr ?

We could simply skip lines that already contain STAGING_DIR/usr - E.G.

$(SED) -e '/$(subst /,\/,$(STAGING_DIR)/usr)/b' -e "s:\(['= ]\)/usr:..

 >> For such a special situation, I would prefer to we tell users to do it
 >> with BR2_ROOTFS_POST_BUILD_SCRIPT instead.

 Thomas> On x86, it's fairly usual to have the kernel inside the root
 Thomas> filesystem, and embedded x86 systems are quite common. So this
 Thomas> feature could be seen as sufficiently useful to be integrated
 Thomas> into BR.

But u-boot on x86 isn't common, right?

 Thomas> Something like:

 Thomas> config BR2_LINUX_KERNEL_INSTALL_TO_ROOTFS
 Thomas> 	bool "Install kernel image in rootfs"
 Thomas> 	default y if BR2_i386 || BR2_x86_64
 Thomas> 	help
 Thomas> 	  Copy the generated kernel image to the /boot directory
 Thomas> 	  in the root filesystem

Ahh, for non-uImage stuff - Yes, that's fine.

-- 
Bye, Peter Korsgaard
