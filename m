From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 07:39:07 +0200
Subject: [Buildroot] /dev files not being created correctly
In-Reply-To: <204928.46075.qm@web43412.mail.sp1.yahoo.com> (Mark Fisher's
	message of "Tue\, 14 Apr 2009 06\:55\:14 -0700 \(PDT\)")
References: <204928.46075.qm@web43412.mail.sp1.yahoo.com>
Message-ID: <87eivua32c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Fisher <fobs12@ymail.com> writes:

 Mark> Hi,

 Mark> I'm relatively new to buildroot and am using the 2009.02
 Mark> release of buildroot on a Fedora 9 platform and targeting an
 Mark> embedded device with an Intel Atom processor.
 
 Mark> When the root filesystem is built the types of the files are
 Mark> all set to plain text files. So for instance the /dev/console
 Mark> is not set to be a character device. This has already create
 Mark> problems when I try to boot because the console could not be
 Mark> opened. I manually fixed /dev/console and /dev/null. I'm still
 Mark> having trouble booting the image and also after a re-build my
 Mark> custom changes were lost.

You shouldn't use the project_build_arm/*/root directory to boot from
NFS. The /dev entries are normal files as we don't want to require
root rights while building. Instead create a tarball (target
filesystem options->tar the root filesystem) and extract that (found
under binaries/) as root on your nfs server.

-- 
Bye, Peter Korsgaard
