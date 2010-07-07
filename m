From: Matthew Davison <matt.davison@lantronix.com>
Date: Wed, 7 Jul 2010 15:26:04 -0700
Subject: [Buildroot] Controlling dependencies for package with manual
	Makefile
Message-ID: <8128F0FD6C26E14C8EB4BFDB92B8D6B201517E3A@2putt.int.lantronix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I understand that for packages using the autotools infrastructure,
that the PACKAGENAME_DEPENDENCIES variable (replacing PACKAGENAME
appropriately) is used to tell buildroot to build these dependencies
first. Setting this variable in a manual Makefile (non-autotools based),
does not appear to work.

> Is there a way to force buildroot to build package dependencies first,
without having to convert to an autotools compliant Makefile?

It's a bit of a kludge, but I discovered that I can just add the
dependency package name directly into my package's target prerequisites.
So for dependency <lib1>, I can modify my primary package target (in
packagename.mk) to:
packagename: lib1 <existing prerequisites go here>
 
This is far from ideal, but it does appear to be working.
 
Matt
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100707/0de28b59/attachment.html>
