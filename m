From: Mylene Josserand <mylene.josserand@collabora.com>
Date: Thu, 9 Jul 2020 13:58:29 +0200
Subject: [Buildroot] [PATCH 0/3] board: Add support for LePotato
In-Reply-To: <20200707195158.GN2273@scaer>
References: <20200707075339.389528-1-mylene.josserand@collabora.com>
 <20200707195158.GN2273@scaer>
Message-ID: <e62ab57b-173b-016b-c170-7c8223abaaab@collabora.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 7/7/20 9:51 PM, Yann E. MORIN wrote:
> Myl?ne, All,
> 
> On 2020-07-07 09:53 +0200, Myl?ne Josserand spake thusly:
>> Here is my first version of this series that adds the support of the
>> board LePotato SBC from LibreComputer [1].
>>
>> This board uses FIP utilities [2][3] from AMLogic to sign u-boot.
> 
> Following the issues raised by Romain, I've marked patches 2-3 as
> "changes requested". Hopefully, gslimg is an interesting trail to follow
> as a free/libre replacement for the vendor stuff.

Sure, make sense, thanks!

> 
> I've applied patch 1 to master, thanks.

Thank you,

Best regards,
Myl?ne

> 
> Regards,
> Yann E. MORIN.
> 
>> The patch 02 is adding these FIP utilities as a host package. It is
>> available for different boards such as khadas-vim, some odroids, etc.
>> This package will copy the corresponding utilities, only for LePotato for
>> the moment, into the HOST_DIR/usr/bin. Currently, LePotato's ones are the
>> default ones. This should be updating once more boards are added.
>>
>> The patch 03 is adding the support of this board from LibreComputer:
>>     - one defconfig including a u-boot, kernel and minimal rootfs.
>>     The configuration is also enabling the FIP package for LePotato.
>>     - one post-build script that is using the FIP utilities to sign
>>     u-boot binary.
>>     - one post-image script to generate a sd-card image and flashing the
>>     signed u-boot on it.
>>     - a readme file to explain how to configure, compile and flash image
>>     for this board.
>>     - a boot.scr file including booti commands to run.
>>
>> Let me know if you have any comments on this series.
>>
>> Best regards,
>>
>> Myl?ne
>>
>> [1]: https://libre.computer/products/boards/aml-s905x-cc/
>> [2]: https://github.com/LibreELEC/amlogic-boot-fip
>> [3]: https://github.com/BayLibre/u-boot
>>
>> Myl?ne Josserand (3):
>>    DEVELOPERS: Update Mylene's email
>>    package: Add new fip package
>>    configs/lepotato: Add new defconfig
>>
>>   .gitlab-ci.yml                             |  1 +
>>   DEVELOPERS                                 |  4 +-
>>   board/librecomputer/lepotato/boot.cmd      |  6 +++
>>   board/librecomputer/lepotato/genimage.cfg  | 28 ++++++++++
>>   board/librecomputer/lepotato/post-build.sh | 61 ++++++++++++++++++++++
>>   board/librecomputer/lepotato/post-image.sh | 17 ++++++
>>   board/librecomputer/lepotato/readme.txt    | 35 +++++++++++++
>>   configs/lepotato_defconfig                 | 29 ++++++++++
>>   package/Config.in.host                     |  1 +
>>   package/fip/Config.in.host                 | 17 ++++++
>>   package/fip/fip.hash                       |  2 +
>>   package/fip/fip.mk                         | 30 +++++++++++
>>   12 files changed, 230 insertions(+), 1 deletion(-)
>>   create mode 100644 board/librecomputer/lepotato/boot.cmd
>>   create mode 100644 board/librecomputer/lepotato/genimage.cfg
>>   create mode 100755 board/librecomputer/lepotato/post-build.sh
>>   create mode 100755 board/librecomputer/lepotato/post-image.sh
>>   create mode 100644 board/librecomputer/lepotato/readme.txt
>>   create mode 100644 configs/lepotato_defconfig
>>   create mode 100644 package/fip/Config.in.host
>>   create mode 100644 package/fip/fip.hash
>>   create mode 100644 package/fip/fip.mk
>>
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
