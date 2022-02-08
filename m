Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C751C433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 17:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6CB060EFC;
	Tue,  8 Feb 2022 17:32:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7FPmL55xq4bm; Tue,  8 Feb 2022 17:32:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E04D60F05;
	Tue,  8 Feb 2022 17:32:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A81C11BF8C7
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 17:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9665C60EFA
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 17:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXQ3VbChF0nh for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 17:32:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.arcturusgroup.com (mx92.arcturusgroup.com [68.179.103.92])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D78960EF0
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 17:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.arcturusgroup.com (Postfix) with ESMTP id CC376CFB473;
 Tue,  8 Feb 2022 12:31:57 -0500 (EST)
X-Virus-Scanned: amavisd-new at arcturusgroup.com
Received: from mail.arcturusgroup.com ([127.0.0.1])
 by localhost (mail.arcturusgroup.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CS2iNp-l0bkG; Tue,  8 Feb 2022 12:31:56 -0500 (EST)
Received: from [192.168.1.80] (gw.arcturusgroup.net [66.11.68.6])
 by mail.arcturusgroup.com (Postfix) with ESMTPSA id E74C7CFB466;
 Tue,  8 Feb 2022 12:31:56 -0500 (EST)
Content-Type: multipart/mixed; boundary="------------ByykqOnQSsFefGBhavwy9ASo"
Message-ID: <fb40e506-9418-3389-8bb7-dbcd0ca1a3dd@arcturusnetworks.com>
Date: Tue, 8 Feb 2022 12:31:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot <buildroot@buildroot.org>
References: <4b667326-5aca-538b-9b36-7f0d5a400e9f@arcturusnetworks.com>
 <f7c3a3ba-721b-c02b-a0e0-d07538117fba@benettiengineering.com>
From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
In-Reply-To: <f7c3a3ba-721b-c02b-a0e0-d07538117fba@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/1] board/arcturus/aarch64-ucls1012a: bump
 u-boot and kernel version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Michael Durrant <mdurrant@arcturusnetworks.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--------------ByykqOnQSsFefGBhavwy9ASo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Giulio,

Thanks for the quick response and your notes.

New V2 patch file attached. The patches are based on today's `git clone 
https://git.buildroot.net/buildroot`.

Patches created with the options you suggested: `git format-patch -M -s 
-o . -1`

Unfortunately I can't send it now with 'git send-email --to "buildroot 
<buildroot@buildroot.org>" 0001-xxxx.patch`. If it doesn't work for you, 
we'll send it later.


Kind Regards,

Oleks


