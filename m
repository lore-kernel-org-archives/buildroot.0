From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 21:14:43 +0100
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: Add config option to
 install "bdaddr"
In-Reply-To: <20170214160844.ts44yh2l4ghzwvad@tarshish>
References: <1487084632-16396-1-git-send-email-vishalthanki@gmail.com>
 <20170214160844.ts44yh2l4ghzwvad@tarshish>
Message-ID: <20170214211443.00dc1a10@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 18:08:44 +0200, Baruch Siach wrote:

> > +config BR2_PACKAGE_BLUEZ5_TOOLS_BDADDR
> > +	bool "install bdaddr tool"
> > +	depends on BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
> > +	help
> > +	  The "bdaddr" tool is used for changing the Bluetooth device address.  
> 
> bdaddr is less than 100KB. I don't think it's worth another config option. 
> 100KB is negligible when you already have glib and dbus. I'd suggested to 
> either install bdaddr unconditionally, or have a single option for all tools/ 
> executables that are not covered by another config option already.

I would tend to agree, but we already have options like
BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL to install a single tool.

How many tools are provided by bluez5_utils? If it's just a very small
set of tools, it's OK to have one option for each. But if there are
many small tools, we definitely don't want to have one option for each.

In any case, we need to provide a better guideline to Vishal, because
right now, we are not explaining how the patch should be fixed. If we
introduce something like BR2_PACKAGE_BLUEZ5_UTILS_TOOLS, then what
should be done with BR2_PACKAGE_BLUEZ5_UTILS_CLIENT or
BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL for example ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
