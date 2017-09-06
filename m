From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Sep 2017 18:35:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
In-Reply-To: <20170906085535.691808b9@windsurf.lan>
References: <20170904185738.31182-1-bernd.kuhls@t-online.de>
 <20170905221325.71f98014@windsurf.lan>
 <20170905201638.GA9106@scaer>
 <20170906085535.691808b9@windsurf.lan>
Message-ID: <20170906163555.GA2885@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-09-06 08:55 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Tue, 5 Sep 2017 22:16:38 +0200, Yann E. MORIN wrote:
> > Thomas, All,
> > 
> > On 2017-09-05 22:13 +0200, Thomas Petazzoni spake thusly:
> > > On Mon,  4 Sep 2017 20:57:38 +0200, Bernd Kuhls wrote:  
> > > > Add optional dependencies to
> > > > 
> > > > - libva
> > > >   ffmpeg depends on libva, libva depends on xorg, so no need to add them
> > > >   to _DEPENDENCIES  
> > > 
> > > I don't see ffmpeg depending on libva, where do you see that ?  
> > 
> > Yet it does, see line 243. ;-)
> 
> Well, it will depend on libva if it's enabled. But I don't see anything
> in tvheadend or ffmpeg that forces libva to be enabled.

No, but the commit log says it is adding _optional_ dependency to libva.

So indeed nothing forces libva to be on, but if it is, then support is
explicitly enabled, otherwise it is explicitly disabled.

That's how I understand the patch.

But yes, the patch does more than one thing at a time, so should be
split.

Regards,
Yann E. MORIN.

> Perhaps I'm missing something obvious here.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
