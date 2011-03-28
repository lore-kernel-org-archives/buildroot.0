From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 28 Mar 2011 12:18:22 -0400
Subject: [Buildroot] Add Package: htop
In-Reply-To: <4D90B11D.4070607@AdTran.com>
References: <4D90B11D.4070607@AdTran.com>
Message-ID: <AANLkTikJvMyKTpn4yZp3JrsvXREU=hM0GxgCuE7heB4i@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 28, 2011 at 12:02 PM, Andy Kennedy wrote:
> Adds package htop. ?Changes made based upon e-mails with Mike Frysinger
> and Gerhard Heift. ?The autoreconf change is important for anyone using
> uClibc as there is no widely available backtrace (yet).

this ver looks mostly sane ...

> ++AC_CHECK_HEADERS([execinfo.h],[:],[:])

no need for munging the other branches
  AC_CHECK_HEADERS([execinfo.h])

> ++if test "$cross_compiling" = "no"; then
> + AC_CHECK_FILE($PROCDIR/stat,,AC_MSG_ERROR(Cannot find /proc/stat. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
> + AC_CHECK_FILE($PROCDIR/meminfo,,AC_MSG_ERROR(Cannot find /proc/meminfo. Make sure you have a Linux-compatible /proc filesystem mounted. See the file README for help.))
> ++fi

AC_CHECK_FILE has fallback cases for cross-compiling i thought, so you
shouldnt need to check cross_compiling yourself
-mike
