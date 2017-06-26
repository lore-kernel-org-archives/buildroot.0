From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 09:59:51 +0200
Subject: [Buildroot] [PATCH] apache: security bump to version 2.4.26
In-Reply-To: <20170620211345.18677-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 20 Jun 2017 23:13:45 +0200")
References: <20170620211345.18677-1-peter@korsgaard.com>
Message-ID: <87efu7i3go.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-3167: In Apache httpd 2.2.x before 2.2.33 and 2.4.x before 2.4.26,
 > use of the ap_get_basic_auth_pw() by third-party modules outside of the
 > authentication phase may lead to authentication requirements being bypassed.

 > CVE-2017-3169: In Apache httpd 2.2.x before 2.2.33 and 2.4.x before 2.4.26,
 > mod_ssl may dereference a NULL pointer when third-party modules call
 > ap_hook_process_connection() during an HTTP request to an HTTPS port.

 > CVE-2017-7659: A maliciously constructed HTTP/2 request could cause
 > mod_http2 to dereference a NULL pointer and crash the server process.

 > CVE-2017-7668: The HTTP strict parsing changes added in Apache httpd 2.2.32
 > and 2.4.24 introduced a bug in token list parsing, which allows
 > ap_find_token() to search past the end of its input string.  By maliciously
 > crafting a sequence of request headers, an attacker may be able to cause a
 > segmentation fault, or to force ap_find_token() to return an incorrect
 > value.

 > CVE-2017-7679: In Apache httpd 2.2.x before 2.2.33 and 2.4.x before 2.4.26,
 > mod_mime can read one byte past the end of a buffer when sending a malicious
 > Content-Type response header.

 > While we're at it, use the upstream sha256 checksum instead of sha1.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
