From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 27 Mar 2008 13:52:43 +1100
Subject: [Buildroot] Buildroot, busysbox and microcom
In-Reply-To: <032501c88f86$e28955e0$060514ac@atmel.com>
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA823F@mtsexchange.dc.multitech.prv>
	<032501c88f86$e28955e0$060514ac@atmel.com>
Message-ID: <20080327025243.GA5036@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 26, 2008 at 10:04:01PM +0100, Ulf Samuelsson wrote:
> 
> 
> > Something I noticed is that in the list of applications you can select
> > for busybox from the buildroot config does not include the microcom
> > terminal emulator app. What is the proper process to get this included?
> > Do I just do a 'make configured' and just edit the busybox .config file,
> > and then make? Or do I need to do something with saveconfig and
> > getconfig? Or are those commands just used to save and get custom
> > .config files in the project directory?
> 
> You need to disable BR2_PACKAGE_BUSYBOX_HIDE_OTHERS to allowyou to configure Microcomif BR2_NETWORK_SUPPORT
> comment "Networking applications"
> ...if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || !BR2_PACKAGE_BUSYBOX_SNAPSHOT
> source "package/microcom/Config.in"
> endif...Best RegardsUlf Samuelsson

I thought Tim wanted to enable Busybox's microcom. In that case, run
"make busybox-menuconfig", and maybe "make busybox-update" afterwards to
save the configuration to local/xzy/..


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
