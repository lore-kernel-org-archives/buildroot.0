Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ABCD5AE6C
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 07:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB2A66065F;
	Thu,  7 Nov 2024 07:10:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h76kttMe8T5t; Thu,  7 Nov 2024 07:10:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C679060BB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C679060BB0;
	Thu,  7 Nov 2024 07:10:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 174463B
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 07:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD6160BB1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 07:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDUyWFZ-ThYm for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 07:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=scdbackup@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73DA960619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73DA960619
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73DA960619
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 07:10:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from scdbackup.webframe.org ([91.8.162.244]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MLzBp-1tQkUD0fq5-00Uogm for <buildroot@buildroot.org>; Thu, 07 Nov 2024
 08:10:00 +0100
Date: Thu, 07 Nov 2024 08:09:19 +0100
To: buildroot@buildroot.org
References: <cb32292a0142d6f4e097385272e6fb83.squirrel@t-kindler.de>
In-Reply-To: <cb32292a0142d6f4e097385272e6fb83.squirrel@t-kindler.de>
Message-Id: <17085327765155587732@scdbackup.webframe.org>
X-Provags-ID: V03:K1:SSxRbOQ0TrvWtpI/Wy91CvvD29sM+SzMgFxKXiCK9fAbM6pQPlh
 tv9lxgp4K6B3PDzxaI3/0X2306h0Q/CWnT2K0/PKsaN2fbssX1OSv4X2F67LT+GkdwXquNe
 Hw27vWv6/vdZzmw2hRcbA/aV0yI0YCvLpH6QxQp1sX4C82wxrUXFX/EjQGwGFW8xfrEhibW
 CMo3XVZG+XZIoIJtCdL7w==
UI-OutboundReport: notjunk:1;M01:P0:egQbuwLI0NM=;PwacVF6Lfz6jhMsm4oMeJUvXZMm
 gEC5ImzQpccetdYA9B1iJo1BtTSRJw+xhFmt9AB1HSAoGXRsMyRnpS+Z5hho14vLp9IMAbO8N
 0SqzXRmd/bSv2A3vS6Fh9/+M2I0LNzS6+Yuj1mooTfY3ADcfPQk1uhoSoH3eIyqEgw6mMEV+t
 AmGf/WOpKstk9I3ZXlgNKMy5eL1GLGTrGTSZULnJnr0K2ENmnpnq8Q46pg6ZioYLBxa/xkNw6
 tmHbub6ldZuNaKtqryeuDXDVkVcEQawvK26AGAJdlky1AoMLR7MdDzBgZ6ibxQwx6uuxKkdjQ
 ZQ1zckxvKruee4K6cFRAB1ivdCbKHCzTxbBf+FsEUWSYBXl9iS30jg0+5MkCnu9Eup58qSuNH
 lcWQIUlUMO7dOU+UF9JG1d4H1hnkJpcWRe6W0F7pXKJA/0OUwlQZ7mW2o3Cyqbv1e9uHgHlqc
 7Ikm+RktBorEcpUjmGvAmzlW2NAaA8z2jStZNptx2NnmvxDvQ2vECTgo+SFOmUueWVjNXWB4j
 eLT9OZLTYnqtaPblRQcj7lHcJQIdC9vi5WXFHMVuRhmYDHR40YcMw7XHItFRs7Bq1mCB248+0
 /HE0rJLWgrZlvBdKh+40yDtStkLp2/vfHjfT8xR860NrGw2VcIqBj6RgMnziaa/MlAvOEK7ne
 Qde7iUDusy0JjKz6oTEM6apUJw9iEeuzHMxL1MysEzP3Vy0ILRlugAI5a3IMvWWKpE9H7pHXH
 x/ovPoiNIRXb6vC3EHLR4H5Gf3SRomeI/KLgQkYxYpRL+wMnOUdr9nZHRTumO4JzsMLJ6ekKN
 jiH1Fao+avOq59jnHUaKGD2wFGVr779sEbgtXFXMrbNLFo2BswM1zm8FGDB3bB05hj2i++Wnf
 2zrK4L8MBf98HDA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1730963400; x=1731568200; i=scdbackup@gmx.net;
 bh=a/qsZQPb6AfdxEFhS2HGSWyKe63ZadZ9KaHZ457Sb7g=;
 h=X-UI-Sender-Class:Date:From:To:Subject:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Message-Id:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=GZUd4AMOfJoCgExV3kacxUfLmZUQQOslDwvMtWltjLXDO5Loy9//qGGsv6mHOjmN
 +Xbal1jfk639wTxi5VBMKquzspdk6+M9eTjm8R1Zf4WK0Lm7no/xVRCpIm0qn3b8t
 I4lgsGth/NUrzbcwpdWJmc8pYRzwgXblu9OGR30YRiPjR+7WgTb4ydaDRknOF7UHw
 Myu0GQ/DHOBraepgm5hiFLflKIiYrKdlvf5q2f/fMFibpWmSml4tM/WeSgkW+vbId
 R5VgkBEVq+TL9VwxpIfFsDYVVU8k4gpCrKu8h3gQTY9WR7OfZ1Ri51VI47H2TrZGP
 Hgh+rmHe2sjewoyvSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=scdbackup@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=GZUd4AMO
Subject: Re: [Buildroot] Hybrid UEFI-Only CD-ROM image with systemd-boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Schmitt via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Schmitt <scdbackup@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

consider to Cc: bug-xorriso@gnu.org when asking xorriso questions.


> 1) How can I get xorriso to generate an image with only the EFI partition?

