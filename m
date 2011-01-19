From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Jan 2011 22:52:14 +0100
Subject: [Buildroot] [PATCH 7/7] tcpdump: add patch for nommu systems
In-Reply-To: <1294669725-5379-7-git-send-email-vapier@gentoo.org> (Mike
	Frysinger's message of "Mon, 10 Jan 2011 09:28:45 -0500")
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-7-git-send-email-vapier@gentoo.org>
Message-ID: <87pqrsef3l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 Mike> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Mike> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
 Mike> ---
 Mike>  package/tcpdump/tcpdump-4.1.1-vfork.patch |  128 +++++++++++++++++++++++++++++
 Mike> ++#if defined(HAVE_FORK) || defined(HAVE_VFORK)
 Mike> +-#else  /* WIN32 */
 Mike> ++#else  /* HAVE_FORK && HAVE_VFORK */

This should be HAVE_FORK || HAVE_VFORK
 Mike> ++#endif /* HAVE_FORK && HAVE_VFORK */

Same here.

Other than that it looks good, committed - Thanks.

-- 
Bye, Peter Korsgaard
