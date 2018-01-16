From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 23:25:10 +0100
Subject: [Buildroot] [PATCH 1/1] kconfig: Apply upstream nconfig
 ncurses/ncursesw fix
In-Reply-To: <20180114172807.28196-1-g@maral.me> (Guillermo A. Amaral's
 message of "Sun, 14 Jan 2018 09:28:07 -0800")
References: <20180114163932.GA24925@enterprise.starfleet>
 <20180114172807.28196-1-g@maral.me>
Message-ID: <87k1whe915.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillermo" == Guillermo A Amaral <g@maral.me> writes:

 > Buildroot's "make nconfig" command stopped working a while ago on all my
 > Gentoo systems. Running the command would result in a crash.

 > I found that the issue was caused by lxdialog's cflags which are also
 > used to build nconfig; It would detect *ncursesw* and turn on WIDECHAR
 > support -- but the Makefile would still link to plain *ncurses* while
 > building nconfig (which was built without WIDECHAR support).

 > This would cause a crash after using *wattrset* on a WINDOW instance.
 > WIDECHAR *wattrset* would try to set the _color member in the WINDOW
 > struct which does not exist in the NON-WIDECHAR ncurses instance. It
 > would end up clobbering data outside the struct (usually _line entries).

 > I found an upstream patch fixing the issue, so I'm applying it to
 > Buildroot's kconfig.

 > Signed-off-by: Guillermo A. Amaral <g@maral.me>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
