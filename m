From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 23:30:13 +0200
Subject: [Buildroot] [PATCH v3] libusb: add an option to compile examples
In-Reply-To: <20180617211401.4zqcmsz544uuantc@archlinux>
References: <20180611134750.27627-1-gael.portay@savoirfairelinux.com>
 <20180617151345.3034ad05@windsurf>
 <20180617211401.4zqcmsz544uuantc@archlinux>
Message-ID: <20180617233013.4921bc8e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jun 2018 17:14:01 -0400, Ga?l PORTAY wrote:

> > As I said in a review of an earlier version, you should use a make loop
> > instead of a shell loop. One benefit of make loops is that they bail
> > out if one iteration of the loop fails. A shell loop doesn't, and
> > continues with the next iterations.
> >  
> 
> Sorry to have missed your review.
> 
> Hum... the shell's for loop exits in error too when an iteration fails;
> which causes make failure for TARGET_INSTALL (unless set +e is
> specified)... or maybe I missed something :/

I don't think shell snippets executed by make are executed with set -e.

> > > +		cp -dpfr $(@D)/examples/$${example} $(TARGET_DIR)/usr/bin; \  
> > 
> > This should have use $(INSTALL) -D -m 0755 and a full destination path.
> > 
> > I've fixed both issues and applied.
> >   
> 
> I pretty sure I picked up this part of code from another package in
> buildroot. I can apply the same changes to keep package consistent.

We do use "cp -dpfr" to copy entire directories. But for individual
files, we prefer $(INSTALL).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
