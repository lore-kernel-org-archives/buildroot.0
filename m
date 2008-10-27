From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Mon, 27 Oct 2008 08:07:15 +0100
Subject: [Buildroot] [PATCH] libglib2: remove $(DISABLE_NLS) from
	configure options
In-Reply-To: <87fxmjdt0t.fsf@macbook.be.48ers.dk>
References: <200810250216.21072.markus.heidelberg@web.de>
	<87fxmjdt0t.fsf@macbook.be.48ers.dk>
Message-ID: <200810270807.15968.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 26.10.2008:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
>  Markus> The configure option --disable-nls is not supported anymore in glib
>  Markus> since version 2.0, see file ChangeLog.pre-2-0 line 544.
> 
> Thanks, committed.
> 
> Does this mean that libglib2 should depend on BR2_ENABLE_LOCALE?

I'm not sure. Looking at DISABLE_NLS in Makefile.in, then yes. I've also read
a thread, saying that packages using glib don't have to ask for locale support
but can just rely on having it. But I have no clue about the relationship
between UCLIBC_HAS_LOCALE and --disable/enable-nls.

Markus
