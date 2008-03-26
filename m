From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 26 Mar 2008 22:04:01 +0100
Subject: [Buildroot] Buildroot, busysbox and microcom
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA823F@mtsexchange.dc.multitech.prv>
Message-ID: <032501c88f86$e28955e0$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Something I noticed is that in the list of applications you can select
> for busybox from the buildroot config does not include the microcom
> terminal emulator app. What is the proper process to get this included?
> Do I just do a 'make configured' and just edit the busybox .config file,
> and then make? Or do I need to do something with saveconfig and
> getconfig? Or are those commands just used to save and get custom
> .config files in the project directory?

You need to disable BR2_PACKAGE_BUSYBOX_HIDE_OTHERS to allowyou to configure Microcomif BR2_NETWORK_SUPPORT
comment "Networking applications"
...if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || !BR2_PACKAGE_BUSYBOX_SNAPSHOT
source "package/microcom/Config.in"
endif...Best RegardsUlf Samuelsson
