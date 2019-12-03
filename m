From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 10:49:54 +0100
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.6.2
In-Reply-To: <20191122225531.28518-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 22 Nov 2019 23:55:31 +0100")
References: <20191122225531.28518-1-peter@korsgaard.com>
Message-ID: <87o8wpoi0t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > AST-2019-006: SIP request can change address of a SIP peer.
 > A SIP request can be sent to Asterisk that can change a SIP peer?s IP
 > address.  A REGISTER does not need to occur, and calls can be hijacked as a
 > result.  The only thing that needs to be known is the peer?s name;
 > authentication details such as passwords do not need to be known.  This
 > vulnerability is only exploitable when the ?nat? option is set to the
 > default, or ?auto_force_rport?.

 > https://downloads.asterisk.org/pub/security/AST-2019-006.pdf

 > AST-2019-007: AMI user could execute system commands.
 > A remote authenticated Asterisk Manager Interface (AMI) user without
 > ?system? authorization could use a specially crafted ?Originate? AMI request
 > to execute arbitrary system commands.

 > https://downloads.asterisk.org/pub/security/AST-2019-007.pdf

 > AST-2019-008: Re-invite with T.38 and malformed SDP causes crash.
 > If Asterisk receives a re-invite initiating T.38 faxing and has a port of 0
 > and no c line in the SDP, a crash will occur.

 > https://downloads.asterisk.org/pub/security/AST-2019-008.pdf

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
