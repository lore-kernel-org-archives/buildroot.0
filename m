From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 09:10:34 +0200
Subject: [Buildroot] [PATCH] samba4: security bump to version 4.5.7
In-Reply-To: <20170328151808.11281-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 28 Mar 2017 17:18:08 +0200")
References: <20170328151808.11281-1-peter@korsgaard.com>
Message-ID: <87pogxx6ol.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-2619:
 >    All versions of Samba prior to 4.6.1, 4.5.7, 4.4.11 are vulnerable to
 >    a malicious client using a symlink race to allow access to areas of
 >    the server file system not exported under the share definition.

 >    Samba uses the realpath() system call to ensure when a client requests
 >    access to a pathname that it is under the exported share path on the
 >    server file system.

 >    Clients that have write access to the exported part of the file system
 >    via SMB1 unix extensions or NFS to create symlinks can race the server
 >    by renaming a realpath() checked path and then creating a symlink. If
 >    the client wins the race it can cause the server to access the new
 >    symlink target after the exported share path check has been done. This
 >    new symlink target can point to anywhere on the server file system.

 >    This is a difficult race to win, but theoretically possible. Note that
 >    the proof of concept code supplied wins the race reliably only when
 >    the server is slowed down using the strace utility running on the
 >    server. Exploitation of this bug has not been seen in the wild.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
