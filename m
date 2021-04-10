From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Apr 2021 10:31:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-httplib2: security bump
 to version 0.19.1
In-Reply-To: <20210409222445.3865584-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Apr 2021 00:24:44 +0200")
References: <20210409222445.3865584-1-fontaine.fabrice@gmail.com>
Message-ID: <8735vy5ynt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2021-21240: httplib2 is a comprehensive HTTP client library
 >   for Python. In httplib2 before version 0.19.0, a malicious server
 >   which responds with long series of "\xa0" characters in the
 >   "www-authenticate" header may cause Denial of Service (CPU burn while
 >   parsing header) of the httplib2 client accessing said server. This is
 >   fixed in version 0.19.0 which contains a new implementation of auth
 >   headers parsing using the pyparsing library.
 > - Fix CVE-2020-11078: In httplib2 before version 0.18.0, an attacker
 >   controlling unescaped part of uri for `httplib2.Http.request()` could
 >   change request headers and body, send additional hidden requests to
 >   same server. This vulnerability impacts software that uses httplib2
 >   with uri constructed by string concatenation, as opposed to proper
 >   urllib building with escaping. This has been fixed in 0.18.0.
 > - Use LICENSE file instead of PKG-INFO
 > - pyparsing is a runtime dependency since version 0.19.0 and
 >   https://github.com/httplib2/httplib2/commit/bd9ee252c8f099608019709e22c0d705e98d26bc

 > https://github.com/httplib2/httplib2/blob/v0.19.1/CHANGELOG

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
