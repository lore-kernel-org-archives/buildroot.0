From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 15:04:31 +0200
Subject: [Buildroot] [PATCH] package/qemu: security bump to version 3.1.1
In-Reply-To: <20190828071551.3476-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 28 Aug 2019 09:15:50 +0200")
References: <20190828071551.3476-1-peter@korsgaard.com>
Message-ID: <87woexo2zk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16872: A flaw was found in qemu Media Transfer Protocol (MTP).  The
 > code opening files in usb_mtp_get_object and usb_mtp_get_partial_object and
 > directories in usb_mtp_object_readdir doesn't consider that the underlying
 > filesystem may have changed since the time lstat(2) was called in
 > usb_mtp_object_alloc, a classical TOCTTOU problem.  An attacker with write
 > access to the host filesystem shared with a guest can use this property to
 > navigate the host filesystem in the context of the QEMU process and read any
 > file the QEMU process has access to.  Access to the filesystem may be local
 > or via a network share protocol such as CIFS.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
