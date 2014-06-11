From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 11 Jun 2014 23:18:21 +0200
Subject: [Buildroot] psplash and systemd
In-Reply-To: <20140609142734.32d58a30@free-electrons.com>
References: <537C657F.4090106@ebo-enterprises.com> <20140521192928.GA3672@ned>
 <20140609142734.32d58a30@free-electrons.com>
Message-ID: <20140611211821.GB2825@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On Mon, Jun 09, 2014 at 02:27:34PM +0200, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Wed, 21 May 2014 21:29:28 +0200, Eric Le Bihan wrote:
> > Hi!
> >
> > On Wed, May 21, 2014 at 10:36:15AM +0200, Tom Deblauwe wrote:
> > > Hello,
> > >
> > > I am using psplash in my initramfs and it shows up a graphical
> > > bootscreen, but then the regular bootprocess starts and there I would
> > > like to continue showing the splash screen. I am using the 6d3336a
> > > commit of master buildroot. So I would like to use systemd. What is the
> > > best solution for this?
> >
> > Please find attached a patch that installs two new services for using psplash
> > with systemd. These are inspired by the ones from Plymouth
> > (http://cgit.freedesktop.org/plymouth/tree/systemd-units/):
>
> Can you submit this patch properly, i.e with git send-email, so that it
> can be applied?
I posted a proper patch. As for adding progress report from systemd to
psplash, this would require a patch to src/core/manager.c in systemd to write
to psplash socket.

BTW, maybe we should provide a patch to set the default image with the famous
Buildroot hard hat, to replace the "POKY" theme...

Best regards,
ELB
