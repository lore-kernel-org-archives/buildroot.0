From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Feb 2014 09:37:33 +0100
Subject: [Buildroot] [PATCH] libtool: fix build on systems with
	automake-1.11 (e.g. Fedora 10)
In-Reply-To: <1392937787-23542-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 21 Feb 2014 00:09:47 +0100")
References: <1392937787-23542-1-git-send-email-arnout@mind.be>
Message-ID: <87fvn8nbxu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > package/libtool/libtool-0001-mips64-n64-linking.patch touches an m4
 > file, so applying it triggers a run of autoconf, automake, etc. This
 > sometimes leads to build failures due to incompatible system autotools.
 > This was observed on Fedora 10, which has automake 1.11 while the
 > generated files that are included in the tarball require automake
 > 1.11.1.

 > We cannot simply set HOST_LIBTOOL_AUTORECONF = YES because that would
 > create a circular dependency on host-libtool. Therefore, the patch
 > patch is applied on the installed libtool.m4 instead of in the source
 > tree. Then, it also needs to be renamed to something that doesn't
 > match buildroot's patch convention so it doesn't get picked up
 > automatically.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