On 2/7/22 12:29, Giulio Benetti wrote:
> Hi Oleksandr,
>
> can you improve commit log? Looking at what you do below I see you do 
> more than just bumping u-boot and linux. Also please specify the 
> versions you're bumping to,
>
> On 07/02/22 16:53, Oleksandr G Zhadan wrote:
>> Signed-off-by: Oleksandr G Zhadan <oleks@ArcturusGroup.com>
>> Signed-off-by: Michael Durrant<mdurrant@arcturusnetworks.com>
>> ---
>>    board/arcturus/aarch64-ucls1012a/post-build.sh    |  2 --
>>    board/arcturus/aarch64-ucls1012a/readme.txt       |  8 ++++----
>>    .../rootfs_overlay/etc/init.d/S09modload          | 14 --------------
>>    configs/arcturus_ucls1012a_defconfig              | 15 
>> +++++++--------
>>    4 files changed, 11 insertions(+), 28 deletions(-)
>>    delete mode 100755
>> board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
>>
>> diff --git a/board/arcturus/aarch64-ucls1012a/post-build.sh
>> b/board/arcturus/aarch64-ucls1012a/post-build.sh
>> index f8ba78095f..ca3862988d 100755
>> --- a/board/arcturus/aarch64-ucls1012a/post-build.sh
>> +++ b/board/arcturus/aarch64-ucls1012a/post-build.sh
>> @@ -1,5 +1,3 @@
>>    #!/bin/sh
>>
>> -mkdir -p ${TARGET_DIR}/lib/firmware
>> -cp -f ${BUILD_DIR}/linux-custom/firmware/ppfe/* 
>> ${TARGET_DIR}/lib/firmware/
>>    cp -f ${BUILD_DIR}/linux-custom/br2-ucls1012a.its ${BINARIES_DIR}/
>> diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt
>> b/board/arcturus/aarch64-ucls1012a/readme.txt
>> index 483d5e9aef..f892fc4abc 100644
>> --- a/board/arcturus/aarch64-ucls1012a/readme.txt
>> +++ b/board/arcturus/aarch64-ucls1012a/readme.txt
>> @@ -23,14 +23,14 @@ Result of the build
>>    After building, you should obtain this tree:
>>
>>        output/images/
>> -    +-- arc-ucls1012a.dtb
>> -    +-- Image
>> +    +-- br2-ucls1012a.its
>> +    +-- Image.gz
>>        +-- part0-000000.itb
>>        +-- rootfs.cpio
>>        +-- rootfs.cpio.gz
>>        +-- rootfs.tar
>>        +-- u-boot.bin
>> -    +-- ucls1012a.its
>> +    +-- ucls1012a-som.dtb
>>
>>    Flashing
>>    --------
>> @@ -60,7 +60,7 @@ u-boot shell.
>>    4. Program the ITB image (includes Kernel, DTB and Ramdisk)
>>
>>        B$ tftp part0-000000.itb
>> -    B$ run iprogram
>> +    B$ run program0
>>
>>    5. Booting your new system
>>
>> diff --git
>> a/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
>> b/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
>> deleted file mode 100755
>> index c87ffda14f..0000000000
>> --- 
>> a/board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -#!/bin/sh
>> -#
>> -case "$1" in
>> -       start)
>> -                modprobe pfe
>> -                ;;
>> -        stop)
>> -                ;;
>> -        restart|reload)
>> -                ;;
>> -        *)
>> -                echo "Usage: $0 {start|stop|restart}"
>> -                exit 1
>> -esac
>
> Here you remove this file for modprobe() fpe, why? Can you elabore in 
> commit log?
>
>> diff --git a/configs/arcturus_ucls1012a_defconfig
>> b/configs/arcturus_ucls1012a_defconfig
>> index fd33ebf1f6..f544a5240a 100644
>> --- a/configs/arcturus_ucls1012a_defconfig
>> +++ b/configs/arcturus_ucls1012a_defconfig
>> @@ -1,24 +1,23 @@
>>    # Architecture
>>    BR2_aarch64=y
>>
>> -# Linux headers same as kernel, a 4.14 series
>> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>>
>>    # System settings
>>    BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
>>    BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
>>    BR2_SYSTEM_DHCP="eth0"
>> -BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs_overlay"
>>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/arcturus/aarch64-ucls1012a/post-build.sh"
>>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
>>
>>    # Kernel
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
>> github,ArcturusNetworks,uCLS1012A-kernel,v.20.31)/linux-v.20.31.tar.gz"
>> -BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
>> github,ArcturusNetworks,uCLS1012A-kernel,v.22.05)/linux-v.22.05.tar.gz"
>> +BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a_som"
>
> Here ^^^ you also change the defconfig name, another thing to add to 
> commit log and the reason
>
>> +BR2_LINUX_KERNEL_IMAGEGZ=y
>
> Here ^^^ you change to zImage, another thing to add to commit log
>
>>    BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/ucls1012a-som"
>>
>>    # Filesystem
>>    BR2_TARGET_ROOTFS_CPIO=y
>> @@ -28,8 +27,8 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
>>    BR2_TARGET_UBOOT=y
>>    BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>    BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>> -BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
>> github,ArcturusNetworks,uCLS1012A-uboot,v.20.31)/uboot-v.20.31.tar.gz"
>> -BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI128"
>> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call
>> github,ArcturusNetworks,uCLS1012A-uboot,v.22.05)/uboot-v.22.05.tar.gz"
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_SOM"
>
> Ditto
>
>>    # Tools
>>    BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>
> Also, which Buildroot version do you use to create patch?
> And which specific command do you use? I ask you this because patch 
> results malformed:
> ```
> patch -p1 < 
> ~/Downloads/1-1-board-arcturus-aarch64-ucls1012a-bump-u-boot-and-kernel-version.patch
> patching file board/arcturus/aarch64-ucls1012a/post-build.sh
> Hunk #1 succeeded at 1 with fuzz 2.
> patching file board/arcturus/aarch64-ucls1012a/readme.txt
> Hunk #1 FAILED at 23.
> Hunk #2 FAILED at 60.
> 2 out of 2 hunks FAILED -- saving rejects to file 
> board/arcturus/aarch64-ucls1012a/readme.txt.rej
> patching file 
> board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
> Reversed (or previously applied) patch detected!  Assume -R? [n]
> Apply anyway? [n]
> Skipping patch.
> 1 out of 1 hunk ignored -- saving rejects to file 
> board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload.rej
> patching file configs/arcturus_ucls1012a_defconfig
> patch: **** malformed patch at line 201: 
> github,ArcturusNetworks,uCLS1012A-kernel,v.20.31)/linux-v.20.31.tar.gz"
> ```
>
> I've tried applying with:
> git am xxx.patch
> and then with:
> patch -p1 < xxx.patch
>
> but that gave me the malformed patch error.
>
> Usually this is how I do:
> Rebase
> # git pull --rebase upstream master
> Create the patch assuming it is on top of the commits
> # git format-patch -M -s -o . -1
> Then I send it with:
> # git send-email --to "buildroot <buildroot@buildroot.org>" 
> 0001-xxxx.patch
>
> Can you please check? Because I want to give a build and check in 
> buildroot docker.
>
> Thank you!
>
> Best regards

-- 
Oleksandr Zhadan
oleks@arcturusnetworks.com
416.621.0125 x.235
}|{/\|)/\|-|

--------------ByykqOnQSsFefGBhavwy9ASo
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Buildroot-PATCH-V2-1-1-board-arcturus-aarch64-ucls10.patch"
Content-Disposition: attachment;
 filename*0="0001-Buildroot-PATCH-V2-1-1-board-arcturus-aarch64-ucls10.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3YTAzZjk3MWExNGE2MjJhMDUyYTI1MWU0YzNhNmE4NDc0YTk5NGQ2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGVrc2FuZHIgRyBaaGFkYW4gPG9sZWtzQEFyY3R1
cnVzR3JvdXAuY29tPgpEYXRlOiBUdWUsIDggRmViIDIwMjIgMTE6NTc6MzcgLTA1MDAKU3Vi
amVjdDogW1BBVENIXSBbQnVpbGRyb290XSBbUEFUQ0ggVjIgMS8xXSBib2FyZC9hcmN0dXJ1
cy9hYXJjaDY0LXVjbHMxMDEyYToKIGJ1bXAgdS1ib290IGFuZCBrZXJuZWwgdmVyc2lvbgoK
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFpoYWRhbjxvbGVrc0BhcmN0dXJ1c25ldHdvcmtz
LmNvbT4KU2lnbmVkLW9mZi1ieTogTWljaGFlbCBEdXJyYW50PG1kdXJyYW50QGFyY3R1cnVz
bmV0d29ya3MuY29tPgoKLS0tClYyOgotIEJ1bXAga2VybmVsIHRvICJMaW51eCB2ZXJzaW9u
IDUuNC4xMzciCi0gQm9vdGxvYWRlciB2ZXJzaW9uIHN0aWxsICJVLUJvb3QgMjAxOS4xMCIs
IGJ1dCBuZXcgdGFyZ2V0cyBhZGRlZC4KLSBSZW1vdmUgL2V0Yy9pbml0LmQvUzA5bW9kbG9h
ZCBzY3JpcHQgdG8gbG9hZCBwZmUgZmlybXdhcmUgbW9kdWxlCiAgYmVjYXVzZSBub3cgcGZl
IGZpcm13YXJlIG1vZHVsZSBsb2FkcyBieSBrZXJuZWwgaXRzZWxmCi0gTmV3IGNvbXByZXNz
ZWQgSW1hZ2UuZ3ogaXMgdXNlZAotLS0KClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBHIFpo
YWRhbiA8b2xla3NAQXJjdHVydXNHcm91cC5jb20+Ci0tLQogYm9hcmQvYXJjdHVydXMvYWFy
Y2g2NC11Y2xzMTAxMmEvcG9zdC1idWlsZC5zaCAgICAgfCAgMiAtLQogYm9hcmQvYXJjdHVy
dXMvYWFyY2g2NC11Y2xzMTAxMmEvcmVhZG1lLnR4dCAgICAgICAgfCAgNSArKystLQogLi4u
L3Jvb3Rmc19vdmVybGF5L2V0Yy9pbml0LmQvUzA5bW9kbG9hZCAgICAgICAgICAgfCAxNCAt
LS0tLS0tLS0tLS0tLQogY29uZmlncy9hcmN0dXJ1c191Y2xzMTAxMmFfZGVmY29uZmlnICAg
ICAgICAgICAgICAgfCAgOSArKysrLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAyMyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDc1NSBib2FyZC9hcmN0
dXJ1cy9hYXJjaDY0LXVjbHMxMDEyYS9yb290ZnNfb3ZlcmxheS9ldGMvaW5pdC5kL1MwOW1v
ZGxvYWQKCmRpZmYgLS1naXQgYS9ib2FyZC9hcmN0dXJ1cy9hYXJjaDY0LXVjbHMxMDEyYS9w
b3N0LWJ1aWxkLnNoIGIvYm9hcmQvYXJjdHVydXMvYWFyY2g2NC11Y2xzMTAxMmEvcG9zdC1i
dWlsZC5zaAppbmRleCBmOGJhNzgwOTVmLi5jYTM4NjI5ODhkIDEwMDc1NQotLS0gYS9ib2Fy
ZC9hcmN0dXJ1cy9hYXJjaDY0LXVjbHMxMDEyYS9wb3N0LWJ1aWxkLnNoCisrKyBiL2JvYXJk
L2FyY3R1cnVzL2FhcmNoNjQtdWNsczEwMTJhL3Bvc3QtYnVpbGQuc2gKQEAgLTEsNSArMSwz
IEBACiAjIS9iaW4vc2gKIAotbWtkaXIgLXAgJHtUQVJHRVRfRElSfS9saWIvZmlybXdhcmUK
LWNwIC1mICR7QlVJTERfRElSfS9saW51eC1jdXN0b20vZmlybXdhcmUvcHBmZS8qICR7VEFS
R0VUX0RJUn0vbGliL2Zpcm13YXJlLwogY3AgLWYgJHtCVUlMRF9ESVJ9L2xpbnV4LWN1c3Rv
bS9icjItdWNsczEwMTJhLml0cyAke0JJTkFSSUVTX0RJUn0vCmRpZmYgLS1naXQgYS9ib2Fy
ZC9hcmN0dXJ1cy9hYXJjaDY0LXVjbHMxMDEyYS9yZWFkbWUudHh0IGIvYm9hcmQvYXJjdHVy
dXMvYWFyY2g2NC11Y2xzMTAxMmEvcmVhZG1lLnR4dAppbmRleCA0ODNkNWU5YWVmLi5jYjkx
NzE2YjM0IDEwMDY0NAotLS0gYS9ib2FyZC9hcmN0dXJ1cy9hYXJjaDY0LXVjbHMxMDEyYS9y
ZWFkbWUudHh0CisrKyBiL2JvYXJkL2FyY3R1cnVzL2FhcmNoNjQtdWNsczEwMTJhL3JlYWRt
ZS50eHQKQEAgLTIzLDE0ICsyMywxNSBAQCBSZXN1bHQgb2YgdGhlIGJ1aWxkCiBBZnRlciBi
dWlsZGluZywgeW91IHNob3VsZCBvYnRhaW4gdGhpcyB0cmVlOgogCiAgICAgb3V0cHV0L2lt
YWdlcy8KKyAgICArLS0gSW1hZ2UuZ3oKICAgICArLS0gYXJjLXVjbHMxMDEyYS5kdGIKLSAg
ICArLS0gSW1hZ2UKKyAgICArLS0gYnIyLXVjbHMxMDEyYS5pdHMKICAgICArLS0gcGFydDAt
MDAwMDAwLml0YgogICAgICstLSByb290ZnMuY3BpbwogICAgICstLSByb290ZnMuY3Bpby5n
egogICAgICstLSByb290ZnMudGFyCiAgICAgKy0tIHUtYm9vdC5iaW4KLSAgICArLS0gdWNs
czEwMTJhLml0cworCiAKIEZsYXNoaW5nCiAtLS0tLS0tLQpkaWZmIC0tZ2l0IGEvYm9hcmQv
YXJjdHVydXMvYWFyY2g2NC11Y2xzMTAxMmEvcm9vdGZzX292ZXJsYXkvZXRjL2luaXQuZC9T
MDltb2Rsb2FkIGIvYm9hcmQvYXJjdHVydXMvYWFyY2g2NC11Y2xzMTAxMmEvcm9vdGZzX292
ZXJsYXkvZXRjL2luaXQuZC9TMDltb2Rsb2FkCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDc1NQpp
bmRleCBjODdmZmRhMTRmLi4wMDAwMDAwMDAwCi0tLSBhL2JvYXJkL2FyY3R1cnVzL2FhcmNo
NjQtdWNsczEwMTJhL3Jvb3Rmc19vdmVybGF5L2V0Yy9pbml0LmQvUzA5bW9kbG9hZAorKysg
L2Rldi9udWxsCkBAIC0xLDE0ICswLDAgQEAKLSMhL2Jpbi9zaAotIwotY2FzZSAiJDEiIGlu
Ci0gICAgICAgc3RhcnQpCi0gICAgICAgICAgICAgICAgbW9kcHJvYmUgcGZlCi0gICAgICAg
ICAgICAgICAgOzsKLSAgICAgICAgc3RvcCkKLSAgICAgICAgICAgICAgICA7OwotICAgICAg
ICByZXN0YXJ0fHJlbG9hZCkKLSAgICAgICAgICAgICAgICA7OwotICAgICAgICAqKQotICAg
ICAgICAgICAgICAgIGVjaG8gIlVzYWdlOiAkMCB7c3RhcnR8c3RvcHxyZXN0YXJ0fSIKLSAg
ICAgICAgICAgICAgICBleGl0IDEKLWVzYWMKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXJjdHVy
dXNfdWNsczEwMTJhX2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXJjdHVydXNfdWNsczEwMTJhX2Rl
ZmNvbmZpZwppbmRleCBmZDMzZWJmMWY2Li4yYTljMWUwNTgyIDEwMDY0NAotLS0gYS9jb25m
aWdzL2FyY3R1cnVzX3VjbHMxMDEyYV9kZWZjb25maWcKKysrIGIvY29uZmlncy9hcmN0dXJ1
c191Y2xzMTAxMmFfZGVmY29uZmlnCkBAIC0xLDIyICsxLDIxIEBACiAjIEFyY2hpdGVjdHVy
ZQogQlIyX2FhcmNoNjQ9eQogCi0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEg
NC4xNCBzZXJpZXMKLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNF8x
ND15CitCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfND15CiAKICMg
U3lzdGVtIHNldHRpbmdzCiBCUjJfVEFSR0VUX0dFTkVSSUNfSE9TVE5BTUU9InVjbHMxMDEy
YSIKIEJSMl9UQVJHRVRfR0VORVJJQ19JU1NVRT0iV2VsY29tZSB0byB1Q0xTMTAxMkEtU09N
IgogQlIyX1NZU1RFTV9ESENQPSJldGgwIgotQlIyX1JPT1RGU19PVkVSTEFZPSJib2FyZC9h
cmN0dXJ1cy9hYXJjaDY0LXVjbHMxMDEyYS9yb290ZnNfb3ZlcmxheSIKIEJSMl9ST09URlNf
UE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL2FyY3R1cnVzL2FhcmNoNjQtdWNsczEwMTJhL3Bv
c3QtYnVpbGQuc2giCiBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9hcmN0
dXJ1cy9hYXJjaDY0LXVjbHMxMDEyYS9wb3N0LWltYWdlLnNoIgogCiAjIEtlcm5lbAogQlIy
X0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMPXkKLUJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIs
QXJjdHVydXNOZXR3b3Jrcyx1Q0xTMTAxMkEta2VybmVsLHYuMjAuMzEpL2xpbnV4LXYuMjAu
MzEudGFyLmd6IgorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTF9MT0NBVElPTj0i
JChjYWxsIGdpdGh1YixBcmN0dXJ1c05ldHdvcmtzLHVDTFMxMDEyQS1rZXJuZWwsdi4yMi4w
NikvbGludXgtdi4yMi4wNi50YXIuZ3oiCiBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0i
dWNsczEwMTJhIgorQlIyX0xJTlVYX0tFUk5FTF9JTUFHRUdaPXkKIEJSMl9MSU5VWF9LRVJO
RUxfRFRTX1NVUFBPUlQ9eQogQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImFy
Y3R1cnVzL2FyYy11Y2xzMTAxMmEiCiAKQEAgLTI4LDcgKzI3LDcgQEAgQlIyX1RBUkdFVF9S
T09URlNfQ1BJT19HWklQPXkKIEJSMl9UQVJHRVRfVUJPT1Q9eQogQlIyX1RBUkdFVF9VQk9P
VF9CVUlMRF9TWVNURU1fS0NPTkZJRz15CiBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9UQVJC
QUxMPXkKLUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2Fs
bCBnaXRodWIsQXJjdHVydXNOZXR3b3Jrcyx1Q0xTMTAxMkEtdWJvb3Qsdi4yMC4zMSkvdWJv
b3Qtdi4yMC4zMS50YXIuZ3oiCitCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9UQVJCQUxMX0xP
Q0FUSU9OPSIkKGNhbGwgZ2l0aHViLEFyY3R1cnVzTmV0d29ya3MsdUNMUzEwMTJBLXVib290
LHYuMjIuMDYpL3Vib290LXYuMjIuMDYudGFyLmd6IgogQlIyX1RBUkdFVF9VQk9PVF9CT0FS
RF9ERUZDT05GSUc9IlVDTFMxMDEyQV9RU1BJMTI4IgogCiAjIFRvb2xzCi0tIAoyLjI2LjIK
Cg==

--------------ByykqOnQSsFefGBhavwy9ASo
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--------------ByykqOnQSsFefGBhavwy9ASo--
