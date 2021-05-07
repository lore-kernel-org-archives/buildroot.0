From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 May 2021 09:23:08 +0200
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.31
In-Reply-To: <20210501110300.22647-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 1 May 2021 13:02:59 +0200")
References: <20210501110300.22647-1-peter@korsgaard.com>
Message-ID: <87wnsb0zz7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - A malformed incoming IXFR transfer could trigger an assertion failure in
 >   named, causing it to quit abnormally.  (CVE-2021-25214)

 > - named crashed when a DNAME record placed in the ANSWER section during
 >   DNAME chasing turned out to be the final answer to a client query.
 >   (CVE-2021-25215)

 > - When a server's configuration set the tkey-gssapi-keytab or
 >   tkey-gssapi-credential option, a specially crafted GSS-TSIG query could
 >   cause a buffer overflow in the ISC implementation of SPNEGO (a protocol
 >   enabling negotiation of the security mechanism used for GSSAPI
 >   authentication).  This flaw could be exploited to crash named binaries
 >   compiled for 64-bit platforms, and could enable remote code execution when
 >   named was compiled for 32-bit platforms.  (CVE-2021-25216)

 > For more details, see the release notes:
 > https://downloads.isc.org/isc/bind9/9.11.31/RELEASE-NOTES-bind-9.11.31.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
