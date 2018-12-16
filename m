From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 20:00:19 +0100
Subject: [Buildroot] [PATCH] php: security bump to version 7.2.13
In-Reply-To: <20181207230914.30567-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 8 Dec 2018 00:09:14 +0100")
References: <20181207230914.30567-1-peter@korsgaard.com>
Message-ID: <87r2eh8fgc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-19518: University of Washington IMAP Toolkit 2007f on UNIX,
 > as used in imap_open() in PHP and other products, launches an rsh command
 > (by means of the imap_rimap function in c-client/imap4r1.c and the tcp_aopen
 > function in osdep/unix/tcp_unix.c) without preventing argument injection,
 > which might allow remote attackers to execute arbitrary OS commands if the
 > IMAP server name is untrusted input (e.g., entered by a user of a web
 > application) and if rsh has been replaced by a program with different
 > argument semantics.  For example, if rsh is a link to ssh (as seen on Debian
 > and Ubuntu systems), then the attack can use an IMAP server name containing
 > a "-oProxyCommand" argument.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
