From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 16:04:21 +0100
Subject: [Buildroot] [PATCH] package/privoxy: security bump to version
 3.0.32
In-Reply-To: <20210301164910.13080-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Mar 2021 17:49:10 +0100")
References: <20210301164910.13080-1-peter@korsgaard.com>
Message-ID: <87h7lf3xje.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Privoxy 3.0.32 fixes a number of security issues:
 > - Security/Reliability:
 >   - ssplit(): Remove an assertion that could be triggered with a
 >     crafted CGI request.
 >     Commit 2256d7b4d67. OVE-20210203-0001.
 >     Reported by: Joshua Rogers (Opera)
 >   - cgi_send_banner(): Overrule invalid image types. Prevents a
 >     crash with a crafted CGI request if Privoxy is toggled off.
 >     Commit e711c505c48. OVE-20210206-0001.
 >     Reported by: Joshua Rogers (Opera)
 >   - socks5_connect(): Don't try to send credentials when none are
 >     configured. Fixes a crash due to a NULL-pointer dereference
 >     when the socks server misbehaves.
 >     Commit 85817cc55b9. OVE-20210207-0001.
 >     Reported by: Joshua Rogers (Opera)
 >   - chunked_body_is_complete(): Prevent an invalid read of size two.
 >     Commit a912ba7bc9c. OVE-20210205-0001.
 >     Reported by: Joshua Rogers (Opera)
 >   - Obsolete pcre: Prevent invalid memory accesses with an invalid
 >     pattern passed to pcre_compile(). Note that the obsolete pcre code
 >     is scheduled to be removed before the 3.0.33 release. There has been
 >     a warning since 2008 already.
 >     Commit 28512e5b624. OVE-20210222-0001.
 >     Reported by: Joshua Rogers (Opera)

 > for more details, see the announcement:
 > https://www.openwall.com/lists/oss-security/2021/02/28/1

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
