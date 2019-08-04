From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 22:17:22 +0200
Subject: [Buildroot] [git commit] package/exim: security bump to version
 4.92.1
In-Reply-To: <20190728113008.B0597810A5@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 28 Jul 2019 12:24:27 +0200")
References: <20190728113008.B0597810A5@busybox.osuosl.org>
Message-ID: <875zncofcd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1d3fe88d084410b0ba55e9ae0ceef19351bbcf99
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes CVE-2019-13917:
 > http://www.exim.org/static/doc/security/CVE-2019-13917.txt

 > https://github.com/Exim/exim/commit/d185889f47b9b27088e777f7d382295c51271586
 > added new code to "Prebuild the data structure for builtin macros".

 > This function needs a host-built binary called macro_predef, it depends
 > on host-berkeleydb, host-pcre and optionally on host-openssl.

 > With an openssl-enabled exim the host build of macro_predef will fail
 > if host-openssl is missing:

 > /usr/bin/gcc -DMACRO_PREDEF macro_predef.c
 > In file included from hash.h:14,
 >                  from exim.h:485,
 >                  from macro_predef.c:11:
 > sha_ver.h:37:12: fatal error: openssl/ssl.h: No such file or directory

 > because macro_predef also has the an optional dependency on openssl:
 > https://github.com/Exim/exim/blob/exim-4.92%2Bfixes/src/src/macro_predef.c#L130

 > Removed patches applied upstream:
 > 0004: https://github.com/Exim/exim/commit/98913c8ea2be5188dd22ec652da1182017e8edb7
 > 0005: https://github.com/Exim/exim/commit/cf3cd306062a08969c41a1cdd32c6855f1abecf1
 > 0007: https://github.com/Exim/exim/commit/7ea1237c783e380d7bdb86c90b13d8203c7ecf26#diff-58af16fe62ea674adf1730edc078d175R6243

 > Added patch to fix uClibc build.

 > Added license hash, switched _SITE to https.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
