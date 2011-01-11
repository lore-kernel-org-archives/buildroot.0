From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 11 Jan 2011 12:50:23 -0500
Subject: [Buildroot] [PATCH 4/7] portmap: add nommu support
In-Reply-To: <87lj2r3f8m.fsf@macbook.be.48ers.dk>
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-4-git-send-email-vapier@gentoo.org>
	<87lj2r3f8m.fsf@macbook.be.48ers.dk>
Message-ID: <201101111250.24179.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, January 11, 2011 05:29:45 Peter Korsgaard wrote:
> What's the upstream status of these patches?

they've been sent multiple times, but upstream portmap hasnt responded to 
anyone in a while

> What is this NO_PERROR thing? That belongs in the next patch rather than
> here, right?

yes

> Why not simply rename it like the recent issue with getline -> get_line
> in kconfig?

because perror is a standard, not a gnuism like getline

> Why enforce no PIE?

the better question is why force PIE.  for embedded systems, this is almost 
always a waste.

> Out of interest, what functionaly in portmapper do you miss with
> NO_FORK?

the forks are only used to speed up responses
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110111/1374ea85/attachment.asc>
