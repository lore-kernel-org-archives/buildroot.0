From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Feb 2013 23:37:58 +0100
Subject: [Buildroot] [RFC] Removing CLEAN_CMDS and
	UNINSTALL_(STAGING|TARGET)_CMDS
Message-ID: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is an RFC patch set to discuss whether or not we should keep the
<pkg>_CLEAN_CMDS, <pkg>_UNINSTALL_TARGET_CMDS and
<pkg>_UNINSTALL_STAGING_CMDS. It is a topic that has been discussed at
various times in the past months/years.

A lot of packages don't implement them, we generally don't ask for
them to be implemented when reviewing packages, and the uninstall
commands are generally never updated when a package version is bumped,
which means that they are probably bitrotting pretty quickly. We also
have no automated way of testing these commands.

That said, it is true that the <pkg>-clean target might be useful for
some use cases. However, is <pkg>-uninstall really useful, considering
that it doesn't take into account the removal of the reverse
dependencies?

Again, this patch set is not meant to be applied as is, it is here to
get the discussion started. Sending the patches with it is simply a
way to ensure that the discussion is considered seriously :-)

Best regards,

Thomas
