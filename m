From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 3 Apr 2017 21:16:42 +0300
Subject: [Buildroot] [PATCH v2] uhttpd: fix TCP_FASTOPEN related compile
 error
In-Reply-To: <20170403194825.06b6aa2c@gmx.net>
References: <20170403172908.10642-1-ps.report@gmx.net>
 <20170403173646.oprtrwldn5rkk7wp@tarshish>
 <20170403194825.06b6aa2c@gmx.net>
Message-ID: <20170403181642.5bmkunldi4sle4yl@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Apr 03, 2017 at 07:48:25PM +0200, Peter Seiderer wrote:
> On Mon, 3 Apr 2017 20:36:46 +0300, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Mon, Apr 03, 2017 at 07:29:08PM +0200, Peter Seiderer wrote:
> > > ++#ifdef linux
> > 
> > Why limit it to Linux? TCP_FASTOPEN does not conflict with anything else, as 
> > far as I can see.
> 
> Because the setsockopt() call is limited by '#ifdef linux', see some lines below in
> the original listen.c file...

I'm aware of that. Still the TCP_FASTOPEN macro doesn't conflict with anything 
else, whether under #ifdef or not.

> > > ++#ifndef TCP_FASTOPEN
> > > ++#define TCP_FASTOPEN 23
> > > ++#endif
> > > ++#endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
