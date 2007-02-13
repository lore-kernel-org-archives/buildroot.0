From: Stefan Feilmeier <stefan@deeproot.co.in>
Date: Tue, 13 Feb 2007 15:05:36 +0530
Subject: [Buildroot] dialog makefile is outdated
Message-ID: <1171359336.16823.4.camel@stefan-nb.feilmeier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

I just tried to build a root filesystem including the dialog tool but
the make file in package/dialog/dialog.mk tries to download a
non-existent file from the debian server. The solution was to patch the
file.

Regards,
Stefan

Patch for package/dialog/dialog.mk:

12c12
< DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-2.diff.gz
---
> DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-3.diff.gz
