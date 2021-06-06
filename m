From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Jun 2021 17:14:44 +0200
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.16.5
In-Reply-To: <20210606115018.13237-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 6 Jun 2021 13:50:18 +0200")
References: <20210606115018.13237-1-peter@korsgaard.com>
Message-ID: <87lf7nxbx7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-33195: The LookupCNAME, LookupSRV, LookupMX, LookupNS, and
 >   LookupAddr functions in net, and their respective methods on the Resolver
 >   type may return arbitrary values retrieved from DNS which do not follow
 >   the established RFC 1035 rules for domain names.  If these names are used
 >   without further sanitization, for instance unsafely included in HTML, they
 >   may allow for injection of unexpected content.  Note that LookupTXT may
 >   still return arbitrary values that could require sanitization before
 >   further use

 > - CVE-2021-33196: The NewReader and OpenReader functions in archive/zip can
 >   cause a panic or an unrecoverable fatal error when reading an archive that
 >   claims to contain a large number of files, regardless of its actual size

 > - CVE-2021-33197: ReverseProxy in net/http/httputil could be made to forward
 >   certain hop-by-hop headers, including Connection.  In case the target of
 >   the ReverseProxy was itself a reverse proxy, this would let an attacker
 >   drop arbitrary headers, including those set by the ReverseProxy.Director

 > - CVE-2021-33198: The SetString and UnmarshalText methods of math/big.Rat
 >   may cause a panic or an unrecoverable fatal error if passed inputs with
 >   very large exponents

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
