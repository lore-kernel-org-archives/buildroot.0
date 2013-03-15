From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Mar 2013 18:52:33 +0100
Subject: [Buildroot] [PATCH] toolchain/crosstool-NG: do not depend on
	the top-level Buildroot's .config
In-Reply-To: <EE5E77B503DE9A478B63A89AAD2585EDB66A62@vpane.excalyptech.com>
References: <1363286650-11208-1-git-send-email-yann.morin.1998@free.fr>
 <EE5E77B503DE9A478B63A89AAD2585EDB66A62@vpane.excalyptech.com>
Message-ID: <201303151852.33211.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Przemyslaw, All,

On Friday 15 March 2013 Przemyslaw Wrzos wrote:
> On Fri, 15 Mar 2013 at 05:44:10, Yann E. MORIN wrote:
[--SNIP--]
> $@.timestamp 	$(call
> >  ctng-oldconfig,$@) 	$(call ctng-oldconfig,$@)
> > -	$(call ctng-check-config-changed,$@,$@.timestamp)
> > -	$(Q)rm -f $@.timestamp
> > 
> >  # Manual configuration
> >  ctng-menuconfig: $(CTNG_DIR)/.config
> 
> I think you'll need to replace $< with a direct reference to
> $(CTNG_CONFIG_FILE) to make that work.

Indeed. That did not help testing the change with an already-built
toolchain present... :-(

Will resend, thank you!

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
