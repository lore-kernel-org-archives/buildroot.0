From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Nov 2020 14:23:11 +0100
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.14.1
In-Reply-To: <20201112124409.21779-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 12 Nov 2020 13:44:08 +0100")
References: <20201112124409.21779-1-peter@korsgaard.com>
Message-ID: <87blfy92kg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - AST-2020-001: Remote crash in res_pjsip_session
 >   Upon receiving a new SIP Invite, Asterisk did not return the created
 >   dialog locked or referenced.

 > - AST-2020-002: Outbound INVITE loop on challenge with different nonce
 >   If Asterisk is challenged on an outbound INVITE and the nonce is changed
 >   in each response, Asterisk will continually send INVITEs in a loop.  This
 >   causes Asterisk to consume more and more memory since the transaction will
 >   never terminate (even if the call is hung up), ultimately leading to a
 >   restart or shutdown of Asterisk.  Outbound authentication must be
 >   configured on the endpoint for this to occur.

 > For details, see the announcement:
 > https://www.asterisk.org/asterisk-news/asterisk-13-37-1-16-14-1-17-8-1-18-0-1-and-16-8-cert5-now-available-security/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
