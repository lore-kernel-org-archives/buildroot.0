From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Nov 2012 17:48:02 +0100
Subject: [Buildroot] [PATCH 06/51] package/usbredir: new package
In-Reply-To: <20121129094247.03f7c7d2@skate>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-7-git-send-email-yann.morin.1998@free.fr>
 <20121129094247.03f7c7d2@skate>
Message-ID: <201211301748.02948.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 29 November 2012 Thomas Petazzoni wrote:
> On Thu, 29 Nov 2012 00:54:05 +0100, Yann E. MORIN wrote:
> > +comment "usbredir requires libusb"
> > +	depends on !BR2_PACKAGE_LIBUSB
> 
> Hum, why a "depends on" and not a "select", like we normally do for
> libraries? libusb is not a "big" thing, so I'd say it should be
> automatically selected.

Because libusb depends on THREADS, and I do not want to play the ugly
game of inheriting dependencies of my own dependencies.
Hence "depends on" rather than "select".

> > diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
> > new file mode 100644
> > index 0000000..9f6c011
> > --- /dev/null
> > +++ b/package/usbredir/usbredir.mk
[--SNIP==]
> > +USBREDIR_LICENSE         = LGPLv2.1+
> 
> Maybe:
> USBREDIR_LICENSE         = LGPLv2.1+ (library)

Yep.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
