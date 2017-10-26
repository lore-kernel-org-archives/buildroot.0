From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Oct 2017 13:22:48 +0200
Subject: [Buildroot] [PATCH] nodejs: security bump to version 8.8.0
In-Reply-To: <20171026065933.8311-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 26 Oct 2017 08:59:33 +0200")
References: <20171026065933.8311-1-peter@korsgaard.com>
Message-ID: <87lgjy2lx3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-14919 - In zlib v1.2.9, a change was made that causes an
 > error to be raised when a raw deflate stream is initialized with windowBits
 > set to 8.  On some versions this crashes Node and you cannot recover from
 > it, while on some versions it throws an exception.  Node.js will now
 > gracefully set windowBits to 9 replicating the legacy behavior to avoid a
 > DOS vector.

 > For more details, see the announcement:
 > https://nodejs.org/en/blog/vulnerability/oct-2017-dos/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
