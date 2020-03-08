From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 22:26:58 +0100
Subject: [Buildroot] [PATCH] package/spidermonkey: do not build the
 JavaScript shell, by default
In-Reply-To: <CAJ4jsado7Y_iHwtJVNNGta7pez_Zsx_fi_y6+wtrhmA_P0a5Xw@mail.gmail.com>
References: <20200308032128.306-1-unixmania@gmail.com>
 <20200308145258.44d80049@windsurf.home>
 <CAJ4jsado7Y_iHwtJVNNGta7pez_Zsx_fi_y6+wtrhmA_P0a5Xw@mail.gmail.com>
Message-ID: <20200308222658.0cdeee8d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Sun, 8 Mar 2020 12:11:41 -0300
Carlos Santos <unixmania@gmail.com> wrote:

> > We already had a 0001 patch, we actually have 10 patches on
> > spidermonkey, so I renamed this one 0011.  
> 
> Hum, that's the price passing "1" instead of "11" to --start-number. :-(

Hehe :-)

> 
> > Has this patch been submitted upstream ?  
> 
> Well, "upstream" is Firefox and I don't believe they would care about
> an installation error when we compile a code sub-tree taken from a
> tarball made for Gentoo with an extra patch to force in-tree builds.
> ;-)

Indeed, there is not really a regular upstream for spidermonkey.
Fortunately, there are some patches submitting to polkit to make it use
the duktape JS engine instead of spidermonkey, hopefully they will be
merged in the near future.

> If the patch annoys you we can just use a post-install-target hook to
> remove js60. I didn't follow this approach because I was afraid that
> not passing --disable-js-shell would lead to the inclusion of code
> that could cause problem at run time.

Nah, the patch is fine, let's keep it this way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
