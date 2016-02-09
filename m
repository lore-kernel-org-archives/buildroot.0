From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 10 Feb 2016 00:26:34 +0100
Subject: [Buildroot] [PATCH v3] valgrind: fix musl compile
In-Reply-To: <1455058401-28034-1-git-send-email-ps.report@gmx.net>
References: <1455058401-28034-1-git-send-email-ps.report@gmx.net>
Message-ID: <56BA75AA.20403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09-02-16 23:53, Peter Seiderer wrote:
> Add musl libc detection (based on suggestions by Romain Naour and
> Arnout Vandecappelle) and add some tweaks for musl support (based
> on OpenWRT patch [1]).
> 
> Fixes ([2]):
>   checking the glibc version... unsupported version
>   configure: error: Valgrind requires glibc version 2.2 or later
> 
> Patch suggested upstream (see [3]).
> 
> [1] https://dev.openwrt.org/browser/trunk/package/devel/valgrind/patches/200-musl_fix.patch?rev=46302
> [2] http://autobuild.buildroot.org/results/7b0/7b048ba58918f0a08498c61327fcf35a85a84837
> [3] https://bugs.kde.org/show_bug.cgi?id=359202
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 One small nit:

[snip]
> + 	AC_MSG_RESULT([unsupported version ${GLIBC_VERSION}])
> +-	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later,])
> +-	AC_MSG_ERROR([Darwin libc, Bionic libc or Solaris libc])
> ++	AC_MSG_ERROR([Valgrind requires glibc version 2.2 or later, uclibc,])

 It's uClibc (capital C).

> ++	AC_MSG_ERROR([musl libc, Darwin libc, Bionic libc or Solaris libc])
> + 	;;
> + esac
> + 
[snip]

 I guess you'll update the upstream bug report as well?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
