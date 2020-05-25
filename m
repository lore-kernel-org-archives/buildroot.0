From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 May 2020 21:57:09 +0200
Subject: [Buildroot] [PATCH-2020.02.x] package/git: security bump to
 version 2.24.3
In-Reply-To: <20200524202435.30964-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 24 May 2020 22:24:34 +0200")
References: <20200524202435.30964-1-peter@korsgaard.com>
Message-ID: <87ftbnkctm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 >  * (2.24.2) With a crafted URL that contains a newline in it, the credential
 >    helper machinery can be fooled to give credential information for a wrong
 >    host.  The attack has been made impossible by forbidding a newline
 >    character in any value passed via the credential protocol.

 >  * (2.24.3) With a crafted URL that contains a newline or empty host, or
 >    lacks a scheme, the credential helper machinery can be fooled into
 >    providing credential information that is not appropriate for the protocol
 >    in use and host being contacted.

 >    Unlike the vulnerability CVE-2020-5260 fixed in v2.17.4, the
 >    credentials are not for a host of the attacker's choosing; instead,
 >    they are for some unspecified host (based on how the configured
 >    credential helper handles an absent "host" parameter).

 >    The attack has been made impossible by refusing to work with
 >    under-specified credential patterns.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
