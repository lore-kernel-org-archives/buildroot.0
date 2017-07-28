From: Alexey Roslyakov <alexey.roslyakov@gmail.com>
Date: Fri, 28 Jul 2017 13:39:40 +0700
Subject: [Buildroot] [PATCH 1/1] brcm-patchram-plus: new package
In-Reply-To: <20170722152511.4ffc8dd3@windsurf>
References: <20170721144520.14683-1-alexey.roslyakov@gmail.com>
 <20170722152511.4ffc8dd3@windsurf>
Message-ID: <CALFoz4YBpCZJ1qvca2SE_C8p=XfhgFD42hNkpQMj57ETB4ffrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
thank you for your suggestions.
Actually, it was confusing me (what to use as upstream) and I wished to
write my concerns in the cover letter. But forgot to write it.

I'll send updated patch later today.

On 22 July 2017 at 20:25, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri, 21 Jul 2017 21:45:20 +0700, Alexey Roslyakov wrote:
> > Many of Broadcom BCM43XX WiFi/Bluetooth combo chips have pretty tricky
> initialization.
> > Broadcom patchram utility has been released to address the issue.
> >
> > Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>
>
> Thanks for this contribution! See a few comments below.
>
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 7b7c5ab4e6..45466591da 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -73,6 +73,9 @@ N:  Alexandre Esse <alexandre.esse.dev@gmail.com>
> >  F:   package/kvazaar/
> >  F:   package/v4l2loopback/
> >
> > +N:   Alexey Roslyakov <alexey.roslyakov@gmail.com>
> > +F:   package/brcm-patchram-plus
>
> Please end the package path with a /, like all other entries in the
> DEVELOPERS file.
>
> > diff --git a/package/brcm-patchram-plus/Config.in
> b/package/brcm-patchram-plus/Config.in
> > new file mode 100644
> > index 0000000000..f7df21d2b2
> > --- /dev/null
> > +++ b/package/brcm-patchram-plus/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_BRCM_PATCHRAM_PLUS
> > +     bool "brcm-patchram-plus"
> > +     help
> > +             Utility's to configure and test Broadcom Bluetooth chips
> on Linux.
> > +
> > +             https://code.google.com/archive/p/broadcom-bluetooth/
>
> Indentation for the help text is one tab + two spaces. I would
> recommend you to run utils/check-package on your new package to catch
> such coding style issues.
>
> > +BRCM_PATCHRAM_PLUS_VERSION = 0.1.1
> > +BRCM_PATCHRAM_PLUS_SOURCE = brcm-patchram-plus_$(BRCM_
> PATCHRAM_PLUS_VERSION).tar.gz
> > +BRCM_PATCHRAM_PLUS_SITE = https://launchpad.net/ubuntu/+
> archive/primary/+files
>
> Perhaps using the git repository at
> https://chromium.googlesource.com/chromiumos/third_party/broadcom would
> be a more "official" upstream ?
>
> > +define BRCM_PATCHRAM_PLUS_BUILD_CMDS
> > +     $(TARGET_CC) -o $(@D)/brcm_patchram_plus $(@D)/brcm_patchram_plus.c
> > +endef
> > +
> > +define BRCM_PATCHRAM_PLUS_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -D -m 0755 $(@D)/brcm_patchram_plus
> $(TARGET_DIR)/usr/bin/brcm_patchram_plus
> > +endef
>
> What about using the Makefile that comes inside the package ? At least
> in the Git repository I pointed to, there is a Makefile that seems
> suitable.
>
> Thanks!
>
> Thoma
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
With best regards,
  Alexey Roslyakov
Email: alexey.roslyakov at gmail.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170728/a1e4dd26/attachment.html>