If all is in the EFI partition, you want GPT, and want to avoid nested
partitions, try with an appended partition attached to a minimal ISO with
a dummy file (here: README).

  # There is no need to have $BINARIES_DIR/cdrom

  echo "No payload data in this ISO 9660 filesystem" >README

  xorriso -as mkisofs \
      -o "$BINARIES_DIR"/cdrom.iso \
      -eltorito-catalog boot.cat \
      -appended_part_as_gpt \
      -partition_offset 16 \
      -append_partition 2 0xef "$BINARIES_DIR"/efi-part.vfat \
      -e --interval:appended_partition_2:all:: \
        -no-emul-boot \
      -no-pad \
      README

The resulting .iso then yields with fdisk -l something like:

  Disklabel type: gpt
  Disk identifier: 402F6C62-D96C-4257-B9A8-A4E20CD84888

  Device     Start   End Sectors Size Type
  cdrom.iso1    64   203     140  70K Microsoft basic data
  cdrom.iso2   204 20555   20352  10M EFI System

Partition 1 is mountable and represents the same ISO 9660 file tree
as the base device. (This comes at the expense of two superblocks
and two trees of directory records in the ISO.)

The EFI partition is outside of the ISO 9660 filesystem of partition 1.
Nevertheless the ISO 9660 filesystem of the base device claims the size
up to the end of partition 2.
So in the case of virtual CDROM, the EFI partition in its role as
El Torito boot image appears as hidden file of the CDROM's ISO 9660
filesystem.

  $ xorriso -indev cdrom.iso -report_el_torito plain
  ...
  El Torito catalog  : 49  1
  El Torito cat path : /boot.catalog
  El Torito images   :   N  Pltf  B   Emul  Ld_seg  Hdpt  Ldsiz         LBA
  El Torito boot img :   1  UEFI  y   none  0x0000  0x00  20352          51
  El Torito img blks :   1  5088


> 2) Shouldn't xorriso generate a GPT table? fdisk says "Disklabel type: dos"
>
> 3) Why do I need isohdpfx.bin and isolinux.bin at all?!
> I only want to support UEFI systems, and this seems to be legacy BIOS
> related?

You probably follow the Mac-less renarration of xorriso's implementation
of a Fedora isohybrid layout originally created by the ISOLINUX program
named "isohybrid":
  http://mjg59.dreamwidth.org/11285.html
  "Anatomy of a Fedora 17 ISO image"
  by Matthew Garret, May 2012

It works by an MBR partition table ("dos"), but also contains a GPT header
block (not announced by the MBR partition table). The GPT header has the
purpose to lure EFI firmwares which do not consider drives whithout GPT.
For some pre-EFI-but-already-x86 Macs there is an Apple Partition Map
with partitions pointing to the EFI image and a small HFS+ image.

Your xorriso run omits the production of the Apple partition map.
Debian uses a similar layout for its installation ISOs.
It yields good boot success but is hard to digest for partition editors.


Have a nice day :)

Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
