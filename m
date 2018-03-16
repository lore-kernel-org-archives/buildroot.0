From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Mar 2018 14:06:36 +0100
Subject: [Buildroot] [PATCH] make: fix build with glibc 2.27
In-Reply-To: <20180316102158.ponyrtdiilfmi5a3@tarshish> (Baruch Siach's
 message of "Fri, 16 Mar 2018 12:21:58 +0200")
References: <1335b4d70acf1aacdc0d4f40fedfa69320debf6a.1521187256.git.baruch@tkos.co.il>
 <87h8pggx75.fsf@dell.be.48ers.dk>
 <20180316102158.ponyrtdiilfmi5a3@tarshish>
Message-ID: <87d104gof7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> > +MAKE_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-pkgconf
 >> 
 >> The patch looks good, but why are you pulling in host-pkgconf?

 > Otherwise configure fails:

 > ./configure: line 9666: PKG_PROG_PKG_CONFIG: command not found
 > ./configure: line 9678: syntax error near unexpected token `GUILE,'
 > ./configure: line 9678: `   PKG_CHECK_MODULES(GUILE, guile-2.0, have_guile=yes,'

 > This does not trigger without autoreconf since we disable guile support in 
 > make to break circular dependency IIRC.

Ok, can you please a note about that in the commit message?

-- 
Bye, Peter Korsgaard
