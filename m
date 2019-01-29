From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 19:29:52 +0100
Subject: [Buildroot] [PATCH] package/apache: security bump to version
 2.4.38
In-Reply-To: <20190122181542.11918-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 22 Jan 2019 19:15:42 +0100")
References: <20190122181542.11918-1-peter@korsgaard.com>
Message-ID: <874l9r5nbz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 >   *) SECURITY: CVE-2018-17199 (cve.mitre.org)
 >      mod_session: mod_session_cookie does not respect expiry time allowing
 >      sessions to be reused.  [Hank Ibell]

 >   *) SECURITY: CVE-2018-17189 (cve.mitre.org)
 >      mod_http2: fixes a DoS attack vector. By sending slow request bodies
 >      to resources not consuming them, httpd cleanup code occupies a server
 >      thread unnecessarily. This was changed to an immediate stream reset
 >      which discards all stream state and incoming data.  [Stefan Eissing]

 >   *) SECURITY: CVE-2019-0190 (cve.mitre.org)
 >      mod_ssl: Fix infinite loop triggered by a client-initiated
 >      renegotiation in TLSv1.2 (or earlier) with OpenSSL 1.1.1 and
 >      later.  PR 63052.  [Joe Orton]

 > For more details, see the CHANGES file:
 > https://www.apache.org/dist/httpd/CHANGES_2.4.38

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
