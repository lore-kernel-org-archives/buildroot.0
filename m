From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Oct 2017 09:44:19 +0200
Subject: [Buildroot] [PATCH] irssi: security bump to version 1.0.5
In-Reply-To: <20171023230836.23832-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 24 Oct 2017 01:08:36 +0200")
References: <20171023230836.23832-1-peter@korsgaard.com>
Message-ID: <87bmkv4qp8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > (a) When installing themes with unterminated colour formatting
 >     sequences, Irssi may access data beyond the end of the
 >     string. (CWE-126) Found by Hanno B?ck.

 >     CVE-2017-15228 was assigned to this issue.

 > (b) While waiting for the channel synchronisation, Irssi may
 >     incorrectly fail to remove destroyed channels from the query list,
 >     resulting in use after free conditions when updating the state
 >     later on. Found by Joseph Bisch. (CWE-416 caused by CWE-672)

 >     CVE-2017-15227 was assigned to this issue.

 > (c) Certain incorrectly formatted DCC CTCP messages could cause NULL
 >     pointer dereference. Found by Joseph Bisch. This is a separate,
 >     but similar issue to CVE-2017-9468. (CWE-690)

 >     CVE-2017-15721 was assigned to this issue.

 > (d) Overlong nicks or targets may result in a NULL pointer dereference
 >     while splitting the message. Found by Joseph Bisch. (CWE-690)

 >     CVE-2017-15723 was assigned to this issue.

 > (e) In certain cases Irssi may fail to verify that a Safe channel ID
 >     is long enough, causing reads beyond the end of the string. Found
 >     by Joseph Bisch. (CWE-126)

 >     CVE-2017-15722 was assigned to this issue.

 > For more details, see the advisory:
 > https://irssi.org/security/irssi_sa_2017_10.txt

 > While we're at it, also add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
