From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2021 11:33:19 +0100
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.20.1
In-Reply-To: <20210107222412.10742-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 7 Jan 2021 23:24:12 +0100")
References: <20210107222412.10742-1-peter@korsgaard.com>
Message-ID: <87h7nmmols.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-8265: use-after-free in TLSWrap (High) Affected Node.js versions
 >   are vulnerable to a use-after-free bug in its TLS implementation.  When
 >   writing to a TLS enabled socket, node::StreamBase::Write calls
 >   node::TLSWrap::DoWrite with a freshly allocated WriteWrap object as first
 >   argument.  If the DoWrite method does not return an error, this object is
 >   passed back to the caller as part of a StreamWriteResult structure.  This
 >   may be exploited to corrupt memory leading to a Denial of Service or
 >   potentially other exploits

 > - CVE-2020-8287: HTTP Request Smuggling in nodejs Affected versions of
 >   Node.js allow two copies of a header field in a http request.  For
 >   example, two Transfer-Encoding header fields.  In this case Node.js
 >   identifies the first header field and ignores the second.  This can lead
 >   to HTTP Request Smuggling

 > - CVE-2020-1971: OpenSSL - EDIPARTYNAME NULL pointer de-reference (High)
 >   This is a vulnerability in OpenSSL which may be exploited through Node.js.
 >   You can read more about it in
 >   https://www.openssl.org/news/secadv/20201208.txt

 > Update the license hash for the addition of the (MIT licensed)
 > cjs-module-lexer module:
 > https://github.com/nodejs/node/commit/9eb1fa19248949dfc716807b1dc97dedf36da14e

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
