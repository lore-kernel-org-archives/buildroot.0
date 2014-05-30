From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 May 2014 22:27:18 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
 <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
 <5388A9DC.1010204@gmx.net>
 <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
Message-ID: <20140530222718.5cb42dd5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri, 30 May 2014 14:57:19 -0500, Spenser Gilliland wrote:

> > Yes, Qt5's cmake files assume /usr/include not /usr/include/GLES2.
> >
> > I added -I${includedir} instead of removing only "GLES2" because then
> nothing will break,
> > and the other .pc file also sets both dirs.
> > But it seems common practice is to not add the uppercase dir names in the
> pkg-congig file.

You should fix your e-mail client, as it very badly handles quotations.

> This patch won't break anything.  But it would be nice if you could go back
> and reverify this just to be sure.
> 
> My reasoning is that,  /usr/include is a default include dir which all
> compilers should use automatically.   There should not be a need to
> manually specify it.

Agreed, and therefore I'd like to understand in more details why the
patch is needed. We typically don't commit things we don't understand
why they are needed :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
