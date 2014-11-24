From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 20:34:53 +0100
Subject: [Buildroot] [PATCH 2/2] samba: Add support for libnss_win*.so*
 installation
In-Reply-To: <54730753.3030108@zacarias.com.ar>
References: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>
 <1407176057-13180-2-git-send-email-benoit.thebaudeau@advansee.com>
 <20141122213359.2628a10e@free-electrons.com>
 <54730753.3030108@zacarias.com.ar>
Message-ID: <20141124203453.59c5f279@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 24 Nov 2014 07:24:19 -0300, Gustavo Zacarias wrote:

> > I must say I'm a bit skeptical about two things (about which probably
> > Beno?t can give some details) :
> > 
> >  * The usefulness of enabling the NSS libraries in non-glibc
> >    environments. Even though I agree that technically, nothing prevents
> >    some program from using them, in practice, the NSS libraries are
> >    basically only used by the glibc name resolution logic. So I would
> >    personally prefer to make those NSS libraries visible only in glibc
> >    configurations.
> 
> Even if they can be built they really are intended for (e)glibc so we agree.
> If you need to access/use wbclient functionality you could just use the
> wbclient (winbind) api by enabling samba install to staging, that's the
> public way of accessing it.

Agreed.

> >  * The fact that the winbindd daemon is not actually needed on the
> >    target to get libnss_wins/libnss_winbind working. My understanding
> >    is that winbindd is a daemon that will answer to the name resolution
> >    requests of libnss_wins/libnss_winbind, so I don't see how they can
> >    work without the daemon running.
> 
> AFAIK you need winbind running in order to use libwbclient and/or
> libnss_winbind/wins. I think libnss_wins has a fallback to DNS-only mode
> but it's probably not very useful.

Ok.

Beno?t, can you rework your patches to take into account those comments?

> Also please note that Samba 3 is very likely going EOL as soon as Samba
> 4.2.x is released which even though delayed a bit in the RC phase is
> coming along pretty soon, so adding feature to the samba3 package isn't
> very wise IMHO (it's in security-only fixes now).
> See: https://wiki.samba.org/index.php/Samba_Release_Planning

Ok. Still there's some chance that we will keep Samba 3 around for a
bit of time, just like we still have libgtk2 available.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
