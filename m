From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 17:29:55 +0200
Subject: [Buildroot] [PATCH 3/3] package/linux-tools: some selftests
 needs kmod's modprobe
In-Reply-To: <20190408164333.26942-4-romain.naour@smile.fr> (Romain Naour's
 message of "Mon, 8 Apr 2019 18:43:33 +0200")
References: <20190408164333.26942-1-romain.naour@smile.fr>
 <20190408164333.26942-4-romain.naour@smile.fr>
Message-ID: <87pnpbctfw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Some kernel-selftests are using modprobe options (-n) that are not available
 > from busybox's modprobe, so make sure that BR2_PACKAGE_KMOD_TOOLS is selected.

 > [linux-4.19 selftests]$ git grep tput
 > drivers/gpu/drm_mm.sh:if ! /sbin/modprobe -n -q test-drm_mm; then
 > drivers/usb/usbip/usbip_test.sh:if ! /sbin/modprobe -q -n usbip_host; then

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
