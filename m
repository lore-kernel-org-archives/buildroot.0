Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FDCC77B75
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 05:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E40B41F73;
	Fri,  5 May 2023 05:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E40B41F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iLVK0wYxbvN4; Fri,  5 May 2023 05:20:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1041841F70;
	Fri,  5 May 2023 05:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1041841F70
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64DE71BF39D
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 05:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42EDB40C25
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 05:20:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42EDB40C25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NABSne9RbZYi for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 05:20:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41C9E4010D
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41C9E4010D
 for <buildroot@buildroot.org>; Fri,  5 May 2023 05:20:42 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 5613B440F7B
 for <buildroot@buildroot.org>; Fri,  5 May 2023 08:14:56 +0300 (IDT)
User-agent: mu4e 1.9.21; emacs 28.2
To: buildroot@buildroot.org
Date: Fri, 05 May 2023 08:17:40 +0300
Message-ID: <87o7mz4amx.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1683263696;
 bh=y5SXXB4tTjvIFQY4Fodg4U9vMuOPyNJx+v1dH0fuU2c=;
 h=From:To:Subject:Date:From;
 b=IkpDNFvskL1rgxRbx37ntE/OcYUVX8sdPryKF0hr6MER0vZ3aDAOVQsON1tnC2Wk6
 d8nL/3dnNGxdpnkvxff47qyK/kNSCrwPvNyTlT8UYGgsxNdXWHVUZlN2nrubSeW1Jh
 vNRcFJo5SQTOX9GJjrDhA6tPj6lgZlBWErscocCFq/HEg2isS6ZOFxLHNCzqNenSjY
 wKOrX2faly0kjdg+xjl0d1oRA+p987kdlJV2qxF6ErqyMrhuD2xf6okggvfkrHeVDi
 gxXKcOUReFpFB1RZraFAiJtkxfwlz+SaticfGUdw/kESZMoIv3jadnEesH7W5P6SeA
 nso9HG9aS0f+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=IkpDNFvs
Subject: [Buildroot] List of trivial old patches
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Buildroot list,

Here is a list of over month old patchwork entries that look like
trivial version bumps, or upstream backports.

There are a lot more. So if you find this list useful, I'll dig up more
patches.

package/valgrind: bump version to 3.20.0
http://patchwork.ozlabs.org/project/buildroot/patch/20230329205659.6801-1-ps.report@gmx.net/

DEVELOPERS: add Julien Olivain for package/openblas
http://patchwork.ozlabs.org/project/buildroot/patch/20230329191323.733704-1-ju.o@free.fr/
package/openblas: bump to version v0.3.22
http://patchwork.ozlabs.org/project/buildroot/patch/20230329191323.733704-2-ju.o@free.fr/

package/gptfdisk: fix another runtime failure with popt 1.19
http://patchwork.ozlabs.org/project/buildroot/patch/2120646ed4f19a45b5fab83a212413f79be91448.1680094918.git.stefan@agner.ch/

package/libgit2: bump version to 1.6.3
http://patchwork.ozlabs.org/project/buildroot/patch/20230327121702.30959-1-nicolas.cavallari@green-communications.fr/

package/libostree: bump to version 2023.2
http://patchwork.ozlabs.org/project/buildroot/patch/20230327053702.517399-1-marcus.folkesson@gmail.com/

package/grep: bump version to 3.10
http://patchwork.ozlabs.org/project/buildroot/patch/20230323214901.3489-1-ps.report@gmx.net/

package/mtools: bump version to 4.0.43
http://patchwork.ozlabs.org/project/buildroot/patch/20230323214727.3228-1-ps.report@gmx.net/

configs/mx53loco: bump U-Boot and kernel versions
http://patchwork.ozlabs.org/project/buildroot/patch/20230323131536.3376306-1-festevam@gmail.com/

package/cups-filters: bump to version 1.28.17
http://patchwork.ozlabs.org/project/buildroot/patch/20230322173707.355775-1-angelo@amarulasolutions.com/

package/libcurl: bump version to 8.0.1
http://patchwork.ozlabs.org/project/buildroot/patch/20230322162445.19051-1-ps.report@gmx.net/

package/atkmm: bump to version 2.36.2
http://patchwork.ozlabs.org/project/buildroot/patch/20230321060120.175812-1-dalang@gmx.at/

package/exiv2: bump version to 0.27.6
http://patchwork.ozlabs.org/project/buildroot/patch/20230320120101.595396-1-nicolas.serafini@ik.me/

package/mmc-utils: bump to version d4c2910981ff99b983734426dfa99632fb81ac6b
http://patchwork.ozlabs.org/project/buildroot/patch/20230320111054.6660-1-giulio.benetti@benettiengineering.com/

package/lualdap: bump to version 1.3.1
http://patchwork.ozlabs.org/project/buildroot/patch/20230315090742.399240-1-francois.perrad@gadz.org/

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
