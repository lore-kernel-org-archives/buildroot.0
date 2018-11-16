From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 23:29:01 +0100
Subject: [Buildroot] [PATCH] package/openocd: add missing host-pkgconf
 dependency
In-Reply-To: <20181115164655.9978-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 15 Nov 2018 17:46:55 +0100")
References: <20181115164655.9978-1-thomas.petazzoni@bootlin.com>
Message-ID: <87bm6or70y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The configure.ac script uses PKG_CHECK_MODULES(), and we autoreconf
 > the package, so host-pkgconf should be listed in the dependencies.

 > This issue is seen either with per-package folders, or by doing a
 > clean build with just "make openocd":

 >>>> openocd 0.10.0 Configuring
 >>>> openocd 0.10.0 Autoreconfiguring
 > [...]
 > configure.ac:12: error: possibly undefined macro: AC_MSG_WARN
 >       If this token and others are legitimate, please use m4_pattern_allow.
 >       See the Autoconf documentation.
 > configure.ac:201: error: possibly undefined macro: AC_DEFINE
 > configure.ac:582: error: possibly undefined macro: AC_MSG_NOTICE

 > Even if the message seems unrelated, it's really the lack of pkg.m4
 > from host-pkgconf that causes the issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


Committed, thanks.

-- 
Bye, Peter Korsgaard
