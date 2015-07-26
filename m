From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:25:15 +0200
Subject: [Buildroot] Unable to login as root to new buildroot system
In-Reply-To: <CAChFQ9R=5anPgo9mboKxCkppsadQkSzC_WhpevWoarwgKVhLQg@mail.gmail.com>
References: <CAChFQ9R=5anPgo9mboKxCkppsadQkSzC_WhpevWoarwgKVhLQg@mail.gmail.com>
Message-ID: <20150726182515.1e0b67c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Adam Baxter,

On Fri, 24 Jul 2015 17:25:00 -0700, Adam Baxter wrote:
> I'm using the latest Git version of buildroot and the following config -
> https://github.com/voltagex/serial-vm-buildroot
> 
> It builds and boots with qemu just fine, but no matter what combination of
> getty/no getty/shell/root password I use, I can't login. Even with a blank
> root password I'm told that the password is incorrect, and I can't work out
> how to make it boot straight to a root prompt.
> 
> Can anyone help? The repo above should be able to be built with make
> serial_defconfig, but if there's still hardcoded paths to a 'voltagex' or
> 'ubuntu' user you'll have to let me know how to remove them.

Your configuration has:

BR2_TARGET_GENERIC_GETTY_OPTIONS="-n"

Are you sure you really want this getty option?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
