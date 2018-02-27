From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 22:06:22 +0100
Subject: [Buildroot] [PATCH] systemd: Fix relative ln add-wants wrapper
In-Reply-To: <20180223201835.16143-1-tpiepho@impinj.com> (Trent Piepho's
 message of "Fri, 23 Feb 2018 12:18:35 -0800")
References: <20180223201835.16143-1-tpiepho@impinj.com>
Message-ID: <87d10qm9bl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 > The patch to allow systemd to work with old "ln" versions that don't
 > support --relative didn't work properly in the the meson-add-wants.sh
 > script.

 > This results in all the links in systemd's "*.wants" directories being
 > broken, e.g.
 > /usr/lib/systemd/system/multi-user.target.wants/getty.target ->
 >   ../../../../usr/lib/systemd/system/getty.target
 > There is one too few ".." in that relative link.

 > The problem is that the script is called with the link name being either a
 > file or an existing directory.  In the latter case, ln creates the link in
 > the directory using the name of the target.  This means the link is one
 > level deeper than the relative link making code thinks.

 > The solution used is to only dirname the link, moving up a level, if it's
 > not a directory, to mimic ln's logic in how it creates links.

 > Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
