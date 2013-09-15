From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:08:15 +0200
Subject: [Buildroot] [PATCHv2 09/14] gcc: force symlink creation
In-Reply-To: <1378138000-12739-10-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:35 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87six5iyio.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The HOST_GCC_CONFIGURE_SYMLINK creates a symbolic link
 Thomas> $(@D)/build/configure -> $(@D)/configure for each build step of
 Thomas> gcc. However, it was only using 'ln -s' and not 'ln -sf', which was
 Thomas> causing problems when doing 'make host-gcc-final-reconfigure' for
 Thomas> example, because the configure commands (including this macro) are
 Thomas> being re-executed, but the symbolic link already exists.

 Thomas> Changing this symbolic link creation to 'ln -sf' fixes this problem.

Committed, thanks.

-- 
Bye, Peter Korsgaard
