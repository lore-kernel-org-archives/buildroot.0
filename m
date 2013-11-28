From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 17:30:23 +0100
Subject: [Buildroot] [PATCH v3] lvm2: replace
	!BR2_PACKAGE_LVM2_DMSETUP_ONLY by BR2_PACKAGE_LVM2_STANDARD_INSTALL
In-Reply-To: <1385627368-10835-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 28 Nov 2013 09:29:28 +0100")
References: <1385627368-10835-1-git-send-email-arnout@mind.be>
Message-ID: <87d2lkzdy8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > BR2_PACKAGE_LVM2_DMSETUP_ONLY is a "negative" option that disables
 > build and install of part of the suite. This option cannot be unselected
 > by other config options, which gives a problem for BR2_PACKAGE_UDISKS_LVM2:
 > it needs BR2_PACKAGE_LVM2_APP_LIBRARY, which requires the full suite.

 > Therefore, replace the negative BR2_PACKAGE_LVM2_DMSETUP_ONLY by a positive
 > BR2_PACKAGE_LVM2_STANDARD_INSTALL. To make sure that existing defconfigs
 > keep working, the new option defaults to y unless the legacy
 > BR2_PACKAGE_LVM2_DMSETUP_ONLY was selected.

 > Fixes http://autobuild.buildroot.net/results/ea4627cae45e972ebba5b33a2b2871ce7f46fedc/

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Note that in the legacy handling I've assumed that this will still
 > be taken in 2013.11.

Committed, thanks.

-- 
Bye, Peter Korsgaard
