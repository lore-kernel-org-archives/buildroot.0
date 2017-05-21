From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 May 2017 23:32:34 +0200
Subject: [Buildroot] [PATCH] dropbear: security bump to version 2017.75
In-Reply-To: <20170520151548.23594-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 20 May 2017 17:15:48 +0200")
References: <20170520151548.23594-1-peter@korsgaard.com>
Message-ID: <87shjx28wd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > - CVE-2017-9078: A double-free in the server could be triggered by an
 >   authenticated user if dropbear is running with -a (Allow connections to
 >   forwarded ports from any host) This could potentially allow arbitrary code
 >   execution as root by an authenticated user.  Affects versions 2013.56 to
 >   2016.74.  Thanks to Mark Shepard for reporting the crash.

 > - CVE-2017-9079: Dropbear parsed authorized_keys as root, even if it were a
 >   symlink.  The fix is to switch to user permissions when opening
 >   authorized_keys.
 >   A user could symlink their ~/.ssh/authorized_keys to a root-owned file
 >   they couldn't normally read.  If they managed to get that file to contain
 >   valid authorized_keys with command= options it might be possible to read
 >   other contents of that file.  This information disclosure is to an already
 >   authenticated user.  Thanks to Jann Horn of Google Project Zero for
 >   reporting this.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
