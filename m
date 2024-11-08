Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8546D5E145
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 07:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52FEA42490;
	Fri,  8 Nov 2024 07:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVEszjXH7Cpw; Fri,  8 Nov 2024 07:53:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E38D42550
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E38D42550;
	Fri,  8 Nov 2024 07:53:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9E2DD8F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 07:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E51766065F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 07:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5-FGgAdY75C for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 07:53:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c2c:c44::2;
 helo=vps5.t-kindler.de; envelope-from=mail_buildroot@t-kindler.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BF1B6062E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF1B6062E
Received: from vps5.t-kindler.de (vps5.t-kindler.de [IPv6:2a01:4f8:c2c:c44::2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BF1B6062E
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 07:53:38 +0000 (UTC)
Received: by vps5.t-kindler.de (Postfix, from userid 33)
 id 16388E16D7; Fri,  8 Nov 2024 08:53:35 +0100 (CET)
Received: from 92.116.73.167 (SquirrelMail authenticated user thomask)
 by t-kindler.de with HTTP; Fri, 8 Nov 2024 08:53:35 +0100
Message-ID: <e4ff0043cbc2eb1d80af5faa967403dc.squirrel@t-kindler.de>
Date: 1731052193
From: "Thomas Kindler" <mail_buildroot@t-kindler.de>
To: "Thomas Schmitt" <scdbackup@gmx.net>
Cc: buildroot@buildroot.org,
 bug-xorriso@gnu.org
User-Agent: SquirrelMail/1.5.2 [SVN]
MIME-Version: 1.0
References: <cb32292a0142d6f4e097385272e6fb83.squirrel@t-kindler.de>
 <17085327765155587732@scdbackup.webframe.org>
In-Reply-To: <17085327765155587732@scdbackup.webframe.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=t-kindler.de; s=default; t=1731052415;
 bh=eKMiH1OhiTK1Aa9qf/X5ZvpmtcrEc+VMX7pMCWENoi4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=I1lEg1BL/R1StOW1OSV7yuqSyxXycLY4N1XDIJJPLYkoXiDY+0/rZ88ID+F3WVX5P
 4i9CAr21JRMd40QVsqlBE+GidTwhqy4yrk7Qsb4SEuWIlJLPuNBoBIrploEdeUgOXn
 Aqj/hdyP3r4fPXpOETLaGL7rka6gksCegy7KtSGhgFJGxR5Oz1uUgsDCfLPWX4kbJq
 b1PtCeHU/yYFsInkSQKibF0pdHbtCUbGEFcRjNeB6LoOn1HGQe4snAizajQcnVNw8a
 Bu97yjjcuYyTHEa5iPX/Xu43tG7hzXBJzIq89VrjAq6wzRz01lLqfRLMjVXnxSMeUO
 fLYd+0dY935Ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=t-kindler.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=t-kindler.de header.i=@t-kindler.de header.a=rsa-sha256
 header.s=default header.b=I1lEg1BL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, November 7, 2024 08:09, Thomas Schmitt via buildroot wrote:

Thanks for your great answer!

>
> consider to Cc: bug-xorriso@gnu.org when asking xorriso questions.
>

Can do - I'll CC this mail, so other people know that there's a xorriso
thread on the buildroot mailing list.

>> [..]
>> 1) How can I get xorriso to generate an image with only the EFI
>> partition?
>
> If all is in the EFI partition, you want GPT, and want to avoid nested
> partitions, try with an appended partition attached to a minimal ISO with a
> dummy file (here: README).
>
> # There is no need to have $BINARIES_DIR/cdrom
>
>
> echo "No payload data in this ISO 9660 filesystem" >README
>
> xorriso -as mkisofs \ -o "$BINARIES_DIR"/cdrom.iso \
> -eltorito-catalog boot.cat \
> -appended_part_as_gpt \
> -partition_offset 16 \
> -append_partition 2 0xef "$BINARIES_DIR"/efi-part.vfat \
> -e --interval:appended_partition_2:all:: \
> -no-emul-boot \
> -no-pad \
> README
>
>
> The resulting .iso then yields with fdisk -l something like:
>
>
> Disklabel type: gpt
> Disk identifier: 402F6C62-D96C-4257-B9A8-A4E20CD84888
>
>
> Device     Start   End Sectors Size Type
> cdrom.iso1    64   203     140  70K Microsoft basic data
> cdrom.iso2   204 20555   20352  10M EFI System
>
>

Is there a way to generate only one partition?
That way it would look like a normal USB stick.

As a workaround I use sgdisk:

# Remove partition 1, swap 1 and 2, rename to "esp", print
#
sgdisk -d1 -r1:2 -c1:esp -p $BINARIES_DIR/cdrom.iso


But a xorriso-only solution would be best.


best regards,
-- 
Thomas Kindler <mail_buildroot@t-kindler.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
