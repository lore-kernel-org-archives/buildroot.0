From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 08:28:25 +0100
Subject: [Buildroot] [PATCH v4 2/3] doom-wad: bump to version 1.9
In-Reply-To: <CABLs7GUjzHgUzPAk1GwEN2oxMW4g2WoUSD8WGB0KjTP6WbK1yA@mail.gmail.com>
References: <1446839279-9021-1-git-send-email-rprebello@gmail.com>
 <1446839279-9021-2-git-send-email-rprebello@gmail.com>
 <20151223233718.2703675c@free-electrons.com>
 <CABLs7GUjzHgUzPAk1GwEN2oxMW4g2WoUSD8WGB0KjTP6WbK1yA@mail.gmail.com>
Message-ID: <20151224082825.78029a4a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rodrigo,

On Wed, 23 Dec 2015 21:59:08 -0200, Rodrigo Rebello wrote:

> Indeed, I agree that looks a bit weird. I believe the zip filename
> carries the number '19' instead of '1.9' merely because it dates back
> to the old times of DOS, when its FAT filesystem imposed quite a few
> limitations, like the dot character being allowed in a filename only
> to separate it from its extension.
> 
> The correct version number, however, is really 1.9, so I'd prefer to
> keep DOOM_WAD_VERSION untouched and apply the substitution you
> proposed to the zip filename only. Would that be OK to you?

Yes, this is perfectly fine.

> 
> >>  DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom
> >
> > However, the main reason I didn't apply is because this server seems to
> > be unavailable at the moment. So I can't test the package, and it would
> > cause build failures in the autobuilders.
> >
> > Are you also experiencing the same issue?
> 
> Yes, I have confirmed the server is unresponsive at the moment. I have
> found an alternative URL that seems to work fine, though:
> 
> http://www.jbserver.com/downloads/games/doom/misc/shareware/doom19s.zip
> 
> Should I respin this patch with that temporary URL?

Yes, if the hash matches the one from the original server, it is fine
to use an alternate one. Indicate it in the .mk file:

# Official server currently unavailable
# DOOM_WAD_SITE = ....
DOOM_WAD_SITE = http://www.jbserver.com/downloads/games/doom/misc/shareware/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
