From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 00:59:44 +0200
Subject: [Buildroot] [PATCH 1/2] host-autoconf-archive: install to a
	non-standard location
In-Reply-To: <1431637036-8089-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 14 May 2015 22:57:15 +0200")
References: <1431637036-8089-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87twvedau7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The host-autoconf-archive package was added to provide the necessary
 > autoconf macros for the libsigrok package, and later also used for the
 > thrift package.

 > However, it installs its autoconf macro in
 > $(HOST_DIR)/usr/share/aclocal, which is part of the include directory
 > of autoconf macros used for all autoreconf invocations. Unfortunately,
 > using those macros for all packages is causing a number of
 > regressions: one on host-ola fixed in commit
 > 884af65fd5ddc548f19a26162f905a32ef0b53b3, and one in snmpp. Those
 > packages are autoreconf'ed, but if they are autoreconf'ed with the
 > autoconf-archive macros installed, they no longer work.

 > To solve this problem, this commit implements a simple solution that
 > makes using host-autoconf-archive macros an opt-in mechanism. To
 > achieve this, the autoconf-archive package is modified to install its
 > macros in a special directory, and only the packages that really want
 > to use those macros will have to pass a -I flag pointing to this
 > directory in their <pkg>_AUTORECONF_OPTS variable.

 > Fixes:

 >   http://autobuild.buildroot.org/results/712/712c8083b9eeafa41b60790961028c40b28f59ad/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
