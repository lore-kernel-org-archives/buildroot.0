From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:48:46 +0100
Subject: [Buildroot] [PATCHv2] usbutils: bump to version 008
In-Reply-To: <1415715430-6657-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415715430-6657-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141209204846.48060ab0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 11 Nov 2014 11:17:10 -0300, Gustavo Zacarias wrote:
> Now uses hwdb from libudev for usb information.
> Drop all redundant/obsolete dependencies and cleanup hooks.
> Don't install to staging, it's pointless, it provides no libraries at
> all and it doesn't bundle usb.ids any more.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/usbutils/Config.in     | 18 +++++-------------
>  package/usbutils/usbutils.hash |  2 +-
>  package/usbutils/usbutils.mk   | 33 ++-------------------------------
>  3 files changed, 8 insertions(+), 45 deletions(-)

Thanks, applied. I've done a small change to the 'comment' handling in
Config.in, to match what the Buildroot manual recommends for a udev
dependency.

It's sad to see a basic tool such as lsusb now requiring udev, but oh
well if that's upstream decision, we have no real choice.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
