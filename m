From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Dec 2017 21:51:17 +0100
Subject: [Buildroot] [PATCH] rsync: add upstream security fix for
 CVE-2017-16548
In-Reply-To: <20171219115628.16785-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 19 Dec 2017 12:56:28 +0100")
References: <20171219115628.16785-1-peter@korsgaard.com>
Message-ID: <87shc65tmi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The receive_xattr function in xattrs.c in rsync 3.1.2 and 3.1.3-development
 > does not check for a trailing '\0' character in an xattr name, which allows
 > remote attackers to cause a denial of service (heap-based buffer over-read
 > and application crash) or possibly have unspecified other impact by sending
 > crafted data to the daemon.

 > For more details, see:
 > https://bugzilla.samba.org/show_bug.cgi?id=13112

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
