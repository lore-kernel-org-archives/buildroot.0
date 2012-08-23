From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Aug 2012 23:25:20 +0200
Subject: [Buildroot] [PATCH] package/cURL: fix static link whith openSSL
In-Reply-To: <201208232311.29773.yann.morin.1998@free.fr>
References: <1345667823-16633-1-git-send-email-yann.morin.1998@free.fr>
 <20120823110034.1f0b01d8@skate> <201208232311.29773.yann.morin.1998@free.fr>
Message-ID: <201208232325.20885.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 23 August 2012 23:11:29 Yann E. MORIN wrote:
> On Thursday 23 August 2012 11:00:34 Thomas Petazzoni wrote:
> > Le Wed, 22 Aug 2012 22:37:03 +0200,
> > "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> > 
> > > When openSSL is selected, cURL is configured to use it.
> > > 
> > > But in this case, the libcurl.pc file /forgets/ to require link
> > > against -ldl.
> > > 
> > > This can happen, for example, when BR2_PREFER_STATIC_LIB is not set,
> > > but an executable wants to be linked statically (for various reasons
> > > which are irrelevant here).
> > > 
> > > Fix that by conditionally append -ldl to the Libs.Private section of
> > > the installed libcurl.pc if openSSL is enabled.
> > > 
> > > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Shouldn't this rather be fixed through a patch that gets submitted to
> > the upstream curl project?
> 
> Probably, yes. There's even a comment in the libcurl.pc.in template, that
> reads:
>   # This should most probably benefit from getting a "Requires:" field added
>   # dynamically by configure.

OK, I've changed my mind: forget this patch of mine, I'll just redo it
by adding a proper 'Requires:' line, that's much cleaner.

Doint it properly in curl's source will take a bit more time, but I'll
eventually look at it (but not before Monday, I'm off for the WE, with
probably no access to a computer, much less to internet. Yeah! Roots!).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
