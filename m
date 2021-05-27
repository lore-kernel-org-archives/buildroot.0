From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 27 May 2021 16:41:20 +0300
Subject: [Buildroot] [PATCH v2 0/5] Update Cage, wlroots, and wayland
In-Reply-To: <20210518171133.GW2506@scaer>
References: <20210518135423.194507-1-aperez@igalia.com>
 <20210518171133.GW2506@scaer>
Message-ID: <20210527164120.GB409733@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, all,

On Tue, 18 May 2021 19:11:33 +0200 "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> Adrian, All,
> 
> On 2021-05-18 16:54 +0300, Adrian Perez de Castro spake thusly:
> > Hello!
> > 
> > This patch set updates Cage to 0.1.3, which by itself does not have functional
> > changes over the previous version, but it pulls in wlroots 0.13.0 which does
> > include a good number of improvements.
> > 
> > Last but not least, wlroots can now libseat to broker sessions, so three of
> > the patches deal with adding a package for it, installing the daemon init
> > scripts (if the daemon is enabled, as it is optional), and arranging for
> > wlroots to use libseat when available. It looks like libseat is gaining
> > momentum in the Wayland ecosystem and for example Weston can also use it
> > since half a year ago [1].
> 
> Waiting for a patch series, then! ;-]

Your wish has been granted, sir!

  https://patchwork.ozlabs.org/project/buildroot/patch/20210527133503.412330-1-aperez at igalia.com/

> > Best regards,
> > -Adrian
> > 
> > [1] https://gitlab.freedesktop.org/wayland/weston/-/commit/6c4a993a999048a2054ec97e71d32839b312c642
> > 
> > 
> > Adrian Perez de Castro (5):
> >   package/wlroots: bump to version 0.13.0
> >   package/seatd: new package
> >   package/seatd: install init scripts
> >   package/wlroots: use libseat when available
> >   package/cage: bump to version 0.1.3
> 
> Whole series applied to next, thanks.

A small mistake slipped in, currently the check for seatd in ?wlroots.mk?
is using the wrong variable. Here goes a patch to fix it:

  https://patchwork.ozlabs.org/project/buildroot/patch/20210527133752.413075-1-aperez at igalia.com/

Cheers,
-Adrian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210527/b3ad607a/attachment.asc>
