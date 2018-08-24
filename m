From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Aug 2018 14:01:19 +0200
Subject: [Buildroot] [PATCH] package/rauc: needs kernel headers >= 3.0
In-Reply-To: <20180824134900.1ccc9c2c@windsurf>
References: <20180824080217.16181-1-yann.morin.1998@free.fr>
 <20180824134900.1ccc9c2c@windsurf>
Message-ID: <20180824120119.GO9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-08-24 13:49 +0200, Thomas Petazzoni spake thusly:
> On Fri, 24 Aug 2018 10:02:17 +0200, Yann E. MORIN wrote:
> > rauc includes <linux/mmc/ioctl.h> which was introduced only in
> > linux 3.0.
> > 
> > Also change order to have arch dependencies first.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Andrey Yurovsky <yurovsky@gmail.com>
> 
> As discussed separately, this only solves the problem for the target
> build, and not for the host build. So, I would prefer a solution that
> adjusts the RAUC code to build with headers < 3.0, so that we solve
> both the host and the target problem at the same time.

That is not really possible, because emmc support is core to rauc; it is
not even optional in the current code. Removing it (by making it
conditional) does not make sense IMHO (but I'm not using rauc).

And then, technically, it would require quite some overhaul in rauc,
because access to the emmc code is made from a lot of places.

So I'm not the one that will be doing that.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
