From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:10:30 +0200
Subject: [Buildroot] [PATCH] busybox: no need to disable clear and reset
In-Reply-To: <20170424201323.30582-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 24 Apr 2017 22:13:23 +0200")
References: <20170424201323.30582-1-arnout@mind.be>
Message-ID: <87y3unod95.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Removing clear and reset from the busybox config when the ncurses tools
 > are enabled is not really needed.

 > Since commit 802bff9c42, the busybox install will not overwrite
 > existing programs. Therefore, the tools will be installed correctly
 > regardless of the order of the build:
 > - if busybox is built first, the clear and reset apps are installed,
 >   but they will be overwritten by ncurses;
 > - if ncurses is built first, it will install the clear and reset apps,
 >   and busybox will no longer install them.

 > We prefer not to modify the busybox configuration when not strictly
 > necessary, because it is surprising for the user that his configuration
 > is not applied. Clearly, it's not ideal that busybox is configured with
 > redundant apps, but if the user wants to shrink it, it's possible to
 > provide a custom config.

 > This partially reverts commit 33c72344a8686a136c1da6a056ed6c0945bbf8b7.

 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Cc: Danomi Manchego <danomimanchego123@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks!

-- 
Bye, Peter Korsgaard
