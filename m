From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2012 15:27:29 +0200
Subject: [Buildroot] [PATCH 07/36] package/celt051: new package
In-Reply-To: <20120817131818.74842ae3@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-7-git-send-email-yann.morin.1998@free.fr>
 <20120817131818.74842ae3@skate>
Message-ID: <201208171527.29938.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 17 August 2012 13:18:18 Thomas Petazzoni wrote:
> Le Mon, 13 Aug 2012 01:53:55 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > --- /dev/null
> > +++ b/package/multimedia/celt051/Config.in
> > @@ -0,0 +1,15 @@
> > +config BR2_PACKAGE_CELT051
> > +	bool "celt051"
> > +	select BR2_PACKAGE_LIBOGG
> > +	help
> > +	  The CELT ultra-low delay audio codec
> 
> Just curious, for what reason an audio codec is needed as a dependency
> of a virtual machine thing? How does it fit in the stack?

celt-0.51 is a hard-depdency for Spice to encode the audio.
It's select-ed by BR2_PACKAGE_SPICE in a later patch.

Note that I added all new packages in a row, rather than add them just
prior to the requiring qemu feature. Should I re-order the series to make
the depedencies clearer?

> > +# Although version newer than 0.5.1.3 exists, we're
> > +# stuck with 0.5.1.3 for use by Spice (coming later)
> 
> Do you predict this version requirement to be kept for a long period of
> time?

Spice advertises that celt-051 is the only supported version because
later versions have changed too much and are thus not compatible.

I have absolutely no idea whther Spice will upgrade one day... :-/


> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
