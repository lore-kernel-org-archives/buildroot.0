From: Paul Archer <ptarcher@gmail.com>
Date: Thu, 28 May 2009 14:32:42 +1000
Subject: [Buildroot] 2009.05-rc3 released
In-Reply-To: <87k5428ixt.fsf@macbook.be.48ers.dk>
References: <87k5428ixt.fsf@macbook.be.48ers.dk>
Message-ID: <56ea0bb80905272132n34933d3fh925bd0e765eb6f5d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 28, 2009 at 5:06 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
Peter> And report any issues found here or in the bugtracker.
I have been trying to build buildroot with a ubifs image. I haven't
quite got there yet, but there are some bugs associated with this
version.

target/ubifs/ubifsroot.mk
$(call DOWNLOAD,"$(MKFS_UBIFS_URL)")

This should be a WGET, not a DOWNLOAD.

I have been trying to update the UBIFS support as this is now included
in the mtd-utils package under the mkfs.ubifs.
ubifs also depends on e2fsprogs as there is uuid support needed in
mkfs.ubifs. I have at least gotten ubifs to compile with a few changes
here and there (mainly a change in mtd-utils makefiles to build
mkfs.ubifs), but I haven't had time to get an image made yet.

-- 
----
Regards
Paul Archer
ptarcher at gmail.com
