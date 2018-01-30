From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 23:49:23 +0100
Subject: [Buildroot] [git commit] support/kconfig: ppply upstream
 nconfig ncurses/ncursesw fix
In-Reply-To: <20180115203626.92E6D81304@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 15 Jan 2018 21:35:38 +0100")
References: <20180115203626.92E6D81304@busybox.osuosl.org>
Message-ID: <87shan9d3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=8aa4ee2b02abe2a04b15ee3ef53887ade9a4afc4
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Buildroot's "make nconfig" command stopped working a while ago on
 > Gentoo systems. Running the command would result in a crash.

 > The issue is caused by lxdialog's cflags which are also used to build
 > nconfig; It would detect *ncursesw* and turn on WIDECHAR support --
 > but the Makefile would still link to plain *ncurses* while building
 > nconfig (which was built without WIDECHAR support).

 > This would cause a crash after using *wattrset* on a WINDOW instance.
 > WIDECHAR *wattrset* would try to set the _color member in the WINDOW
 > struct which does not exist in the NON-WIDECHAR ncurses instance. It
 > would end up clobbering data outside the struct (usually _line entries).

 > An upstream patch fixes the issue, so we're applying it to Buildroot's
 > kconfig.

 > Signed-off-by: Guillermo A. Amaral <g@maral.me>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
