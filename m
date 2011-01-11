From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Jan 2011 21:30:19 +0100
Subject: [Buildroot] [PATCH 4/7] portmap: add nommu support
In-Reply-To: <201101111250.24179.vapier@gentoo.org> (Mike Frysinger's message
	of "Tue, 11 Jan 2011 12:50:23 -0500")
References: <1294669718-5339-1-git-send-email-vapier@gentoo.org>
	<1294669725-5379-4-git-send-email-vapier@gentoo.org>
	<87lj2r3f8m.fsf@macbook.be.48ers.dk>
	<201101111250.24179.vapier@gentoo.org>
Message-ID: <87tyhfyyhw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 Mike> On Tuesday, January 11, 2011 05:29:45 Peter Korsgaard wrote:
 >> What's the upstream status of these patches?

 Mike> they've been sent multiple times, but upstream portmap hasnt
 Mike> responded to anyone in a while

Ok, thanks.

 >> What is this NO_PERROR thing? That belongs in the next patch rather than
 >> here, right?

 Mike> yes

Ok.

 >> Why not simply rename it like the recent issue with getline -> get_line
 >> in kconfig?

 Mike> because perror is a standard, not a gnuism like getline

Yes, but why is there a perror() implementation in portmapper in the
first place? It seems like they want
something-looking-like-perror-but-using-syslog, rather than the real
perror?

 >> Out of interest, what functionaly in portmapper do you miss with
 >> NO_FORK?

 Mike> the forks are only used to speed up responses

Ok.

-- 
Bye, Peter Korsgaard
