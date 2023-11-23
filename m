Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE9EC27C40
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 01:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C380340128;
	Thu, 23 Nov 2023 01:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C380340128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oge66T8VcuWF; Thu, 23 Nov 2023 01:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCC27408F7;
	Thu, 23 Nov 2023 01:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC27408F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC4D71BF479
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 01:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D12A5408F7
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 01:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D12A5408F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgzBEaIgpIkG for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 01:27:45 +0000 (UTC)
Received: from out203-205-251-53.mail.qq.com (out203-205-251-53.mail.qq.com
 [203.205.251.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC27E40155
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 01:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC27E40155
Received: from smtpclient.apple ([183.173.152.217])
 by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
 id 5963647A; Thu, 23 Nov 2023 09:22:22 +0800
X-QQ-mid: xmsmtpt1700702542tyfv0lvwp
Message-ID: <tencent_DE40A3F1DD57B325D9A6C37F68893E470206@qq.com>
X-QQ-XMAILINFO: NssJ/YX50roaHFx0pwfFNe7AHqcNmLloqP8dNmljbyryA1jgVL4qUIy6UtwHuO
 wc+0vZeQ3ai0F4F+xj6ff2qghsqCyicJQyP8SslASFpcmQaSXfyaygjZips71HnH1Vsqr+ymB/2P
 EsPieM0jo6VjIxgxtguOEoOuZnZOfOLergNbiblTmrBjjTtx4mGQNjzhKT0z4ogIo1fzWH6QE0z3
 5ED0fj7/Fll/3Lj+2P9Zso1OWcnfyDyzdTglhzfTiMIh4MTybR5fWPQM5QtcvZq/kFwnkL89AqC3
 2lYwVcM616IILjr2Ceql3g7U82wvt3DZwa9DqJKZG+hHsWP17tGGBwwWNGBlGg/ljd6mEFdGFdm8
 AjeJcb6/yxCHANIe3cPDuWfLcrSJlSDaGQdhVEphA9JEzYYE/eIHk86kT4pESXBwtf1iSevLjP8I
 Fc3pjmNGbPIvcAa0CIjQ5RD72yrbZ3+NU8QKsVdOqEUDt1XXTGxSDvZlEHWUZ3F/jkhk8QTNZtPv
 wygeKMuKxJ27BEBe/6kYV/1uCo+WEqTLUMfWnkVpB1Ouq1ri8h9IgRxm9uYwHdDX1NL3Q85ar8pb
 0dBobcLnP9iGZRlJyaT8PL2VC0wlSVGcFXKii3/mEJiky3Ldf/MWP7WROAlH45JZvasCozxhhrAf
 eK5pMB0WTjj9OSVMBiofNSP5YfxdX3jbloOMDTPDLg/ypotVmBeK6MAN/JGIHKPClV11rK2fpKW9
 odGbSZ8+ZMwlUvDmPpWB/0uQZY1oV/nsY7aYLWBImY4/nIY5g7mrRzf86pgaiJClLJNmVXonryVR
 KXpbniaTodGyR4fD9XOF9miIRUL28JrhmWWkbFg6tQEN5FwHNGiJ2mLKWxYPEvEqH56GTELchHS4
 TFgOs0rhT0q4Cw2mx2Ta286zCe9PdXpX1OeHz3KpdQVLXwZutDXP+pKRru0+cwdPbmkPwv4uoAV3
 lh3xhHaIWzfOG1psfrtdkuUigCs5zH6Dzb7G64OYqj/K7mEdlMSWKgkT1OtTcvLrG3hkakb6GpR5
 IObCygXTmThjpQrmqyEJNRRZjiqb0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-OQ-MSGID: <BFEBD512-A6F2-4C97-B3C2-B8969946BE82@qq.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Date: Thu, 23 Nov 2023 09:22:11 +0800
In-Reply-To: <781f37c6-6bf0-4214-8e33-c3ef51929172@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
References: <tencent_3E8054E385AF0DCBE94DC17FAD12060E6707@qq.com>
 <6f2a8850-7610-4e6b-bc50-43394f6c2eeb@mind.be>
 <tencent_D458CE6C52FEF7947073D400B41A737C190A@qq.com>
 <781f37c6-6bf0-4214-8e33-c3ef51929172@mind.be>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qq.com; s=s201512; 
 t=1700702545; bh=kahTMbyDqKXqHmJgw6MNwVBVvQiECWbdlGQkhXotbo0=;
 h=From:Subject:Date:In-Reply-To:Cc:To:References;
 b=H/GYYYqAkdJKG+pE4YdN1yDZlq2rsufHnpVmHH7gwARfdyNiXr/g8g3TAyST0XpEK
 5tXT2WxJlZbvncVQ+7SldjDCvbiUFbXJUi8qyd0VG2ztNmXjkowCREijljFdgaJq04
 1H8pP3QGOqZGsxVaqnQFYuCFia6IlKoHmojqdK/s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=H/GYYYqA
Subject: Re: [Buildroot] [PATCH 1/2] configs/milkv_duo: new defconfig
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
From: hanyuan via buildroot <buildroot@buildroot.org>
Reply-To: hanyuan <hanyuan-z@qq.com>
Cc: Emil S <emil.soltys@outlook.com>, GP Orcullo <kinsamanka@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2678311644986184109=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2678311644986184109==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C0DCF6F0-03CD-461D-B172-DFB37888DC32"


--Apple-Mail=_C0DCF6F0-03CD-461D-B172-DFB37888DC32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello Arnout,

> 2023=E5=B9=B411=E6=9C=8823=E6=97=A5 04:19=EF=BC=8CArnout Vandecappelle =
<arnout@mind.be> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
> On 22/11/2023 04:47, hanyuan wrote:
>> Hello Arnout,
>> Thanks for your patience and careful review! Let me explain something =
you requested.
>>> Buildroot defconfigs should be _minimal_, i.e. just enough to boot =
the device and perhaps get a (wired) network connection. Looking at all =
those files, clearly these defconfigs are _not_ minimal. I think pretty =
much everything in the overlay can be removed.
>>> Nice trick to save the random MAC address that is generated on first =
boot, but we don't include such things in the minimal defconfig, =
especially if it's not board specific.
>>> This USB stuff is also not board-specific, is just generic USB =
gadget configuration. It might make sense to create a Buildroot package =
with those scripts though.
>> I think the digest of the changes is requesting us to remove the =
unnecessary things such as the packages we use in the defconfig and =
files in the overlay. I am sorry for my previous misunderstanding of =
your minimal philosophy. The reason I did them is that I want to let the =
system we build could be nearly the same as the official image. And the =
features are mainly about the USB RNDIS or other multiplex functions.
>> Now I plan to remove the whole overlay folder and move our files =
which give the features into a new package (e.g. named =
BR2_PACKAGE_MILKV_DUO_USB_TOOLS). Could you please give me a review on =
that?
>=20
> As I wrote somewhere in my review (but you didn't include it below), I =
think the script that toggles the USB hub host/gadget mode is still =
relevant, because that is something board specific. The rest of the =
overlay indeed can be removed, I think.
>=20
> About BR2_PACKAGE_MILKV_DUO_USB_TOOLS: as far as I could see, those =
scripts are not at all board-specific, they simply configure the generic =
gadget functions. So the package name doesn't need to have milkv-duo in =
it. Perhaps
> initscripts-usb-gadget ?
>=20
> I'm not entirely sure if it is appropriate to be part of Buildroot =
anyway, it would be more appropriate in its own repository. But then =
again, if we have it in Buildroot itself, we can maintain it =
independently.

In fact, all the scripts concerning USB in the previous overlay are all =
board specific, to some extent. Please take a look at the following =
lines:

${DUO_WRITE} host > /proc/cviusb/otg_role
CVI_DIR=3D/tmp/usb
CVI_GADGET=3D$CVI_DIR/usb_gadget/cvitek
# Set the USB configuration
mkdir $CVI_GADGET/configs/c.1
mkdir $CVI_GADGET/configs/c.1/strings/0x409
${DUO_WRITE} =
"config1">$CVI_GADGET/configs/c.1/strings/0x409/configuration

We could have two strategies. Firstly, if we think they are relevant and =
want to keep something in the overlay, let=E2=80=99s compress the files =
into one single big script. And do I have other alternatives of =
/usr/bin? I don=E2=80=99t want to move the USB initial scripts into the =
user=E2=80=99s PATH. Secondly, we import the package =
BR2_PACKAGE_MILKV_DUO_USB_TOOLS. The USB functions are not must for a =
minimal system to run. However, if we use these shell scripts, by =
default the USB rndis will be up, allowing us to login through ssh by a =
usb cable. If not, we have to use the serial port. What do you think, =
overlay or package?

>=20
> Note that this initscripts-usb-gadget package will probably take a few =
more iterations before it gets accepted as well. So probably best to =
submit it separately from the reset of this series. Here are a few hints =
already that can help to make sure the initial submission is as good as =
possible.
>=20
> - Configuration should be in /etc/default.
> - Helper scripts should be in /usr/bin.
> - Use <PKG>_LINUX_CONFIG_FIXUPS to enable the required configs in the =
kernel.
> - The package should probably depend on !BR2_INIT_SYSTEMD.
> - Make sure to follow the init script skeleton (but I think you =
already did that).

If we do use the package to provide the USB function, I highly hope that =
it could be named milkv-duo, which will be convenient because we could =
directly move our code into it. And we will not have the need to make it =
general.

>=20
>>> I didn't understand this... Is the idea to avoid rewriting the =
entire SD card? Doesn't seem very useful to me, the SD card image is =
pretty small so it should flash fast, especially with `dd conv=3Dsparse`.
>> OK. I will remove it.
>>> 64M? Really? Shouldn't a few MB be sufficient?
>> Yes, certainly sufficient. I will change.
>>> Drop this partition, there is no need for it (see also below).
>> OK. I will refactor the whole file.
>>> There's also an Upstream: link missing.
>> Is the Upstream a must? I have found many patches in buildroot do not =
have this.
>=20
> The Upstream: tag is a must, check-package complains if it's not =
there. We require it exactly to motivate people to send their patches =
upstream. We want it upstream for two reasons: we don't want to maintain =
patches, and often upstream is better positioned to review the patches. =
The latter certainly applies to the OpenSBI patches.

Could I use a customed repo to avoid use patches? The upstream is still =
a big work in progress. I could not give an upstream tag currently. We =
hope to let our users have a taste of buildroot quickly.

>=20
>=20
>>> Both conditions are set in both defconfigs, so there probably isn't =
a need to check for them.
>> I think we still need to check the conditions. Because the user might =
change them. If not checked, the error will occur and stop the whole =
make process.
>=20
> Well, if the user changes them, they probably shouldn't be using this =
post-image script either, right?

Oh yes, you are right. Thanks for pointing it out!

>=20
>=20
>>> Please use tab for indentation in shell scripts. It's not yet done =
consistently, but we're trying to go in that direction.
>> OK. I am always happy to follow your format.
>>> Actually, I think it's better to check for the existence of this =
file to decide whether or not to include the smallcore image.
>> To me, maybe we can ignore this? If the user request the smallcore, =
and actually the smallcore image does not exist, then the fiptool.py =
will emit an error. If we just include the smallcore as long as the =
image exists, I think it might not be aligned with the user=E2=80=99s =
expect.
>=20
> The point is that the user may have its own alternative firmware for =
the smallcore image and just install that in BINARIES_DIR.
>=20
> That said, the post-{build,image} scripts of defconfigs just need to =
work for the defconfig, there's no need to make them too generic for =
custom use cases. So just checking the config options is fine.

Got that. Thanks!

>=20
>=20
>>> Does it really have to be musl? Our defconfigs normally use uClibc.
>> I also think there=E2=80=99s no need for musl. However, the official =
sdk is using musl. So I have to use musl to keep the consistency.
>=20
> Yeah, our defconfigs use uClibc unless there's a good reason not to.
>=20
>>>> +BR2_GCC_VERSION_13_X=3Dy
>>>=20
>>> Please use the default GCC version; if that is not appropriate, add =
a comment why.
>>>=20
>>>> +BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy
>>>> =
+BR2_TARGET_LDFLAGS=3D"-march=3Drv64imafdc_xtheadba_xtheadbb_xtheadbs_xthe=
adcmo_xtheadcondmov_xtheadfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemi=
dx_xtheadmempair_xtheadsync"
>>>=20
>>> Wow, this definitely needs some explanation!
>>>=20
>>> Oh, hang on, it's using that non-standard T-Head CPU, that explains =
it... And it also explains why you need GCC 13. I'm surprised though =
that it's sufficient to put it in LDFLAGS, don't you need it for =
compilation as well?
>>>=20
>>> I actually think we probably should have a riscv subarchitecture =
option for the T-Head, since there will be multiple boards using that =
SoC (including the BeagleV-Ahead).
>> Yes. You have already found our reasons of using gcc-13. However, =
here I do make a mistake. I plan to copy the -march into the =
BR2_TARGET_OPTIMIZATION, which will then be passed to TARGET_CFLAGS and =
TARGET_CXXFLAGS. I will comment these on the defconfig.
>=20
> Indeed, I thought it should be in BR2_TARGET_OPTIMIZATION. We have =
that for example in configs/snps_archs38_hsdk_defconfig.
>=20
> However, as I mentioned: it's probably better to create a RISC-V =
subarchitecture for T-Head. Something like:
>=20
> choice
>        prompt "Target Architecture Variant"
>        default BR2_riscv_g
>=20
> config BR2_riscv_g
>        bool "General purpose (G)"
> [...]
>=20
> config BR2_riscv_thead
> 	bool "T-Head <whatever it is>"
> 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
> 	select [...]
> 	help
> 	  T-Head <whatever it is> SoCs use an instruction set definition =
for the
> 	  <...> extension that was not yet accepted at the time the chip =
was
> 	  designed. Therefore, it needs a special compiler variant.
>=20
> config BR2_riscv_custom
>        bool "Custom architecture"
>        select BR2_RISCV_ISA_RVI
>=20
> endchoice
>=20
>=20
> and in arch/arch.mk.riscv:
>=20
> ifeq ($(BR2_riscv_thead),y)
> GCC_TARGET_ARCH =3D =
rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemid=
x_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync
> endif
>=20
>=20
> The above change should obviously be a separate patch as well.

This is totally beyond my control, haha, willing to contribute in the =
future.

>=20
>=20
>>> Although this firmware is probably not strictly needed for booting, =
I do think it's a good idea to include it, so you have a complete =
system. The readme.txt should point to some documentation of that =
FreeRTOS image however.
>> Nonono, this firmware is strictly needed for booting! Without this, =
we could not make the whole SD card image! The boot steps of the chip =
cv1800b is complex. The firmware produces fip.bin, which stores the =
fsbl, opensb,freertosi and the u-boot, and boot.sd, which is the kernel =
in actual. We include this firmware, to build the first stage boot =
loader, while involving the other binaries to give the two files. If the =
user is not saying Y to the firmware packages, the buildroot would only =
produce the rootfs.tar. The whole SD image will be produced if and only =
if the firmware packages are selected.
>=20
> OK.
>=20
>>> If you don't include all those packages, the default 60M should be =
sufficient.
>> OK. I will strictly imitate other board=E2=80=99s config. Make sure =
most things are default.
>>> There normally shouldn't be any reason to set this option.
>> Does this option mean the HOST CMAKE?
>=20
> Yes, but host-cmake is built automatically when it's needed, so you =
normally don't need to enable the config option. It's only needed if you =
want to build an SDK which includes cmake, which is not the case in a =
defconfig.

Got it. Sorry for my misunderstanding.


Thanks again for your kindly help and careful review!

Best regards,
Hanyuan


--Apple-Mail=_C0DCF6F0-03CD-461D-B172-DFB37888DC32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Hello =
Arnout,<div><div><br><blockquote type=3D"cite"><div>2023=E5=B9=B411=E6=9C=88=
23=E6=97=A5 04:19=EF=BC=8CArnout Vandecappelle &lt;arnout@mind.be&gt; =
=E5=86=99=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div><meta charset=3D"UTF-8"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">On 22/11/2023 04:47, hanyuan =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;">Hello Arnout,<br>Thanks for your patience and =
careful review! Let me explain something you requested.<br><blockquote =
type=3D"cite">Buildroot defconfigs should be _minimal_, i.e. just enough =
to boot the device and perhaps get a (wired) network connection. Looking =
at all those files, clearly these defconfigs are _not_ minimal. I think =
pretty much everything in the overlay can be removed.<br>Nice trick to =
save the random MAC address that is generated on first boot, but we =
don't include such things in the minimal defconfig, especially if it's =
not board specific.<br>This USB stuff is also not board-specific, is =
just generic USB gadget configuration. It might make sense to create a =
Buildroot package with those scripts though.<br></blockquote>I think the =
digest of the changes is requesting us to remove the unnecessary things =
such as the packages we use in the defconfig and files in the overlay. I =
am sorry for my previous misunderstanding of your minimal philosophy. =
The reason I did them is that I want to let the system we build could be =
nearly the same as the official image. And the features are mainly about =
the USB RNDIS or other multiplex functions.<br>Now I plan to remove the =
whole overlay folder and move our files which give the features into a =
new package (e.g. named BR2_PACKAGE_MILKV_DUO_USB_TOOLS). Could you =
please give me a review on that?<br></blockquote><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">As I =
wrote somewhere in my review (but you didn't include it below), I think =
the script that toggles the USB hub host/gadget mode is still relevant, =
because that is something board specific. The rest of the overlay indeed =
can be removed, I think.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">About =
BR2_PACKAGE_MILKV_DUO_USB_TOOLS: as far as I could see, those scripts =
are not at all board-specific, they simply configure the generic gadget =
functions. So the package name doesn't need to have milkv-duo in it. =
Perhaps</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">initscripts-usb-gadget =
?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">I'm not entirely sure if =
it is appropriate to be part of Buildroot anyway, it would be more =
appropriate in its own repository. But then again, if we have it in =
Buildroot itself, we can maintain it independently.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div><div>In fact, all the scripts =
concerning USB in the previous overlay are all board specific, to some =
extent. Please take a look at the following =
lines:</div><div><br></div><div>${DUO_WRITE} host &gt; =
/proc/cviusb/otg_role</div><div><div>CVI_DIR=3D/tmp/usb</div><div>CVI_GADG=
ET=3D$CVI_DIR/usb_gadget/cvitek</div></div><div><div># Set the USB =
configuration</div><div>mkdir $CVI_GADGET/configs/c.1</div><div>mkdir =
$CVI_GADGET/configs/c.1/strings/0x409</div><div>${DUO_WRITE} =
"config1"&gt;$CVI_GADGET/configs/c.1/strings/0x409/configuration</div><div=
><br></div></div><div>We could have two strategies. Firstly, if we think =
they are relevant and want to keep something in the overlay, let=E2=80=99s=
 compress the files into one single big script. And do I have other =
alternatives of /usr/bin? I don=E2=80=99t want to move the USB initial =
scripts into the user=E2=80=99s PATH. Secondly, we import the package =
BR2_PACKAGE_MILKV_DUO_USB_TOOLS. The USB functions are not must for a =
minimal system to run. However, if we use these shell scripts, by =
default the USB rndis will be up, allowing us to login through ssh by a =
usb cable. If not, we have to use the serial port. What do you think, =
overlay or package?</div><br><blockquote type=3D"cite"><div><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Note that this initscripts-usb-gadget =
package will probably take a few more iterations before it gets accepted =
as well. So probably best to submit it separately from the reset of this =
series. Here are a few hints already that can help to make sure the =
initial submission is as good as possible.</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">- =
Configuration should be in /etc/default.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">- =
Helper scripts should be in /usr/bin.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">- Use =
&lt;PKG&gt;_LINUX_CONFIG_FIXUPS to enable the required configs in the =
kernel.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">- The package should =
probably depend on !BR2_INIT_SYSTEMD.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">- Make =
sure to follow the init script skeleton (but I think you already did =
that).</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div><div>If we do use the package =
to provide the USB function, I highly hope that it could be named =
milkv-duo, which will be convenient because we could directly move our =
code into it. And we will not have the need to make it =
general.</div><br><blockquote type=3D"cite"><div><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite">I didn't understand =
this... Is the idea to avoid rewriting the entire SD card? Doesn't seem =
very useful to me, the SD card image is pretty small so it should flash =
fast, especially with `dd conv=3Dsparse`.<br></blockquote>OK. I will =
remove it.<br><blockquote type=3D"cite">64M? Really? Shouldn't a few MB =
be sufficient?<br></blockquote>Yes, certainly sufficient. I will =
change.<br><blockquote type=3D"cite">Drop this partition, there is no =
need for it (see also below).<br></blockquote>OK. I will refactor the =
whole file.<br><blockquote type=3D"cite">There's also an Upstream: link =
missing.<br></blockquote>Is the Upstream a must? I have found many =
patches in buildroot do not have this.<br></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">The Upstream: tag is a must, check-package =
complains if it's not there. We require it exactly to motivate people to =
send their patches upstream. We want it upstream for two reasons: we =
don't want to maintain patches, and often upstream is better positioned =
to review the patches. The latter certainly applies to the OpenSBI =
patches.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div><div>Could I use a customed =
repo to avoid use patches? The upstream is still a big work in progress. =
I could not give an upstream tag currently. We hope to let our users =
have a taste of buildroot quickly.</div><br><blockquote =
type=3D"cite"><div><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite">Both conditions are =
set in both defconfigs, so there probably isn't a need to check for =
them.<br></blockquote>I think we still need to check the conditions. =
Because the user might change them. If not checked, the error will occur =
and stop the whole make process.<br></blockquote><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Well, =
if the user changes them, they probably shouldn't be using this =
post-image script either, right?</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"></div></blockquote><div><br></div><div>Oh yes, =
you are right. Thanks for pointing it out!</div><br><blockquote =
type=3D"cite"><div><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite">Please use tab for =
indentation in shell scripts. It's not yet done consistently, but we're =
trying to go in that direction.<br></blockquote>OK. I am always happy to =
follow your format.<br><blockquote type=3D"cite">Actually, I think it's =
better to check for the existence of this file to decide whether or not =
to include the smallcore image.<br></blockquote>To me, maybe we can =
ignore this? If the user request the smallcore, and actually the =
smallcore image does not exist, then the fiptool.py will emit an error. =
If we just include the smallcore as long as the image exists, I think it =
might not be aligned with the user=E2=80=99s expect.<br></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">The point is that the user may have its own =
alternative firmware for the smallcore image and just install that in =
BINARIES_DIR.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">That said, the =
post-{build,image} scripts of defconfigs just need to work for the =
defconfig, there's no need to make them too generic for custom use =
cases. So just checking the config options is fine.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div><div>Got that. =
Thanks!</div><br><blockquote type=3D"cite"><div><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite">Does it really have to =
be musl? Our defconfigs normally use uClibc.<br></blockquote>I also =
think there=E2=80=99s no need for musl. However, the official sdk is =
using musl. So I have to use musl to keep the =
consistency.<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Yeah, =
our defconfigs use uClibc unless there's a good reason not to.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><blockquote =
type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite"><blockquote =
type=3D"cite">+BR2_GCC_VERSION_13_X=3Dy<br></blockquote><br>Please use =
the default GCC version; if that is not appropriate, add a comment =
why.<br><br><blockquote =
type=3D"cite">+BR2_TOOLCHAIN_BUILDROOT_CXX=3Dy<br>+BR2_TARGET_LDFLAGS=3D"-=
march=3Drv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xthe=
adfmemidx_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheads=
ync"<br></blockquote><br>Wow, this definitely needs some =
explanation!<br><br>Oh, hang on, it's using that non-standard T-Head =
CPU, that explains it... And it also explains why you need GCC 13. I'm =
surprised though that it's sufficient to put it in LDFLAGS, don't you =
need it for compilation as well?<br><br>I actually think we probably =
should have a riscv subarchitecture option for the T-Head, since there =
will be multiple boards using that SoC (including the =
BeagleV-Ahead).<br></blockquote>Yes. You have already found our reasons =
of using gcc-13. However, here I do make a mistake. I plan to copy the =
-march into the BR2_TARGET_OPTIMIZATION, which will then be passed to =
TARGET_CFLAGS and TARGET_CXXFLAGS. I will comment these on the =
defconfig.<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Indeed, =
I thought it should be in BR2_TARGET_OPTIMIZATION. We have that for =
example in configs/snps_archs38_hsdk_defconfig.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">However, as I mentioned: it's probably =
better to create a RISC-V subarchitecture for T-Head. Something =
like:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">choice</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline =
!important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prompt "Target =
Architecture Variant"</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;default =
BR2_riscv_g</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">config =
BR2_riscv_g</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline =
!important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool "General =
purpose (G)"</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">[...]</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">config BR2_riscv_thead</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">bool "T-Head =
&lt;whatever it is&gt;"</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span class=3D"Apple-tab-span" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: pre; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;">	=
</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">select =
BR2_ARCH_NEEDS_GCC_AT_LEAST_13</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span class=3D"Apple-tab-span" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: pre; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;">	=
</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">select [...]</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">help</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;"><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;T-Head &lt;whatever =
it is&gt; SoCs use an instruction set definition for the</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;"><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&lt;...&gt; extension =
that was not yet accepted at the time the chip was</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;"><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;designed. Therefore, =
it needs a special compiler variant.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">config =
BR2_riscv_custom</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bool "Custom =
architecture"</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline =
!important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;select =
BR2_RISCV_ISA_RVI</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">endchoice</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">and in =
arch/arch.mk.riscv:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">ifeq =
($(BR2_riscv_thead),y)</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">GCC_TARGET_ARCH =3D =
rv64imafdc_xtheadba_xtheadbb_xtheadbs_xtheadcmo_xtheadcondmov_xtheadfmemid=
x_xtheadfmv_xtheadint_xtheadmac_xtheadmemidx_xtheadmempair_xtheadsync</spa=
n><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">endif</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">The above change should obviously be a =
separate patch as well.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"></div></blockquote><div><br></div><div>This is =
totally beyond my control, haha, willing to contribute in the =
future.</div><br><blockquote type=3D"cite"><div><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite">Although this firmware =
is probably not strictly needed for booting, I do think it's a good idea =
to include it, so you have a complete system. The readme.txt should =
point to some documentation of that FreeRTOS image =
however.<br></blockquote>Nonono, this firmware is strictly needed for =
booting! Without this, we could not make the whole SD card image! The =
boot steps of the chip cv1800b is complex. The firmware produces =
fip.bin, which stores the fsbl, opensb,freertosi and the u-boot, and =
boot.sd, which is the kernel in actual. We include this firmware, to =
build the first stage boot loader, while involving the other binaries to =
give the two files. If the user is not saying Y to the firmware =
packages, the buildroot would only produce the rootfs.tar. The whole SD =
image will be produced if and only if the firmware packages are =
selected.<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">OK.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite">If you don't include =
all those packages, the default 60M should be =
sufficient.<br></blockquote>OK. I will strictly imitate other board=E2=80=99=
s config. Make sure most things are default.<br><blockquote =
type=3D"cite">There normally shouldn't be any reason to set this =
option.<br></blockquote>Does this option mean the HOST =
CMAKE?<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Yes, =
but host-cmake is built automatically when it's needed, so you normally =
don't need to enable the config option. It's only needed if you want to =
build an SDK which includes cmake, which is not the case in a =
defconfig.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div><div>Got it. Sorry for my =
misunderstanding.</div><br></div><div><br></div><div>Thanks again for =
your kindly help and careful review!</div><div><br></div><div>Best =
regards,</div><div>Hanyuan</div><br></div></body></html>=

--Apple-Mail=_C0DCF6F0-03CD-461D-B172-DFB37888DC32--


--===============2678311644986184109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2678311644986184109==--

