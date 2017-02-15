From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 15 Feb 2017 08:39:11 +0200
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: Add config option to
 install "bdaddr"
In-Reply-To: <20170214211443.00dc1a10@free-electrons.com>
References: <1487084632-16396-1-git-send-email-vishalthanki@gmail.com>
 <20170214160844.ts44yh2l4ghzwvad@tarshish>
 <20170214211443.00dc1a10@free-electrons.com>
Message-ID: <20170215063911.ojfnao67fbpsojy7@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 14, 2017 at 09:14:43PM +0100, Thomas Petazzoni wrote:
> On Tue, 14 Feb 2017 18:08:44 +0200, Baruch Siach wrote:
> > > +config BR2_PACKAGE_BLUEZ5_TOOLS_BDADDR
> > > +	bool "install bdaddr tool"
> > > +	depends on BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
> > > +	help
> > > +	  The "bdaddr" tool is used for changing the Bluetooth device address.  
> > 
> > bdaddr is less than 100KB. I don't think it's worth another config option. 
> > 100KB is negligible when you already have glib and dbus. I'd suggested to 
> > either install bdaddr unconditionally, or have a single option for all tools/ 
> > executables that are not covered by another config option already.
> 
> I would tend to agree, but we already have options like
> BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL to install a single tool.
> 
> How many tools are provided by bluez5_utils? If it's just a very small
> set of tools, it's OK to have one option for each. But if there are
> many small tools, we definitely don't want to have one option for each.

The bluez5_utils-5.43 tools/ subdirectory has 56 executables, totaling 5.7MB. 
Some are covered by covered by --enable-tools which we enable unconditionally, 
some other are installed by --enable-experimental, and yet others are only 
built by --enable-experimental. bdaddr falls in the last category.

> In any case, we need to provide a better guideline to Vishal, because
> right now, we are not explaining how the patch should be fixed. If we
> introduce something like BR2_PACKAGE_BLUEZ5_UTILS_TOOLS, then what
> should be done with BR2_PACKAGE_BLUEZ5_UTILS_CLIENT or
> BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL for example ?

All should go under BR2_PACKAGE_BLUEZ5_UTILS_TOOLS, as well as --enable-tools, 
IMO.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
