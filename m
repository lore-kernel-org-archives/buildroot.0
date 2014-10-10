From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Oct 2014 23:58:45 +0200
Subject: [Buildroot] [PATCH] vlc: fix build when Qt4 development files
	are installed on the host
In-Reply-To: <1412802667-22749-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 8 Oct 2014 23:11:07 +0200")
References: <1412802667-22749-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9538u3u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When Qt4 development files are installed on the host, VLC uses
 > /usr/bin/moc, /usr/bin/uic and /usr/bin/rcc when Qt support is
 > enabled. However, those host installed versions are not necessarily
 > compatible with the Qt version used in Buildroot, causes some build
 > failures.

 > This commit therefore passes explicit ac_cv_path_MOC, ac_cv_path_RCC
 > and ac_cv_path_UIC variables to make sure the Qt host tools built by
 > Buildroot are used.

 > Note that the VLC configure.ac script uses 'pkg-config
 > --variable=exec_prefix QtCore' to find the location of such tools, but
 > this invocation returns /usr. One solution would have been to extend
 > the pkgconf-01-fix-variable.patch we have against pkgconf to also
 > cover exec_prefix, but this has more uncertain consequences than just
 > fixing VLC.

 > Fixes:

 >   http://autobuild.buildroot.org/results/061/06174eaeb7f2b8a591395e607912ad72623b79e3/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
