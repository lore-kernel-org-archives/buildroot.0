From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Mon, 23 Mar 2020 07:56:27 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/rcw : bump to LSDK-19.09
In-Reply-To: <20200322210919.GC22325@scaer>
References: <20200318071427.347-1-laurent.hartanerot@gmail.com>
 <20200322162444.29206-1-laurent.hartanerot@gmail.com>
 <20200322210919.GC22325@scaer>
Message-ID: <CACGVVZiDzoM1izK0rbPzRCCniNNHbyMBeU62LLAmZ3mv9q6r+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

Sorry, I did not understand what you wanted me to do in your previous email.

Now, looking at your patch, it's clearer.

I just tested the modification. It's ok for me.

Thank's Yann


Le dim. 22 mars 2020 ? 22:09, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> Laurent, All,
>
> On 2020-03-22 17:24 +0100, Laurent Hartanerot spake thusly:
> > From: Laurent Hartanerot <laurent.hartanerot@atos.net>
> >
> > Upgrade python to python3 : "Only Python versions 3.0+ are supported"
> >
> > Signed-off-by: Laurent Hartanerot <laurent.hartanerot@atos.net>
> > ---
> >  package/rcw/rcw.hash | 2 +-
> >  package/rcw/rcw.mk   | 6 +++---
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
> > index 7de1ec659a..76b6373942 100644
> > --- a/package/rcw/rcw.hash
> > +++ b/package/rcw/rcw.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3
> rcw-LSDK-18.12.tar.gz
> > +sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1
> rcw-LSDK-19.09.tar.gz
> >  sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd
> LICENSE
> > diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
> > index dbfeae7b21..10e357ed69 100644
> > --- a/package/rcw/rcw.mk
> > +++ b/package/rcw/rcw.mk
> > @@ -4,13 +4,13 @@
> >  #
> >
> ################################################################################
> >
> > -RCW_VERSION = LSDK-18.12
> > +RCW_VERSION = LSDK-19.09
> >  RCW_SITE =
> https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
> >  RCW_SITE_METHOD = git
> >  RCW_LICENSE = BSD-3-Clause
> >  RCW_LICENSE_FILES = LICENSE
> >
> > -HOST_RCW_DEPENDENCIES = host-python
> > +HOST_RCW_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
> >
> >  RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
> >
> > @@ -41,7 +41,7 @@ endef
> >  HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
> >
> >  define HOST_RCW_BUILD_CMDS
> > -     $(HOST_DIR)/bin/python $(@D)/rcw.py \
> > +     python3 $(@D)/rcw.py \
>
> This would not work if building our own host-python3, because it most
> probably is not in the default PATH, which by the way I explained in a
> previous mail.
>
> Furthermore, this can all be highyl simplified, because the script is
> not a direct python3 script, it uses /usr/bin/env as shebang, so will
> properly find the appropriate python3 from the PATH.
>
> I've fixed that and pushed to master. Please review my commit and verify
> it also still works for you, please. Thanks!
>
> Regards,
> Yann E. MORIN.
>
> >               -i $(@D)/custom_board/rcw/$(RCW_PROJECT) \
> >               -I $(@D)/custom_board -o $(@D)/PBL.bin
> >  endef
> > --
> > 2.20.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>


-- 
Laurent HARTANEROT
Laurent.Hartanerot at gmail.com
tel : 06 49 14 93 74
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200323/aedaea9a/attachment.html>
