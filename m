From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 12:44:33 +0300
Subject: [Buildroot] [PATCH 1/2 v4] core/skeleton: drop /etc/securetty
In-Reply-To: <20150713093552.GH4008@free.fr>
References: <cover.1436778228.git.yann.morin.1998@free.fr>
 <51509ea07660728b4f5aa519d67b6577bd4c9dd4.1436778228.git.yann.morin.1998@free.fr>
 <20150713092051.GK2451@tarshish> <20150713093552.GH4008@free.fr>
Message-ID: <20150713094433.GL2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jul 13, 2015 at 11:35:52AM +0200, Yann E. MORIN wrote:
> On 2015-07-13 12:20 +0300, Baruch Siach spake thusly:
> > On Mon, Jul 13, 2015 at 11:05:35AM +0200, Yann E. MORIN wrote:
> > > securetty is supposed to restrict the terminals root is allowed to
> > > login from. As it happens, login from busybox (w/ securetty support)
> > > is actually enforcing use of securetty, while login from util-linux
> > > is completely ignoring securetty altogether.
> > > 
> > > Remove securetty from our skeleton altogether and stop worrying about
> > > it.
> > 
> > But CONFIG_FEATURE_SECURETTY=y is still there in current 
> > package/busybox/busybox.config. Shouldn't we disable it first?
> 
> Indeed, it is still present, but that does not prevent root login to
> work when /etc/securetty is missing.
> 
> So, I decided to leave it as-is.

It would still break overlays with /etc/securetty (maybe locally modified). 
Why not just disable Busybox FEATURE_SECURETTY?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
