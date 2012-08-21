From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2012 18:59:58 +0200
Subject: [Buildroot] BR2_SOURCEFORGE_MIRROR issue in package .mk files
In-Reply-To: <CAJkQPO=k7cmM46OXekN1s6n-Whk8_AG5hs37Q=ELgvzoVOj8XA@mail.gmail.com>
References: <CAJkQPO=k7cmM46OXekN1s6n-Whk8_AG5hs37Q=ELgvzoVOj8XA@mail.gmail.com>
Message-ID: <201208211859.59357.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aras, All,

On Tuesday 21 August 2012 17:51:07 Aras Vaichas wrote:
> I was rebuilding my Buildroot when I noticed that the
> kent.dl.sourceforge.net mirror is down and my build fails.
> 
> I encountered this same problem the other day with crosstool-ng, and
> soon afterwards a patch was posted:
> http://sourceware.org/ml/crossgcc/2012-08/msg00066.html

.. and has been applied and pushed! ;-)

> I looked at changing BR2_SOURCEFORGE_MIRROR but unfortunately
> Buildroot only allows BR2_SOURCEFORGE_MIRROR to replace *part* of the
> Sourceforge URL
> 
> e.g. in buildroot/package/boost/boost.mk:
> BOOST_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/boost
> 
> Should it be changed to:
> http://$(BR2_SOURCEFORGE_MIRROR).sourceforge.net/sourceforge/boost

I guess the correct solution would be to use their mirror-selector (as is
done for ct-ng, as you point out):
  http://downloads.sourceforge.net/blablabla

This will redirect to an active mirror, and we can get rid of this
SF mirror selection.

To be noted, the SF mirrors can come and go without notice. kent, who used
to be a reliable one, has disapeared a few days ago.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
