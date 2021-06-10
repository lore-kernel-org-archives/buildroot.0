From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Thu, 10 Jun 2021 09:39:43 +0200
Subject: [Buildroot] [PATCH v5 0/5] Introduce bmap-tools as target +
 host package
In-Reply-To: <08bb8c91-0304-8613-492c-aa133412a1e3@gmail.com>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
 <6e9afcd08150926a669d4df1198461e0acc7f063.camel@orolia.com>
 <20210609205222.785b065d@windsurf>
 <08bb8c91-0304-8613-492c-aa133412a1e3@gmail.com>
Message-ID: <ba7a6ec514891b5494d6232db9513443514ed1fc.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sure,

My qemu version is:
$ qemu-system-arm  --version
QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-10)

The Ext4 test passes:
$ ./support/testing/run-tests tests.fs.test_ext.TestExt4 -o tests -d dl
09:03:31 TestExt4                                 Starting
09:03:34 TestExt4                                 Building
ah09:08:12 TestExt4                                 Building done
Downloading to /home/ncarrier/workspace/buildroot/dl/tmp_43sbo0r
Renaming from /home/ncarrier/workspace/buildroot/dl/tmp_43sbo0r to
/home/ncarrier/workspace/buildroot/dl/kernel-vexpress-5.10.7
Downloading to /home/ncarrier/workspace/buildroot/dl/tmpnj5e2uiw
Renaming from /home/ncarrier/workspace/buildroot/dl/tmpnj5e2uiw to
/home/ncarrier/workspace/buildroot/dl/vexpress-v2p-ca9-5.10.7.dtb
09:08:20 TestExt4                                 Cleaning up
.
----------------------------------------------------------------------
Ran 1 test in 289.374s

OK

But its file system image has a size of 16M which _is_ a power of two:

BR2_TARGET_ROOTFS_EXT2_SIZE="16384"

On Wed, 2021-06-09 at 21:16 +0200, Romain Naour wrote:
> CAUTION: This email originated from outside of the organization.
> Do not click links or open attachments unless you recognize the
> sender and know the content is safe.
> 
> Hi Thomas, Nicolas,
> 
> Le 09/06/2021 ? 20:52, Thomas Petazzoni a ?crit :
> > Hello Nicolas,
> > 
> > On Wed, 09 Jun 2021 09:35:38 +0200
> > Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
> > 
> > > The first error in the run log is:
> > > 
> > > qemu-system-arm: Invalid SD card size: 60 MiB
> > > SD card size has to be a power of 2, e.g. 64 MiB.
> > > 
> > > So I set a fixed image size of 64M.
> > 
> > This is weird, because all the ext2/3/4 test cases in our test
> > infrastructure also do not specify a size, and so they get the
> > default
> > of 60 MiB.
> > 
> > Could you try:
> > 
> > ./support/testing/run-tests tests.fs.test_ext.TestExt4
> > 
> > and see if it works for you ?
> > 
> > Which version of Qemu are you using? I'm using 4.2.1.
> 
> We had the same problem after a qemu version bump to 5.1:
> 
> https://git.buildroot.net/buildroot/commit/?id=4bd2a317a7d6c3b3b19396a9459816da76b2c796
> 
> Best regards,
> Romain
> 
> 
> > 
> > Best regards,
> > 
> > Thomas
> > 
> 
