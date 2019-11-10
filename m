From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Nov 2019 14:43:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-serial-test: fix build on
 MIPS
In-Reply-To: <20191110141617.0e1f25ec@windsurf>
References: <20191109231321.19690-1-fontaine.fabrice@gmail.com>
 <20191110141617.0e1f25ec@windsurf>
Message-ID: <CAPi7W821fAQVB719iJkcbZGU3HmDzUtg=kwAx+ZrUpESYVY1ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le dim. 10 nov. 2019 ? 14:16, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Sun, 10 Nov 2019 00:13:21 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/86e06fdcaa91dca682651736162e9e743329412c
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...t.c-fix-missing-CMSPAR-define-on-MIP.patch | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 package/linux-serial-test/0001-linux-serial-test.c-fix-missing-CMSPAR-define-on-MIP.patch
>
> Applied to master, thanks. Could you also send a patch to glibc adding
> the missing define to the MIPS header? Because this would be the real
> fix for this issue in fact.
glibc has been "fixed" since January 2019 with
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=6f343c1f338ca70411772309a3bbb1d67c71f419
as this commit removes the arch specific termios.h.
However, uclibc-ng continues to have this issue so I'll send a patch.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
