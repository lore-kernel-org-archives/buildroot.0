From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 5 Mar 2012 15:45:10 +0000
Subject: [Buildroot] [PATCH] backend/pixma_bjnp: Replace index() with
	strchr()
Message-ID: <4F54DF86.7000504@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch replaces the obsolete index() function with strchr() in
sane-backends code. I have also filed a bug upstream

https://alioth.debian.org/tracker/index.php?func=detail&aid=313563&group_id=30186&atid=410366

I don't know if you want to include this patch on buildroot before
upstream does, but it may be useful for people wondering why
sane-backend does not build on certain systems. The index() and rindex()
functions are only exported if uClibc is configured with
UCLIBC_SUSV3_LEGACY_MACROS. This problem has also been discussed in the
past:

http://lists.busybox.net/pipermail/buildroot/2007-June/015201.html

-- 
markos
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: sane-backends-1.0.22-index-to-strchr.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120305/7f462654/attachment-0001.ksh>
