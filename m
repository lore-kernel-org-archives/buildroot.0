Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D9CD5E14A
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 09:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 795E38051C;
	Fri,  8 Nov 2024 09:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZ4NBmGV2JSQ; Fri,  8 Nov 2024 09:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73F16841CF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73F16841CF;
	Fri,  8 Nov 2024 09:29:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3985C0
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 09:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FD2043144
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 09:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inylrdEdBoqY for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 09:29:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=scdbackup@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F8DD40A1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F8DD40A1A
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F8DD40A1A
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 09:29:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from scdbackup.webframe.org ([91.8.162.244]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MUXpQ-1tI6iD0yA4-00SzDp; Fri, 08 Nov 2024 10:29:17 +0100
Date: Fri, 08 Nov 2024 10:28:39 +0100
To: buildroot@buildroot.org
Cc: bug-xorriso@gnu.org
References: <e4ff0043cbc2eb1d80af5faa967403dc.squirrel@t-kindler.de>
In-Reply-To: <e4ff0043cbc2eb1d80af5faa967403dc.squirrel@t-kindler.de>
Message-Id: <30626327742203582750@scdbackup.webframe.org>
X-Provags-ID: V03:K1:uci7XwpMbTuqN0qq7sk/fmdS4cC8gbgxA1LFuLF7NuI8CcAUtUK
 aayxpx/lsvxOrFDKP4UIGfZ+K8duLc3UagnHfIF3jiAynir1EO3AB9PZ3jZdb86TPJ0qQjv
 cm2Zl0oZxxSjaxkB03fuEDYj6Dymr0vnaULqkuWpgoYGfwdChbL0MgqbpltsksChpSzyBMD
 8kv/SJS2rh8ucypkRGUVA==
UI-OutboundReport: notjunk:1;M01:P0:MgD0kIDR1lU=;GM3IQbPSHlBqSoRfwVwkdDF9HhU
 sJdwVTOHIIKiFkGR57X0DE4KOHLK2292Gw3HajhGDWFTjfFJk3FxFrfaD7RaOIti3TSxn4umH
 Cf26fPtL9VxLalwIJUOBMJARTpT35tCwHCHNSLbuA01/M0Lm4XyjQ6/vG4FWq+ujA17uk9ABP
 zfKzXLnojT5Z4ndqNGn/TBwZsCE8AOULICmMSf0Gg3EHRQRVazEru9uh65JbcDEchAMomU+8F
 oQWJvESC9LL4DK8ZCNmIdIR0szTUggmN6InXEWuxaSZHx/TuIfgPVz3WntuVp8vuRvqidS+Fm
 Kz2lZ7g7sQsLM5P9fHGTpM5KtyBxbWGqP+cr9j4s4d7lbkwZ6YSdZqEo0zXFPzuCByeSPZrJS
 Q71bvF/5Qb4KTfyUHA6Qaxy/mJFJeHeDptGsk7dw2Q5fISu6uppqmbKp4X5WW0szbOO3JTnzX
 esQ6FKNUUXvdQnJ4LC0zi+75qE7HCbvynNv/UW95KaUYsvIfyGiXolyVjEAsP5fDFcGgzwx6Z
 lqvnElui9MqopCX4IFpHFrZbM6yjR6kOj8QPBTilTOJKOr54K2tAHmjIqZwc3TSc68nYOgOFe
 3C+N9e9pF69ib+7SoHxFjsU8RglKlGVWQyyJe8dLA74sB+UKYKiJHvTjdOJWYfdr5z/w1WN45
 Fpft98KG7733MciOvGEXG1WR31+FREuWKHiFkTNr9SebrENKvPklIdeOW/fdmQv3A5aIHiQlc
 uSXeJ4+QcqpnjnAj1kvmGLPQ0ofiB+YPgUzaVGkqg4XPoL9xOjUmuJXtBRN6sP5YFjUt1jPj4
 /r71Wb0WM90zeSTKpNjedeTnFgLfSAozqAquiqagVDdSjAVQkNdaQFEpzEzMGYeyffwEgeqYB
 H0rGYd8RjOeaCKenKMcceNFLeU/Gk3Yv8aelIEGdk8FSTIHnOLU2nXmxU8DYDoU7gmrTm5vB7
 kyWIDpsmI+Dfogb/yVxVlDodd1I=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1731058157; x=1731662957; i=scdbackup@gmx.net;
 bh=8uCF0N0GGskZfG6ZHa/8sQGcjDzMTg73SZzOlyTn6dM=;
 h=X-UI-Sender-Class:Date:From:To:Subject:Content-Type:
 Content-Transfer-Encoding:Cc:References:In-Reply-To:Message-Id:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ESuFSZ9BplSX+KB1ogp1yWgyBspV/FAA4J/bwgQaPkAZFuo0V5FZEmjomBKz15FS
 m0VZPk8gOBZjliaJDxL9ib33AokjDBxY2kl3eGfbsw9+TZQeycTVA1ZQG8u69XJNr
 TDSie2t1In2ZcI5HERfDSLvqK/+FxEslZYIpXah4+e4/9mhfAiIgAtTNl81PLqUlP
 LDfj9xn8VhKuAcrdJsK1imgTYJFZ3kAZUDFhFHHYKmMAWQtXZkXIiicqystEZ/Uas
 3OIiHqGnkZln64fkhvI1lVFogJLIIf5E9rT0BU/sC0Cf+PlYwcdvF1lMGfuB2fNcy
 zwcH13t+XD+38SzJjA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=scdbackup@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=ESuFSZ9B
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

Thomas Kindler wrote:
> Is there a way to generate only one partition?

Not with GPT.
The man page promises this to happen with -append_partition 1 for MBR
partitions. But this does not work with GPT partitions.
man 1 xorriso:

  -append_partition partition_number type_code disk_path
      ...
      With MBR:
      partition_number may be 1 to 4. Number 1 will put the whole  ISO
      image  into  the unclaimed space before partition 1.
      ...
      GPT can be forced by
        -boot_image "any" "appended_part_as=gpt"
      partition_number may  be  1  to  8.  But  other  than  with  MBR
      partitions it is not guaranteed that the resulting GPT partition
      will have this number.
      More important than the desired partition number  will  be  that
      the resulting ISO filesystem is covered gaplessly with GPT table
      and its partitions and that the  partitions  in  the  table  are
      sorted  by block address.

(-boot_image "any" "appended_part_as=gpt" is in the native command set of
 xorriso the equivalent of -as "mkisofs" option -appended_part_as_gpt.)

Experiments:

  xorriso -as mkisofs \ -o "$BINARIES_DIR"/cdrom.iso \
  -eltorito-catalog boot.cat \
  -appended_part_as_gpt \
  -partition_offset 16 \
  -append_partition 1 0xef "$BINARIES_DIR"/efi-part.vfat \
  -e --interval:appended_partition_1:all:: \
  -no-emul-boot \
  -no-pad \
  README

still yields with fdisk:

  Disklabel type: gpt
  Disk identifier: 02ACD30B-A5C2-47E6-8273-DA83B6BF77AA

  Device     Start   End Sectors Size Type
  cdrom.iso1    64   139      76  38K Microsoft basic data
  cdrom.iso2   140 20491   20352  10M EFI System

If i omit option -appended_part_as_gpt i get:

  Disklabel type: dos
  Disk identifier: 0x00000000

  Device     Boot Start   End Sectors Size Id Type
  cdrom.iso1        140 20491   20352  10M ef EFI (FAT-12/16/32)


I will investigate whether the GPT partition number can be forced to
the number given by the user. But i am not optimistic about this.
The rule of having gapless GPT stems from work done for grub-mkrescue
over a decade ago. I would have to find out whether this demand of
Vladimir Serbinko is purely esthetic or has a hard reason.


Have a nice day :)

Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
