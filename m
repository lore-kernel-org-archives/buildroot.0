From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 18 Jul 2011 16:08:25 +0100
Subject: [Buildroot] [RFC PATCH 0/2] Add the ability to rebuild packages.
In-Reply-To: <CAAXf6LUvhKbdPvCX4K6DS-ZLmh4ZP15cOr_rhFMzCze3pzsESA@mail.gmail.com>
References: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
 <CAAXf6LU3_s_E03b2KzNusjvMsbcYUFZupr-DoP+SRT9F7y_99Q@mail.gmail.com>
 <1310997747.2189.53.camel@dublxciaranr1.verifone.com>
 <CAAXf6LUvhKbdPvCX4K6DS-ZLmh4ZP15cOr_rhFMzCze3pzsESA@mail.gmail.com>
Message-ID: <1311001713.2189.58.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-07-18 at 16:14 +0200, Thomas De Schampheleire wrote:
> > xxx-reconfigure should be fairly straightforward since no
> > TARGET_NORECONFIGURE variable would be needed, just remove the stamp and
> > make xxx-configure.
> >
> > Would xxx-repatch be effectively a re-extraction?  That is, the patch
> > has been applied, then changed and so can't be applied in reverse so
> > you'll have to erase the extracted package and re-extract, patch, ...
> > So in effect it's a "make xxx-dirclean xxx" operation, right?
> 
> Yes, you're right. Really repatching would require re-extracting.
> Let's skip this target.

What about xxx-reconfigure; should it (1) reconfigure and then build the
package to completion (including installation) or (2) just configure and
stop, requiring a separate step to complete?
There's an argument in favour of both approaches.
(1) means that the package is installed to target/staging, etc. with one
command.
(2) clearly (?!) demonstrates that a top-level "make" is required to
press the changes into an RFS/tarball image.
