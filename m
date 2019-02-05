From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 20:27:31 +0100
Subject: [Buildroot] [PATCH] package/dovecot: security bump to version
 2.3.4.1
In-Reply-To: <20190205165710.11918-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 5 Feb 2019 17:57:10 +0100")
References: <20190205165710.11918-1-peter@korsgaard.com>
Message-ID: <875ztykpcs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 >  * CVE-2019-3814: If imap/pop3/managesieve/submission client has
 >    trusted certificate with missing username field
 >    (ssl_cert_username_field), under some configurations Dovecot
 >    mistakenly trusts the username provided via authentication instead
 >    of failing.

 >  * ssl_cert_username_field setting was ignored with external SMTP AUTH,
 >    because none of the MTAs (Postfix, Exim) currently send the
 >    cert_username field. This may have allowed users with trusted
 >    certificate to specify any username in the authentication. This bug
 >    didn't affect Dovecot's Submission service.

 > For more details, see the announcement:
 > https://www.dovecot.org/list/dovecot-news/2019-February/000394.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
