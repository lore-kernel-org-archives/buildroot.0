From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 28 Jul 2014 19:52:43 -0400
Subject: [Buildroot] [PATCH] linux: support multiple custom DTS files
In-Reply-To: <20140728223621.7ca59a2d@free-electrons.com>
References: <1406323532-18764-1-git-send-email-eeppeliteloop@gmail.com>
 <20140728223621.7ca59a2d@free-electrons.com>
Message-ID: <CAB4xu_2KTG7_JYQJPZ6GqPbLN1bjGf+s=A=qe8A_tCBaOQvn-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 28, 2014 at 4:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Philippe Proulx,
>
> On Fri, 25 Jul 2014 17:25:32 -0400, Philippe Proulx wrote:
> > Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> > ---
> >  linux/Config.in | 6 ++++--
> >  linux/linux.mk  | 2 +-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/linux/Config.in b/linux/Config.in
> > index 441301f..a7a3911 100644
> > --- a/linux/Config.in
> > +++ b/linux/Config.in
> > @@ -323,10 +323,12 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
> >         dts files to build, separated by spaces.
> >
> >  config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
> > -     string "Device Tree Source file path"
> > +     string "Device Tree Source file paths"
> >       depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
> >       help
> > -       Path to the device tree source file
> > +       Path to the device tree source file. You can
>
> file -> files.

Well then you should also apply this to the help text of
BR2_LINUX_KERNEL_INTREE_DTS_NAME because I just
copied this as is to keep it consistent:

config BR2_LINUX_KERNEL_INTREE_DTS_NAME
  string "Device Tree Source file names"
  depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
  help
    Name of the device tree source file, without
    the trailing .dts. You can provide a list of
    dts files to build, separated by spaces.
>
>
> Applied with this fixed, thanks.

Thank you,
Phil
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
