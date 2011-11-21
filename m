From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 21 Nov 2011 13:41:52 +0100
Subject: [Buildroot] help needed with realtek gigabit network adapter
In-Reply-To: <4ECA36CB.5010803@neotion.com>
References: <4ECA36CB.5010803@neotion.com>
Message-ID: <1321879312.2085.18.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 2011-11-21 at 12:32 +0100, Emmanuel BOUAZIZ wrote:

> I'm trying to run buildroot 2011.08 on an atom based board, but I have
> a problem with the network driver:

> I have tried to put a the rtl8168d-1.fw and rtl8168d-1.fw
> in /lib/firmware/rtl_nic directory
> I tried to define the CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware" but it
> requires to define CONFIG_EXTRA_FIRMWARE and I
> don't know what to set it to. I tried with "rtl8168d" and some
> variations but it didn't work
> I also tried to deactivate firmware support but it doesn't seem to
> have any effect, I'm not sure I did that correctly
> though.

If this device requires firmware to be uploaded, then you most probably
need to have udev running. The udev daemon should then take care of
uploading the firmware when the module is loaded.


Regards,
Sven
