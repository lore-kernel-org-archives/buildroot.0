From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 13:26:36 +0200
Subject: [Buildroot] [PATCH 2/2] rtl8188eu: new package
In-Reply-To: <55AF6DB2.4090301@lucaceresoli.net>
References: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
 <1436188175-7912-2-git-send-email-luca@lucaceresoli.net>
 <20150718233012.5293b49f@free-electrons.com>
 <55AE72C8.10405@lucaceresoli.net>
 <20150721225724.401300ef@free-electrons.com>
 <55AF6DB2.4090301@lucaceresoli.net>
Message-ID: <20150722132636.6fe86008@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Wed, 22 Jul 2015 12:17:22 +0200, Luca Ceresoli wrote:

> >> It's on my todo list.
> 
> BTW, I think the rtl8188eu can go on its own way, without waiting for
> the discussion about /dev management, right?

Absolutely, I'll be happy to take rtl8818eu independently from the
discussion on /dev management and firmware loading.

> > I think it's OK to support this case. People using kernels older than
> > 2.6.32 are stuck with static /dev and may have to load firmwares.
> 
> Another use case is to have dynamic /dev management on kernels
> <2.6.32, even without any firmware loading need. mdev is reportedly
> working without devtmpfs. I haven't tested it seriously, but it might
> be very interesting for the poor souls.

Correct. So far I believe Peter's position was that people still using
kernel older than 2.6.32 should simply use static, but maybe that was a
too restrictive decision.

> > Do you have some proposals?
> 
> Idea 1:
>    - just add a new entry to "/dev management":
>        ( ) Static using device table
>        ( ) Static using device table + mdev   <- New option
>        (X) Dynamic using devtmpfs only
>        ( ) Dynamic using {devtmpfs +} mdev    {} = new wording only
>        ( ) Dynamic using {devtmpfs +} eudev   {} = new wording only
> 
> Idea 2:
>    - Add a new bool named "Use devtmpfs"
>      - y (default) -> enable devtmpfs in the kernel config
>      - n           -> use the static device table
>    - Change "/dev management" to "dynamic /dev management":
>        ( ) none
>        (X) mdev
>        ( ) eudev

I think I prefer idea (1) here. It's closer to what we already have,
and as you say, it's probably clearer for the user / easier to document.

Our manual has a complete section about /dev management at
http://buildroot.org/downloads/manual/manual.html#_dev_management, so
this will have to be updated.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
