From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Feb 2014 17:10:31 +0100
Subject: [Buildroot] [PATCH] jimtcl: don't attempt to handle ccache
	internally
In-Reply-To: <16d2a46cd18e6ae4f931.1392411459@argentina> (Thomas De
 Schampheleire's message of "Fri, 14 Feb 2014 21:57:39 +0100")
References: <16d2a46cd18e6ae4f931.1392411459@argentina>
Message-ID: <878utcjr0n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > jimtcl tries to use 'ccache' (a non-buildroot host version) which may not
 > exist on the host system. If ccache is enabled in buildroot, the compiler
 > used by jimtcl is:
 > ccache <buildroot>/.../ccache <buildroot>/.../<tuple>-gcc

 > If ccache is not present on the host, this results in the build error:

 > ccache <buildroot>/.../ccache <buildroot>/.../<tuple>-gcc
 > -D_GNU_SOURCE -Wall  -I. -fpic -pipe -Os    -c -o jim-subcmd.o jim-subcmd.c
 > make[1]: ccache: Command not found

 > This patch passes 'CCACHE=none' to the 'configure' script, disabling the
 > internal handling of ccache, so that ccache can be transparently passed
 > through CC.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
