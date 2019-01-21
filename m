From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 21 Jan 2019 21:51:47 +0100
Subject: [Buildroot] [PATCH v2] gcc: Enable __cxa_atexit for final GCC
In-Reply-To: <CAOMZO5Cr-N8guA2hE-PjsOm4uDj67cnmNroKjMvykPZVS2dwbQ@mail.gmail.com>
References: <20181116112618.17034-1-abrodkin@synopsys.com>
 <20181129221445.4d68439f@windsurf>
 <CAOMZO5Cr-N8guA2hE-PjsOm4uDj67cnmNroKjMvykPZVS2dwbQ@mail.gmail.com>
Message-ID: <20190121215147.6c732fac@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Mon, 21 Jan 2019 13:04:46 -0200, Fabio Estevam <festevam@gmail.com> wrote:

> Hi Peter,
> 
> On Thu, Nov 29, 2018 at 7:15 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > On Fri, 16 Nov 2018 14:26:18 +0300, Alexey Brodkin wrote:  
> > > This is what GCC manual says [1]:  
> > > -------------------------->8----------------------  
> > > --enable-__cxa_atexit  
> >
> > I've applied to next, but after dropping the "for final GCC" from the
> > commit title, since cxa_atexit is now used for both the initial gcc and
> > the final gcc.  
> 
> Could this one be applied to Buildroot stable?

+1

> 
> The lack of this patch causes is causing issues on Mesa:
> https://www.mail-archive.com/mesa-dev at lists.freedesktop.org/msg212440.html

Did re-run the same buildroot-2018.11/mesa/etnaviv test, could confirm enabling
__cxa_atexit fixes the mesa double-free on exit...

Regards,
Peter
  
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
