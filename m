From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 23:04:33 +0100
Subject: [Buildroot] [PATCH v2] util-linux: security bump to version 2.31
In-Reply-To: <1509446871-25076-1-git-send-email-casantos@datacom.ind.br>
 (Carlos Santos's message of "Tue, 31 Oct 2017 08:47:51 -0200")
References: <1509446871-25076-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <87zi87ezym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Fix CVE-2016-2779: runuser in util-linux allows local users to escape to
 > the parent session via a crafted TIOCSTI ioctl call, which pushes
 > characters to the terminal's input buffer.

 > The new experimental "su --pty" feature has been implemented to fix this
 > issue. The feature is not enabled by default and the new command line
 > option --pty is necessary.

 > Add rfkill, a command for enabling and disabling wireless devices. This
 > implementation is based upon, and backward compatible with, the original
 > rfkill from Johannes Berg and Marcel Holtmann, currently provided by the
 > standalone "rfkill" package.

Do you know if there's any reason to prefer this version over our
existing rfkill package? The fact that it isn't available on nommu
probably means we cannot get rid of the separate package, but we may
want to add it to UTIL_LINUX_DEPENDENCIES so the util-linux version
"wins".

 > Add uuidparse, a command to analyze and print information about UUID's.

 > The "reset" script is not part of utill-linux anymore. Add a legacy
 > config telling the user to use either BusyBox or the ncurses program.

 > Drop the ncursesw patch, allready applied upstream. AUTORECONF is not
 > required anymore.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 > Changes v1->v2:
 > - Rebased due to parallel modifications in Config.in.legacy and commit
 >   5868ab5f22300e920474005e3ae4f78e0b210473, which removed
 >   PKG_VERSION_MINOR.

Sorry about that - Committed, thanks!

-- 
Bye, Peter Korsgaard
