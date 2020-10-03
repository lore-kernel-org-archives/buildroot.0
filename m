From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2020 08:19:00 +0200
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.18.4
In-Reply-To: <20201001184922.18748-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 1 Oct 2020 20:49:22 +0200")
References: <20201001184922.18748-1-peter@korsgaard.com>
Message-ID: <87k0w7zvaj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-8201: HTTP Request Smuggling due to CR-to-Hyphen conversion

 >   Affected Node.js versions converted carriage returns in HTTP request
 >   headers to a hyphen before parsing.  This can lead to HTTP Request
 >   Smuggling as it is a non-standard interpretation of the header.

 >   Impacts:
 >     All versions of the 14.x and 12.x releases line

 > - CVE-2020-8252: fs.realpath.native may cause buffer overflow

 >   libuv's realpath implementation incorrectly determined the buffer size
 >   which can result in a buffer overflow if the resolved path is longer than
 >   256 bytes.

 >   Impacts:
 >     All versions of the 10.x release line
 >     All versions of the 12.x release line

 > For more details, see the advisory:
 > https://nodejs.org/en/blog/vulnerability/september-2020-security-releases/

 > Adjust license hash for the addition of the BSD-3c licensed highlight.js:
 > https://github.com/nodejs/node/commit/6f8b7a85d239129273948386c34775810f2dc4a3

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
