From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Sep 2009 10:02:12 +0200
Subject: [Buildroot] [PATCH] libarchive package added
In-Reply-To: <20090901225917.GE9410@buzzloop.caiaq.de> (Daniel Mack's message
	of "Wed\, 2 Sep 2009 00\:59\:17 +0200")
References: <1251209096-31922-1-git-send-email-daniel@caiaq.de>
	<87skf6pvi6.fsf@macbook.be.48ers.dk>
	<20090901150717.GC17682@buzzloop.caiaq.de>
	<87ocpupueq.fsf@macbook.be.48ers.dk>
	<20090901225917.GE9410@buzzloop.caiaq.de>
Message-ID: <87k50hpyez.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 >> Ok, we don't normally do this per-package - So I'm hessitant to add
 >> it here. Other than that, it looks fine.

 Daniel> Hmm, maybe that should be an option to more packages then, and
 Daniel> it could be added on demand, eg. whenever someone needs that.

I think adding so many configuration options for something like that
will just confuse people / complicate testing too much. Using
BR2_ROOTFS_POST_BUILD_SCRIPT for this seems like a nicer (and more
flexible) solution to me.

 Daniel> But I understand that you're hessitant, so drop that part if you like,
 Daniel> and we remove the installed files later from our postbuild script. No
 Daniel> problem :)

Ok, added without that part. Notice that libarchive needs wchar support:

libarchive/archive_entry.c: In function 'aes_get_wcs':
libarchive/archive_entry.c:234: error: implicit declaration of function 'mbstowcs'

I've fixed the kconfig to ensure that.

-- 
Bye, Peter Korsgaard
