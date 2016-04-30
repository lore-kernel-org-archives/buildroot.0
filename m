From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Apr 2016 19:06:15 +0200
Subject: [Buildroot] [PATCH v4] android-tools: add new package
In-Reply-To: <1448296032-7781-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1448296032-7781-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20160430190615.345e2145@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Nov 2015 17:27:12 +0100, Gary Bisson wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This package allows to build the fastboot and adb host utilities,
> which can be used to interact with target devices implementing one of
> these protocols.
> 
> The work behind the host utilities was funded by ECA Group
> <http://www.ecagroup.com>. ECA Group is the copyright owner of the
> contributed code.
> 
> The package also allows to build fastboot, adb and adbd daemon for the
> target.
> 
> Regarding adbd, the target is required to have the FunctionFS USB Gadget
> configuration. Then the following commands enable the use of adb:
>  # modprobe g_ffs idVendor=0x18d1 idProduct=0x4e42 \
>    iSerialNumber="buildroot"
>  # mkdir -p /dev/usb-ffs/adb
>  # mount -t functionfs adb /dev/usb-ffs/adb -o uid=2000,gid=2000
>  # adbd &
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

I wasn't very happy with this package due to the size of the patches,
and the fact that there is no real upstream to which we could submit
those patches. But I guess that's just how it is, and there's not much
we can do about it. And it's really a useful package.

So I've applied, after rebasing on master and fixing the Config.in.host
prompt, as you noted during the review.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
