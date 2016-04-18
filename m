From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 11:52:52 +0200
Subject: [Buildroot] [PATCH v2] imx-uuc: add new package
In-Reply-To: <CAAMH-yusq577jhLtDEHaJbYRpBD4KsLwGDzqDU1tD_k2fkie4Q@mail.gmail.com>
References: <1460544052-31608-1-git-send-email-gary.bisson@boundarydevices.com>
 <20160417225045.26b26138@free-electrons.com>
 <CAAMH-yusq577jhLtDEHaJbYRpBD4KsLwGDzqDU1tD_k2fkie4Q@mail.gmail.com>
Message-ID: <20160418115252.3c0b466d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Apr 2016 11:38:00 +0200, Gary Bisson wrote:

> >         imx-uuc: new package
> >
> > (yes that's nitpicking)
> 
> No that's good to know, next time I'll make sure to name it like this.

No problem, it's easy to fix :)

> > Some of those lines were slightly too long, so I rewrapped.
> 
> What number of characters would you like to see? I always go by the
> 80-character line rule.

72 characters is our rule, including the tab+2 spaces indentation.

> > And here. I've also re-indented the init script to match the
> > indentation used in S50dropbear (which I believe is more or less our
> > reference).
> 
> Good to know too, I actually randomly copied one init script already
> present (S53neard).

Our init scripts are far from being very consistent, so no problem with
this. We should probably write down a few rules, and do a bit of
cleanup work so that they look more similar.

> > Applied with those changes, thanks!
> 
> No problem, I just want to add one thing that I discovered last week,
> there's a Linux equivalent of the MFGTools developed by Ixonos:
> https://github.com/ixonos/utp_com
> 
> It allows to do the same thing, send flashing scripts, executing
> commands, flashing partitions etc... I might add it to the host
> packages some day but it unfortunately depends on libsgutils2-dev for
> the scsi headers in order to build. Not sure what the best approach
> is.

Just create a host package for libsgutils, and make host-utp-com depend
on it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
