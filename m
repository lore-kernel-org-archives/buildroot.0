From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 29 Jun 2014 00:50:19 -0300
Subject: [Buildroot] [RFC] libv4l: Bump version to 1.0.1
In-Reply-To: <20140628235847.0396216d@free-electrons.com>
References: <1403963761-7924-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140628235847.0396216d@free-electrons.com>
Message-ID: <20140629035019.GA820@arch.cereza>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 Jun 11:58 PM, Thomas Petazzoni wrote:
[..]
> 
> Thanks, the patch looks good in principle, but unfortunately it doesn't
> apply on the latest master, due to conflicts in libv4l.mk. Can you
> respin on top of the latest master and resend?

Ouch, my bad. I forgot to rebase my local branch on top of latest master.

> I think you can get rid
> of the [RFC] tag as well, I don't think there's anything really
> controversial or requiring discussion here.
> 

OK, no problem.

> > -config BR2_PACKAGE_LIBV4L_DECODE_TM6000
> > -	bool "decode_tm6000"
> > -	depends on BR2_TOOLCHAIN_USES_GLIBC
> > +config BR2_PACKAGE_LIBV4L_UTILS
> > +	bool "v4l-utils tools"
> >  	help
> > -	  Tool to decode tm6000 proprietary format streams
> > -
> > -comment "decode_tm6000 needs an (e)glibc toolchain"
> > -	depends on !BR2_TOOLCHAIN_USES_GLIBC
> > -
> > -config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
> > -	bool "ir-keytable"
> > -	depends on BR2_TOOLCHAIN_USES_GLIBC
> > -	help
> > -	  Tool to alter keymaps of Remote Controller devices
> > -
> > -comment "ir-keytable needs an (e)glibc toolchain"
> > -	depends on !BR2_TOOLCHAIN_USES_GLIBC
> > -
> > -config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE
> > -	bool "v4l2-compliance"
> > -	depends on BR2_INSTALL_LIBSTDCPP
> > -	help
> > -	  Tool to test v4l2 API compliance of drivers
> > -
> > -comment "v4l2-compliance needs a toolchain w/ C++"
> > -	depends on !BR2_INSTALL_LIBSTDCPP
> > -
> > -config BR2_PACKAGE_LIBV4L_V4L2_CTL
> > -	bool "v4l2-ctl"
> > -	depends on BR2_INSTALL_LIBSTDCPP
> 
> Can you make sure that the programs do not need C++ support, since
> you're getting rid of the dependency entirely?
> 

Yes, I will.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
