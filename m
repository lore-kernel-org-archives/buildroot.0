From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Feb 2014 22:26:41 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: make scan_patchdir work
	recursively
In-Reply-To: <f1b0803ef9dea3b4f376.1391768188@argentina> (Thomas De
 Schampheleire's message of "Fri, 07 Feb 2014 11:16:28 +0100")
References: <f1b0803ef9dea3b4f376.1391768188@argentina>
Message-ID: <87y51l47ou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > scan_patchdir is called recursively. For this to work properly, the
 > variable path which is set to $1 at the very beginning must be local not
 > global.

 > A test case is to set BR2_GLOBAL_PATCH_DIR to 'mypatches' and having the
 > following tree in the buildroot root:

 > $ find mypatches/
 > mypatches/
 > mypatches/busybox
 > mypatches/busybox/subdir.patch
 > mypatches/busybox/subdir.patch/busybox-0001-abc.patch
 > mypatches/busybox/busybox-0002-def.patch
 > mypatches/busybox/asubdir.patch
 > mypatches/busybox/asubdir.patch/busybox-0003-xyz.patch

 > When running 'make busybox-dirclean busybox-patch' originally, you'd get:

 >     Applying busybox-0003-xyz.patch using patch:

 >     Applying busybox-0002-def.patch using patch:
 >     Error: missing patch file
 >     mypatches/busybox/asubdir.patch/busybox-0002-def.patch

 > While with this fix:

 >     Applying busybox-0003-xyz.patch using patch:

 >     Applying busybox-0002-def.patch using patch:

 >     Applying busybox-0001-abc.patch using patch:


 > This fixes bug #6434 (https://bugs.busybox.net/show_bug.cgi?id=6434)

 > Signed-off-by: Daniel Mentz <daniel@exxm.de>
 > [Thomas: update commit message with test case]
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
