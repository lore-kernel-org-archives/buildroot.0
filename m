From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 18 Jul 2011 15:02:25 +0100
Subject: [Buildroot] [RFC PATCH 0/2] Add the ability to rebuild packages.
In-Reply-To: <CAAXf6LU3_s_E03b2KzNusjvMsbcYUFZupr-DoP+SRT9F7y_99Q@mail.gmail.com>
References: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
 <CAAXf6LU3_s_E03b2KzNusjvMsbcYUFZupr-DoP+SRT9F7y_99Q@mail.gmail.com>
Message-ID: <1310997747.2189.53.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 2011-07-18 at 11:30 +0200, Thomas De Schampheleire wrote:
> We are currently using Buildroot in such a development mode, and
> indeed face the problems you are solving with this patch. So: thumbs
> up!
> 
> But it is not only 'rebuild' that is useful. The conditions under
> which the configure command of a certain package originally ran, may
> have changed. A similar thing is true for patches: you may have
> updated the patchfile. In such cases, generic reconfigure and repatch
> targets are very welcome, together with the rebuild target you already
> made...

xxx-reconfigure should be fairly straightforward since no
TARGET_NORECONFIGURE variable would be needed, just remove the stamp and
make xxx-configure.

Would xxx-repatch be effectively a re-extraction?  That is, the patch
has been applied, then changed and so can't be applied in reverse so
you'll have to erase the extracted package and re-extract, patch, ...
So in effect it's a "make xxx-dirclean xxx" operation, right?
