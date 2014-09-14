From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Sep 2014 00:38:35 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-autotools: don't use
	config.site when cross-compiling
In-Reply-To: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Fri, 22 Aug 2014 11:12:53 +0200")
References: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87tx493k0k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > On fedora 20 64bits host, the file /usr/share/config.site contains
 > a fix for installing libraries into /lib/lib64 on 64bits systems
 > that redefine libdir in the generated Makefile

 > For safety and avoid the bug #7262 [1], disable loading this file
 > when running the configure script for the target and the host.

 > Note: configure scripts generated with autoconf < 2.65 will source
 > the /dev/null and print this line:
 > "configure: loading site script /dev/null"

 > [1]: https://bugs.busybox.net/show_bug.cgi?id=7262

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
