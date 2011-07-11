From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jul 2011 23:24:58 +0200
Subject: [Buildroot] [PATCH 1/1] valgrind: bump to 3.6.1 and add support
	for ARMv7
In-Reply-To: <7ab179c630afa8f3bcafaa99934fed108cf137c5.1310415416.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 11 Jul 2011 22:17:16 +0200")
References: <cover.1310415416.git.thomas.petazzoni@free-electrons.com>
 <cover.1310415416.git.thomas.petazzoni@free-electrons.com>
 <7ab179c630afa8f3bcafaa99934fed108cf137c5.1310415416.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ipr8jys5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We removed the shell script that wrapped valgrind (not nice to install
 Thomas> such non-standard things), and will let the user use the uclibc.supp
 Thomas> suppression file if needed.

Committed, thanks (but see below).

 Thomas> +VALGRIND_VERSION = 3.6.1
 Thomas> +VALGRIND_SITE    = http://valgrind.org/downloads/
 Thomas> +VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 Thomas> +
 Thomas> +VALGRIND_CONF_OPT = --disable-tls

I know we had this before as well, but is that really needed nowadays
with NPTL and so on? It seems to compile fine here without that option.

 Thomas> +$(eval $(call AUTOTARGETS,package,valgrind))
 Thomas> \ No newline at end of file

I've fixed that.

-- 
Bye, Peter Korsgaard
