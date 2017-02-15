From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 09:42:04 +0100
Subject: [Buildroot] [PATCH 1/1] bluez5_utils: Add config option to
 install "bdaddr"
In-Reply-To: <20170215063911.ojfnao67fbpsojy7@tarshish>
References: <1487084632-16396-1-git-send-email-vishalthanki@gmail.com>
 <20170214160844.ts44yh2l4ghzwvad@tarshish>
 <20170214211443.00dc1a10@free-electrons.com>
 <20170215063911.ojfnao67fbpsojy7@tarshish>
Message-ID: <20170215094204.22df2cb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 08:39:11 +0200, Baruch Siach wrote:

> > How many tools are provided by bluez5_utils? If it's just a very small
> > set of tools, it's OK to have one option for each. But if there are
> > many small tools, we definitely don't want to have one option for each.  
> 
> The bluez5_utils-5.43 tools/ subdirectory has 56 executables, totaling 5.7MB. 
> Some are covered by covered by --enable-tools which we enable unconditionally, 
> some other are installed by --enable-experimental, and yet others are only 
> built by --enable-experimental. bdaddr falls in the last category.
> 
> > In any case, we need to provide a better guideline to Vishal, because
> > right now, we are not explaining how the patch should be fixed. If we
> > introduce something like BR2_PACKAGE_BLUEZ5_UTILS_TOOLS, then what
> > should be done with BR2_PACKAGE_BLUEZ5_UTILS_CLIENT or
> > BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL for example ?  
> 
> All should go under BR2_PACKAGE_BLUEZ5_UTILS_TOOLS, as well as --enable-tools, 
> IMO.

Well, 5.7 MB and 56 executables is definitely not a small amount, so I
would tend to instead accept a more fine-grained selection of the tools.

However, if indeed --enable-tools is optional, we shouldn't enable it
unconditional, but have an option for that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
