From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Feb 2013 23:13:28 +0100
Subject: [Buildroot] [PATCH 7/7] package/dtc: add option to install
	programs
In-Reply-To: <5110B373.6070709@mind.be>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <22182f29dbece790e26c601efbd668e25e4b29d1.1359993560.git.yann.morin.1998@free.fr>
 <5110B373.6070709@mind.be>
Message-ID: <201302072313.28799.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Tuesday 05 February 2013 Arnout Vandecappelle wrote:
> On 04/02/13 17:01, Yann E. MORIN wrote:
> > By default, we only install the libfdt library.
> >
> > As suggested by Arnout, add an option that also
> > installs the few dtc programs.
[--SNIP--]
> > +	  Note: dtdiff requires bash, so if bash is not selected, dtdiff will
> > +	        be removed from the target file system. Enable bash if you
> > +	        need dtdiff on the target.
>   I don't know if it is really necessary, but maybe this can be made even 
> more explicit like:
> 
> comment "dtdiff will not be installed: it requires bash"
> 	depends on BR2_PACKAGE_DTC_PROGRAMS
> 	depends on !BR2_PACKAGE_BASH

Yep, done.

[--SNIP--]
> > +DTC_POST_INSTALL_TARGET_HOOKS += DTC_POST_INSTALL_TARGET_RM_DTDIFF
>   This should be in the =y branch.
>   I don't really like that the definition of the hook comes below. It 
> works, of course, but it's not what people expect.

OK, done.

> > +define DTC_POST_INSTALL_TARGET_RM_DTDIFF
> > +	rm -f $(TARGET_DIR)/usr/bin/dtdiff
>   As said before, put this higher, just below the INSTALL_STAGING.

OK, done.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
