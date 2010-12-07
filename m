From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Dec 2010 17:02:39 -0500
Subject: [Buildroot] Pull request buildroot.git (vapier branch)
In-Reply-To: <87aakhs19p.fsf@macbook.be.48ers.dk>
References: <1291503121-24114-1-git-send-email-vapier@gentoo.org>
	<201012071631.47002.vapier@gentoo.org>
	<87aakhs19p.fsf@macbook.be.48ers.dk>
Message-ID: <201012071702.40547.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, December 07, 2010 16:48:02 Peter Korsgaard wrote:
> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
>  >> And as this will be most packages
> 
>  Mike> what are you basing this on ?  this isnt my experience at all.
> 
> Nothing but gut feeling. I would expect lots of packages use fork() or
> similar.

fork() is common, but the vast majority of the time it's to do an exec which 
makes them trivial to convert to vfork().  realistically, build problems with 
uClibc vs glibc tend to be more common.

> Out of interest, what packages are you using on nommu?

i've played doom on my hardware, made video/voip calls via linphone, browsed 
the web with qt/webkit, and served web pages from sqlite/php (to name a few).  
we treat it as a generic Linux platform like any other arch rather than 
pigeonhole it as a "firewall" or something.  i dont really keep track as it'd 
kind of be like asking what packages have i used on an mmu.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101207/df1edd4b/attachment.pgp>
