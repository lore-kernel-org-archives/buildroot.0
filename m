From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2016 23:53:10 +0100
Subject: [Buildroot] [PATCH 1/6 v2] package/libgtk2: break a circular
 dependency
In-Reply-To: <20160206234634.37caec35@free-electrons.com>
References: <cover.1453651102.git.yann.morin.1998@free.fr>
 <b493e6d4ca04b6171c2c7613f9abfdd6c0129861.1453651102.git.yann.morin.1998@free.fr>
 <20160206234634.37caec35@free-electrons.com>
Message-ID: <20160206225310.GB3429@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-02-06 23:46 +0100, Thomas Petazzoni spake thusly:
> On Sun, 24 Jan 2016 17:02:36 +0100, Yann E. MORIN wrote:
> > We currently have a circular dependency chain:
> > 
> >     avahi -> libglade -> libgtk2 -> cups -> avahi
> > 
> > The cups -> avahi dependency makes sense, as cups would be able to use
> > Bonjour and mDNS to find printers, so we want to keep that dependency.
> > 
> > The avahi -> libglade -> libgtk2 chain also makes some sense, to provide
> > a GUI frontend for avahi.
> > 
> > Since the libgtk2 -> cups does not look that it would be tremendously
> > useful, that's the one we drop in this patch.
> 
> I tend to disagree with this analysis. The avahi GUI programs seem
> really useless to me. On Debian/Ubuntu distributions, they are not even
> packaged within the main avahi packages, but as separate packages,
> probably indicating that they are not very commonly used. It is also
> highly unlikely that such ready-made applications will be used on
> embedded systems.
> 
> On the other hand, when you enable Gtk2 or Gtk3 to create your
> own graphical applications, you may be interested in being able to have
> the print dialogs support CUPS.
> 
> So in the:
> 
>   avahi -> libglade -> libgtk2 -> cups -> avahi
> 
> I would rather tend to break the dependency between "avahi -> libglade"
> rather than between "libgtk2 -> cups".
> 
> (This comment obviously also applies to your patch 2/6).
> 
> What do you think ? What do others think ?

I have absolutely no preference between the two. The only I'm
tangentially interested in is the cups -> avahi dependency.

So I'm fine with your proposal as well.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
