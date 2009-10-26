From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Oct 2009 23:03:43 +0100
Subject: [Buildroot] [PATCH] netkitftp: added package with
	Makefile.autotools.in support
In-Reply-To: <8763a1dfgm.fsf@paranoid.sweethome> (hugues@hiegel.fr's message
	of "Mon\, 26 Oct 2009 22\:15\:37 +0100")
References: <1256573832-11116-1-git-send-email-hugues@hiegel.fr>
	<1256573832-11116-2-git-send-email-hugues@hiegel.fr>
	<874opmf2pe.fsf@macbook.be.48ers.dk>
	<8763a1dfgm.fsf@paranoid.sweethome>
Message-ID: <87r5spersw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hugues" == Hugues  <hugues@hiegel.fr> writes:

 Hugues> Hello,

 Hugues> Thanks for the comments,
 Hugues> I've got some questions ;

 Hugues> +$(NETKITFTP_HOOK_POST_INSTALL):
 Hugues> +	rm -vfr $(TARGET_DIR)/usr/man
 >> 
 >> Why verbose?

 Hugues> Mhmm.. because with the "fr", it makes "vfr", which is a
 Hugues> motorbike.. ;o) I'll throw it ;)

 >> That uninstall would also remove all other man pages, so
 >> don't do that.

 Hugues> Mhmm... I'm not sure I understood this.. Why do you talk about
 Hugues> uninstall ?  The netkitftp's 'install' rule does installs the
 Hugues> manpages with the binary, without ability to call just the
 Hugues> install of the binary without the manpages.  So I did like I
 Hugues> see in other packages : just delete the $(TARGET_DIR)/usr/man
 Hugues> folder... Is this a bad idea ?  What do you suggest at this
 Hugues> stage ?  Doing nothing, this will be cleaned later ?

Sorry, I misread the line (read it as HOOK_POST_UNINSTALL, which
actually doesn't exist).  The Makefile.autotools.in automatically
removes manpages if the user doesn't have BR2_HAVE_MANPAGES enabled, so
you can just remove it.

-- 
Bye, Peter Korsgaard
