Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B97AC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 05:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17989820BA;
	Sun,  6 Jul 2025 05:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id id-73B2LHBW1; Sun,  6 Jul 2025 05:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F518820B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F518820B3;
	Sun,  6 Jul 2025 05:04:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C37019C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 05:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DA5F60EF1
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 05:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAWWmfioeKdI for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 05:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6DA6660ACE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DA6660ACE
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DA6660ACE
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 05:04:07 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 17F5A440364;
 Sun,  6 Jul 2025 08:02:36 +0300 (IDT)
To: "Matthew Silva" <dev@matt-silva.com>
Cc: <buildroot@buildroot.org>
In-Reply-To: <DB4NQ16PKVED.2I7DATK1AFI76@matt-silva.com> (Matthew Silva's
 message of "Sat, 05 Jul 2025 23:37:38 -0400")
References: <DB4NQ16PKVED.2I7DATK1AFI76@matt-silva.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 06 Jul 2025 08:04:02 +0300
Message-ID: <87ms9hrjul.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1751778156;
 bh=2mEe1Lgw5YsU7U1ZxzKTKlct9o7kHR4AYe7H3Ff77/M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Act8k8dRL10XbzMtqxcJRKO3tt9cmeZWC0AGe0MjMJALAqKGssNDfzXQVPYzAPODz
 3/5UVaZd4aVUqJNpSNCwLSGzi2zyCldnCq4PEeiYwUYXwfncJrtdBEdELIRPVDLjJ7
 8ZKUSVIOP0x5CHqeJRzxUMV2vCRKuDPdpEwwB9KB2Zt7Nci/n40++X0eCmWzVfIE+8
 HR97yOXtFXjS6ksAJ/F4u751aE+rsDrVlRixPs0mTn9ZqjZ6vjbI7p98mDVg6IxM7A
 ygKaJdj3AvjnqOHgjPrwQP+4KSs2RY4c+X3S3uhyPtYvF8mupBEcGFbAxtd4Y5f5vn
 u2/Uzt8PQiKTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=Act8k8dR
Subject: Re: [Buildroot] [Question] Difficulties with Autotools and
 nilfs-utils package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Matthew,

On Sat, Jul 05 2025, Matthew Silva wrote:
> I am in the process of attempting to add partclone
> (https://github.com/Thomas-Tsai/partclone) to buildroot; however, I'm
> running into some issues with its dependency on the nilfs-utils package.
>
> I add it as a dependency both in the Config.in and partclone.mk file but
> when the autotools ./configure runs for partclone, it fails with an
> error saying it is unable to find the "nilfs.h" header file.
>
> Looking at the target /usr/include folder, the nilfs.h header is
> installed there. However, it is not present in the sysroot /usr/include
> folder.
>
> Comparing this to the e2fsprogs dependency that partclone also has, the
> required "ext2fs.h" header file gets installed in both the target AND
> the sysroot /usr/include folders.
>
> My understanding is that autotools is failing because it expects the
> nilfs.h file to be in the sysroot. And it needs to be in the sysroot
> because that is where the cross-compiler (x86_64-buildroot-linux-gnu in
> this case) looks for files when building for the target. (Please correct
> me if I am wrong on either of these).
>
> I am unable to figure out why the nilfs-utils package will not install
> its headers into the sysroot folder. I am not sure if it is a buildroot
> setting or an autotools setting that would be the cause of this issue.

Try adding 'NILFS_UTILS_INSTALL_STAGING = YES' to
package/nilfs-utils/nilfs-utils.mk.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
