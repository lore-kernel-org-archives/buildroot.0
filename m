From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Jan 2011 13:33:25 +0100
Subject: [Buildroot] Problem building avahi
In-Reply-To: <20110106123238.1c227155@surf> (Thomas Petazzoni's message of
	"Thu, 6 Jan 2011 12:32:38 +0100")
References: <B3C53ADB207D471B8656E4BCBBDDD557@WSA.local>
	<20110105171027.1e64ffe6@surf>
	<D473AD103FC84CD18D1AF9AB6EAE9D2B@WSA.local>
	<20110106123238.1c227155@surf>
Message-ID: <87ei8qgqju.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I build in /usr/buildroot-2010.11 for some historical reason, but not
 >> as root. The buildroot directory belongs to the devel group and i'm a 
 >> member of this group.

 Thomas> Ok, good. At least this has exhibited an interesting bug of Buildroot
 Thomas> that we'll have to fix.

Yeah.

 >> Hmm, the uImage now is in output/images and got not copied to
 >> output/target/boot/ and is not in the rootfs.tar ?

 Thomas> No. On non-x86 embedded systems it's not very usual to have the kernel
 Thomas> image *inside* the root filesystem. It's usually flashed separatly from
 Thomas> the root filesystem image.

 Thomas> However, if there is demand for such a feature, we could certainly add
 Thomas> an option to the kernel build process.

For such a special situation, I would prefer to we tell users to do it
with BR2_ROOTFS_POST_BUILD_SCRIPT instead.

-- 
Bye, Peter Korsgaard
