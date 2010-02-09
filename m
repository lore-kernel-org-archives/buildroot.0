From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 9 Feb 2010 12:54:45 +0100
Subject: [Buildroot] [PATCH 04/14] package: added lirc
In-Reply-To: <20100209123756.78a62141@surf>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
	<1265566076-10628-5-git-send-email-llandwerlin@gmail.com>
	<20100209123756.78a62141@surf>
Message-ID: <4d28d4b51002090354r251fd6bfk5e08ccf9cd460baa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 9, 2010 at 12:37 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> On Sun,  7 Feb 2010 19:07:46 +0100
> llandwerlin at gmail.com wrote:
>
> > +if BR2_PACKAGE_LIRC
> > +
> > +choice
> > +     prompt "lirc drivers"
> > +     default BR2_PACKAGE_LIRC_ALL
> > +
> > +     help
> > +       Select the drivers to build in lirc. There is 3 choices,
> > all
> > +       of them, one of them, none of them. By selecting 'one of
> > +       them', you will have to select which one in the next item.
>
> I'm not sure the help text actually matches what has been implemented :
>

Oops... a residual of the first try...


> > +
> > +     config BR2_PACKAGE_LIRC_ALL
> > +             bool "all"
> > +
> > +     config BR2_PACKAGE_LIRC_USERSPACE
> > +             bool "userspace"
> > +
> > +     config BR2_PACKAGE_LIRC_NONE
> > +             bool "none"
> > +endchoice
> > +
> > +endif # BR2_PACKAGE_LIRC
> > +
>
> > --- /dev/null
> > +++ b/package/lirc/lirc.mk
> > @@ -0,0 +1,39 @@
> > +#############################################################
> > +#
> > +# lirc
> > +#
> > +#############################################################
> > +
> > +LIRC_VERSION = 0.8.6
> > +LIRC_SOURCE = lirc-$(LIRC_VERSION).tar.bz2
> > +LIRC_SITE = http://prdownloads.sourceforge.net/lirc
> > +LIRC_LIBTOOL_PATCH = NO
> > +LIRC_INSTALL_STAGING = YES
>
> What is the policy regarding installation to the $(STAGING_DIR)
> directory for applications ? Some of them say FOO_INSTALL_STAGING=NO,
> some others FOO_INSTALL_STAGING=YES.
>

I usually install libraries in staging, not binaries.
Why do you need unstripped binaries ? Are you doing remote debug using the
staging directory ?



>
> In my opinion, installation into the $(STAGING_DIR) should be
> mandatory, since we want to keep unstripped version of the binaries +
> documentation, etc.
>
> > +LIRC_INSTALL_TARGET = YES
>
> This is the default behaviour so it can be removed.
>

Will do !
Thx for reviewing.


>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100209/41a52985/attachment.htm>
