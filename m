From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 17:10:02 +0200
Subject: [Buildroot] [PATCH] nodejs: security bump to version 8.11.1
In-Reply-To: <20180331061155.22458-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 31 Mar 2018 08:11:55 +0200")
References: <20180331061155.22458-1-peter@korsgaard.com>
Message-ID: <87605cuvqt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - Fix for inspector DNS rebinding vulnerability (CVE-2018-7160): A malicious
 >   website could use a DNS rebinding attack to trick a web browser to bypass
 >   same-origin-policy checks and allow HTTP connections to localhost or to
 >   hosts on the local network, potentially to an open inspector port as a
 >   debugger, therefore gaining full code execution access.  The inspector now
 >   only allows connections that have a browser Host value of localhost or
 >   localhost6.

 > - Fix for 'path' module regular expression denial of service
 >   (CVE-2018-7158): A regular expression used for parsing POSIX paths could
 >   be used to cause a denial of service if an attacker were able to have a
 >   specially crafted path string passed through one of the impacted 'path'
 >   module functions.

 > - Reject spaces in HTTP Content-Length header values (CVE-2018-7159): The
 >   Node.js HTTP parser allowed for spaces inside Content-Length header
 >   values.  Such values now lead to rejected connections in the same way as
 >   non-numeric values.

 > While we are at it, also add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
