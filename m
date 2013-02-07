From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Feb 2013 15:45:52 +0100
Subject: [Buildroot] [PATCH] pkg-infra: start using <pkg>_CONFIG_FIXUP,
 part 1
In-Reply-To: <CAHXCMMK5FQ7mbgtWd9FZR_q_5MwZCtQR=_KXsPPX73EhGue=jg@mail.gmail.com>
References: <1360155924-4468-1-git-send-email-stefan.froberg@petroprogram.com>
 <CAHXCMMK5FQ7mbgtWd9FZR_q_5MwZCtQR=_KXsPPX73EhGue=jg@mail.gmail.com>
Message-ID: <20130207154552.5deb6670@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 7 Feb 2013 14:44:43 +0100, Samuel Martin wrote:

> 2013/2/6 Stefan Fr?berg <stefan.froberg@petroprogram.com>:
> > This patch will update those package *.mk files that are already
> > using some per-package fix of *-config files to use more generic
> > <pkg>_CONFIG_FIXUP variable making *.mk files more smaller,
> > neater and easier to eyes.
> >
> > Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> > ---
> > This package list was taked directly from Samuel Martins post
> > http://lists.busybox.net/pipermail/buildroot/2013-January/065814.html

FWIW, I've sent patches that supersedes this one:

  http://patchwork.ozlabs.org/patch/218799/
  http://patchwork.ozlabs.org/patch/218797/

They are slightly different than Stefan's one:

 * They clearly separate the packages that can directly be changed
   to <pkg>_CONFIG_SCRIPTS without thinking, because the fixup done by
   the infrastructure is exactly the same as the one that was done by
   the package (first patch mentioned above), from the packages that
   need a little bit more thought because the fixup is different
   (second patch mentioned above).

 * They take into account the fact that my patch series slightly
   improves <pkg>_CONFIG_SCRIPTS compared to what Stefan did: in my
   proposal, <pkg>_CONFIG_SCRIPTS also automatically removes the
   <foo>-config script from $(TARGET_DIR)/usr/bin automatically, so a
   number of POST_INSTALL_TARGET_HOOKS in packages have become
   useless and are removed by my patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
