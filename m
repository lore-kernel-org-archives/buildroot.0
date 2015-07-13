From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jul 2015 09:18:58 +0200
Subject: [Buildroot] [PATCH 2/7] package/linux: don't enforce check for
 DTS when not building
In-Reply-To: <20150713033718.GE2451@tarshish>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
 <ff5a9ea519a5c72dd917369e6409674b9d4a340f.1436702899.git.yann.morin.1998@free.fr>
 <20150712200309.GB2451@tarshish> <55A2FBDF.9070808@mind.be>
 <20150713033718.GE2451@tarshish>
Message-ID: <20150713071858.GG4008@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-07-13 06:37 +0300, Baruch Siach spake thusly:
> On Mon, Jul 13, 2015 at 01:44:31AM +0200, Arnout Vandecappelle wrote:
> > On 07/12/15 22:03, Baruch Siach wrote:
> > > On Sun, Jul 12, 2015 at 02:11:24PM +0200, Yann E. MORIN wrote:
> > >> Currently, this is triggering the error message:
> > >>     make randconfig
> > >>     make source
> > >>
> > >> Limit the checks that enforce a DTS is set and at most one DTB is
> > >> appended to when we are actually building, like is done for the
> > >> configuration-file variables.
> > >>
> > >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > > 
> > > [snip]
> > > 
> > >> -ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
> > >> +ifeq ($(BR_BUILDING)$(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),yy)
> > > 
> > > yy means that exactly two of these must be 'y'. Is that intended?
> > 
> >  Yes it is, because KERNEL_DTS_NAME is a string, not a boolean, so it
> > essentially checks that it is empty and DTS_SUPPORT is selected. But admittedly
> > it's not very transparent, it would make sense to add delimiters in-between at
> > least.
> 
> Thanks for the explanation. A comment would be helpful here, I guess.
> 
> Shouldn't we protect the code against someone naming a DTS just 'y'?

Yeah, we already discussed that with Thomas (live, we're in the same
place for a few days), and we've come to the conclusion that this
construct is indeed too tricky, and that we need a simpler code.

Your comments are now confirming this. ;-)

I'll rework the series shortly.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
