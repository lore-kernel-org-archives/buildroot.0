From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Oct 2018 21:45:12 +0200
Subject: [Buildroot] [PATCH/next 3/3] linux-headers: drop old
 unsupported 4.x versions
In-Reply-To: <20180824230233.7a7e0a24@windsurf>
References: <20180824184133.8508-1-bernd.kuhls@t-online.de>
 <20180824184133.8508-3-bernd.kuhls@t-online.de>
 <20180824230233.7a7e0a24@windsurf>
Message-ID: <20181004194512.GA2869@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2018-08-24 23:02 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Fri, 24 Aug 2018 20:41:33 +0200, Bernd Kuhls wrote:
> > These versions received their last updated more than three months ago
> > and are no longer supported according to
> > https://www.kernel.org/category/releases.html, so drop them and add
> > legacy entries.
> > 
> > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> > ---
> >  Config.in.legacy                     | 53 ++++++++++++++++++++++++++++
> >  package/linux-headers/Config.in.host | 25 -------------
> >  2 files changed, 53 insertions(+), 25 deletions(-)
> > 
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 29d5b6adcc..8c61d803da 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -142,6 +142,59 @@ comment "unpredictable ways.                                 "
> >  comment "----------------------------------------------------"
> >  endif
> >  
> > +###############################################################################
> > +comment "Legacy options removed in 2018.11"
> > +
> > +config BR2_KERNEL_HEADERS_4_10
> > +	bool "kernel headers version 4.10.x are no longer supported"
> > +	select BR2_KERNEL_HEADERS_4_14
> 
> I think it makes more sense to automatically select some *older* kernel
> headers.

Except it is not allowed to select a choice entry anyway.

I'll send a patch removing the selects, since they do not work...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
