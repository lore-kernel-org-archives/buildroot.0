From: =?utf-8?Q?Sh=C3=A9rab?= <Sebastien.Hinderer@ens-lyon.org>
Date: Sat, 3 Mar 2018 10:31:58 +0100
Subject: [Buildroot] Running several virtual consoles and customizing
 the keymap
In-Reply-To: <20180302213055.1f294f8d@windsurf.home>
References: <20180302175531.GA4270@pema>
 <20180302213055.1f294f8d@windsurf.home>
Message-ID: <20180303093158.GB13445@pema>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas!

Many thanks for your so prompt and helpful response!

Thomas Petazzoni (2018/03/02 21:30 +0100):
> Hello,
> 
> On Fri, 2 Mar 2018 18:55:32 +0100, Sh?rab wrote:
> 
> > I am new to build root. First of all thanks a lot for having designed
> > such a tool, and for having done so in such an elegant way.
> 
> Thanks!
> 
w> > I use a system in pure text-mode, booted by systemd.
> > 
> > There are two things I don't know how to achieve right now.
> > 
> > 1. Define a (french) keymap. Is there a way to do that in the .config
> > file while not running an X server?
> 
> Use "loadkeys f"

Ah! So should I add this to some startup script,e.g.on the overlay file
system that will be copied on the target?

Where would it be appropriate to add such a command ona system started
with systemd?

> > 2. I am able to run one virtual console but would love to have several of
> > them, typically 6 as on my PC. Can tht be achieved?
> 
> Add more symlinks from /etc/systemd/system/getty.target.wants/ to
> lib/systemd/system/getty at service. See SYSTEMD_INSTALL_SERVICE_TTY in
> package/systemd/systemd.mk.

Thanks for that, too! Again should these links be added to the overlay
filesystem?

Cheers and thanks again for such a nice thing!

Sh?rab.
