From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Jun 2010 22:08:19 +0200
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
In-Reply-To: <i07kg9$jsp$1@dough.gmane.org> (Grant Edwards's message of "Sun, 
	27 Jun 2010 13:42:34 +0000 (UTC)")
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
	<i06hjh$fj$2@dough.gmane.org> <87hbkp3sfz.fsf@macbook.be.48ers.dk>
	<i07kg9$jsp$1@dough.gmane.org>
Message-ID: <87631444ss.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:

 >> No, but you could extract the tarball (as root or using fakeroot) and
 >> point CONFIG_INITRAMFS_SOURCE to it.

 Grant> An extracted tarball isn't one of the options either.
 Grant> CONFIG_INITRAMFS_SOURCE can be pointed at either a cpio archive or the
 Grant> source file list.

No? I haven't used initramfs in years, but I'm pretty sure you can
simply point CONFIG_INITRAMFS_SOURCE at a directory to make it use that.

The help text and documentation seems to agree with me:

config INITRAMFS_SOURCE
        string "Initramfs source file(s)"
        default ""
        help
          This can be either a single cpio archive with a .cpio suffix or a
          space-separated list of directories and files for building the
          initramfs image.  A cpio archive should contain a filesystem archive
          to be used as an initramfs image.  Directories should contain a
          filesystem layout to be included in the initramfs image.  Files
          should contain entries according to the format described by the
          "usr/gen_init_cpio" program in the kernel tree.

          When multiple directories and files are specified then the
          initramfs image will be the aggregate of all of them.

 Grant> It works fine the way it is.  What's the reason for disabling the
 Grant> buildign of a cpio file source list?

Is there any advantage to using a source file for gen_init_cpio instead
of just building a cpio archive?

-- 
Bye, Peter Korsgaard
