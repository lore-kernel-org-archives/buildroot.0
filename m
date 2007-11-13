From: Felipe Uderman <felipe.uderman@gmail.com>
Date: Tue, 13 Nov 2007 09:49:23 -0300
Subject: [Buildroot] Trying to use buildroot to configure a uClinux
	Kernel for ARM Architecture... please help
In-Reply-To: <4a339d7c0711130025g4cd56e50mf11cc04fd888e6ea@mail.gmail.com>
References: <951b8d920711121316l59339959x3b894c9884dbbdca@mail.gmail.com>
	<4a339d7c0711130025g4cd56e50mf11cc04fd888e6ea@mail.gmail.com>
Message-ID: <951b8d920711130449p26c2c5an14e3baad5e452e3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I have managed to solve the problem. I have saved my configuration on
a file named teste01.config. But on the Makefile, there was no reference to
it. So I edited the makefile to include my teste01.config file:

# Pull in the user's configuration file
ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
ifeq ($(BOARD),)
# -include $(TOPDIR).config
 -include teste01.config
else
-include $(TOPDIR)/local/$(BOARD)/$(BOARD).config
endif

Regards,

Uderman

On Nov 13, 2007 5:25 AM, laurent laffont <l.laffont@temis-france.com> wrote:

> Hi,
>
> you should post your buildroot .config so we can look for your problem.
>
> 2007/11/12, Felipe Uderman <felipe.uderman@gmail.com >:
> >
> > Hello,
> >
> > I have followed the steps described here,
> > http://buildroot.uclibc.org/buildroot.html, in order to configure a
> > uClinux image with buildroot. I have configured my kernel, busybox and
> > everything else with Make Menuconfig, and also saved this configuration on a
> > file. But then when I run Make, it generates a i386 project folder. I
> > believe this should be a default configuration, and somehow buildroot is
> > ignoring my changes. Anyone have idea of what am I doing wrong? Is there
> > something I should do in order to tell buildroot to use my configurations
> > and not a default one?
> >
> > Thank you!
> >
> > Regards,
> >
> > Uderman
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
> --
> Laurent Laffont
>
> 48 Avenue Jean Jaur?s
> 74800 LA ROCHE SUR FORON
> T?l : 04 50 97 49 91
> Fax: 04 50 97 49 94
> Web: http://www.temis-france.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071113/497172b6/attachment.htm 
