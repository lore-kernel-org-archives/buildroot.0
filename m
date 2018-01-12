From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Jan 2018 18:39:53 +0100
Subject: [Buildroot] [PATCH] system/Config.in: hide
 BR2_TARGET_GENERIC_GETTY_{TERM, OPTIONS} with systemd
In-Reply-To: <20180112100216.36d494c1@windsurf.lan>
References: <20180110221402.19743-1-thomas.petazzoni@free-electrons.com>
 <20180111173104.GB3559@scaer>
 <20180112100216.36d494c1@windsurf.lan>
Message-ID: <20180112173953.GC3226@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-01-12 10:02 +0100, Thomas Petazzoni spake thusly:
> On Thu, 11 Jan 2018 18:31:04 +0100, Yann E. MORIN wrote:
> > > +	# currently not observed by systemd
> > > +	depends on BR2_INIT_BUSYBOX || BR2_INIT_SYSV  
> > 
> > Why not:
> >     depends on !BR2_INIT_SYSTEMD
> > 
> > because this is really want we want to express: this is not compatible
> > with systemd...
> 
> No, what we really want to express is that
> BR2_TARGET_GENERIC_GETTY_{TERM,OPTIONS} are only handled in the busybox
> code and sysvinit code. It's not so much that they are not compatible
> with systemd, it is that only busybox and sysvinit observe those
> options.

Then change the title and commit to something like:

    system: only expose getty option for busybox and sysvinit

    Only busybox and sysvinit handle those options; the other init
    systems do not.

    So, protect those options behind appropriate dependencies on
    busybox or sysvinit.

    Fixes #10301.

And then you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
