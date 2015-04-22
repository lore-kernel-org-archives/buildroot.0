From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 22 Apr 2015 16:31:24 -0400
Subject: [Buildroot] [PATCH] uboot: add default for
	BR2_TARGET_UBOOT_PATCH
In-Reply-To: <20150422222225.4b80a2bd@free-electrons.com>
References: <1429623936-4438-1-git-send-email-fhunleth@troodon-software.com>
 <20150422222225.4b80a2bd@free-electrons.com>
Message-ID: <CA+-urNTdraNR-jsAbCM_DxnMMdx=YfrhsUgW973oXwO5guLsWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 22, 2015 at 4:22 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Dear Frank Hunleth,
>
> On Tue, 21 Apr 2015 09:45:36 -0400, Frank Hunleth wrote:
> > Automatically copy over the value from BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
> > to make handling its deprecation easier. Thanks to Arnout for the
> > suggestion.
> >
> > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> > ---
> >  boot/uboot/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index 4f01499..419b183 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -84,6 +84,7 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
> >
> >  config BR2_TARGET_UBOOT_PATCH
> >       string "Custom U-Boot patches"
> > +     default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
> >       help
> >         A space-separated list of patches to apply to U-Boot.
> >         Each patch can be described as an URL, a local file path,
>
> Does this actually works? I've tried removing BR2_TARGET_UBOOT_PATCH=""
> from my .config, add BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="foo bar", and
> ran 'make menuconfig'. I was hoping to see "foo bar" in
> BR2_TARGET_UBOOT_PATCH, but it wasn't the case. Am I missing something?
>

It only works if you have BR2_DEPRECATED_SINCE_2015_05 enabled. I
almost posted an email asking how useful this was. I very rarely
enable BR2_DEPRECATED. However, I justified it to myself that if
nothing else, it was documentation that the former value in
BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR could be copied verbatim.

FWIW, I did try reordering the options to see if putting
BR2_TARGET_UBOOT_PATCH first would make this work, but it didn't
change the results on my end.

Frank
