From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2015 11:34:45 +0200
Subject: [Buildroot] [PATCH 1/1] Fix mkfs.jffs2 --pagesize parameter
	usage.
In-Reply-To: <1432059990-5541-1-git-send-email-mlesniew@gmail.com>
 (=?utf-8?Q?=22Micha=C5=82=09Le=C5=9Bniewski=22's?= message of "Tue, 19 May
 2015 20:26:30 +0200")
References: <1432059990-5541-1-git-send-email-mlesniew@gmail.com>
Message-ID: <87twv50xca.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Micha?" == Micha? Le?niewski <mlesniew@gmail.com> writes:

 > This fixes bug 8186 on Bugzilla.
 > The mkfs.jffs2 accepts a --pagesize parameter, which allows specifying
 > the size of the virtual memory page size of the target machine, where
 > the image will be used.  (This is the value of the PAGE_SIZE macro in
 > Linux.)  In most cases the parameter doesn't need to be set as the
 > default value of 4 kB is usually correct.

 > The parameter was used incorrectly in Buildroot -- it was set to the
 > page size of flash memory chip --  this commit fixes this problem.  Now
 > the --pagesize parameter is not used at all (unless the user explicitly
 > chooses to use a custom value during configuration).  All defconfigs existing
 > defconfigs were corrected to match the new configuration variable names.

 > Signed-off-by: Micha? Le?niewski <mlesniew@gmail.com>

Thanks, committed with a slightly reworded commit message and
Config.in.legacy handling for the renamed symbols.
 
 > +config BR2_TARGET_ROOTFS_JFFS2_USE_CUSTOM_PAGESIZE
 > +	bool "Select custom virtual memory page size"
 > +	default false

NIT: bool symbols default to false, so this line isn't needed.

-- 
Bye, Peter Korsgaard
