From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 12:34:12 +0200
Subject: [Buildroot] [PATCH v2] board: added support for Raspberry Pi
 Zero W
In-Reply-To: <20170622222900.6ec535ed@gmx.net>
References: <1498077584-19344-1-git-send-email-yves.deweerdt.linux@gmail.com>
 <20170621224648.44373a00@windsurf> <20170622222900.6ec535ed@gmx.net>
Message-ID: <e93fbd33-3994-7542-5ca5-bd84d98efa75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-06-17 22:29, Peter Seiderer wrote:
> Hello Thomas, Yves,
>
> On Wed, 21 Jun 2017 22:46:48 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>
>> Hello,
>>
>> On Wed, 21 Jun 2017 22:39:44 +0200, Yves Deweerdt wrote:
>>> added a new config file for the Raspberry Pi Zero W (rpi0w)
>>> - added new folder for raspberrypi0w
>>> - included the overlays in the genimage config
>>> - add pi3-miniuart-bt overlay to the config
>>> - remove rpi0w device tree from the raspberrypi0_defconfig and genimage
>>>
>>> Signed-off-by: Yves Deweerdt <yves.deweerdt.linux@gmail.com>
>> I'd like a review/ack from Peter Seiderer, or other RPi folks of the
>> Buildroot community. I think the commit log should summarize why the
>> Zero W support is removed from raspberrypi0_defconfig, and why a
>> separate defconfig is needed.
>>
> The remaining difference between raspberrypi0_defconfig raspberrypi0w_defconfig
> wil be the usage of the pi3-miniuart-bt overlay. As there is no possibility to
> enable/disable this on demand I think this is enough to justify a second
> configuration (and keep the 'better' ttyAMA0 usage for serial console for
> the basic raspberrypi0)...

?Since indeed there is no convenient way to support two similar-but-different
boards with a single defconfigs, I've applied to master, thanks. I did make the
following changes though:
???? - Bump to same kernel version as raspberrypi0.
???? - Remove redundant comment.
???? - Remove redundant default BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS=y.
???? - Improve commit log.
???? - Refresh .gitlab-ci.yml.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
