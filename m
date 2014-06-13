From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 14:23:04 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: fix AM_PATH_LIBGCRYPT not found
In-Reply-To: <1402521982-31067-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Wed, 11 Jun 2014 23:26:22 +0200")
References: <1402521982-31067-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <871tutf17b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > This patch installs a copy of libgcrypt.m4 from the libgcrypt source tarball
 > to systemd m4 directory.

 > Libgcrypt uses a custom m4 macro and not pkg-config to check if the
 > development files are available. Though libgcrypt support is optional in
 > systemd, this macro should be available whenever autoreconf is used,
 > otherwise the re-configuration will fail with:

 >   configure.ac:616: warning: macro 'AM_PATH_LIBGCRYPT' not found in library

 > The call to autoreconf is required, as it is needed by the patch which
 > solves the `ln --relative` issue.

 > As asking the user to install the development package of libgcrypt on
 > the host machine or adding libgcrypt as a build dependency to systemd is
 > not acceptable, the required file is added to the m4 directory.

 > Fixes: http://autobuild.buildroot.net/results/1524d346fa17749e2ae62e063b9cfdd0de95c76a/
 > Fixes: http://autobuild.buildroot.net/results/10bcd92437eaa27eb61f8281c93efcb53d555e35/
 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
