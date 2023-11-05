Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B780C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 19:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0554181EAD;
	Sun,  5 Nov 2023 19:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0554181EAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3O08QrboPr6Q; Sun,  5 Nov 2023 19:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF2381EB4;
	Sun,  5 Nov 2023 19:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF2381EB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA9A11BF48D
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFF5C417A8
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 19:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF5C417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hhydbpw4HpjN for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 19:45:59 +0000 (UTC)
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC0E441775
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 19:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC0E441775
ARC-Seal: i=1; a=rsa-sha256; t=1699213551; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=glqZBTeOTu1scxsbFGsX6z+ImD0k7pjI4RWVV5kaCzWkLuy5CQHe7siBXRfDddnH0ZkSKlKAbFFEL5Gfp0QetVYzXt+UHS5kgpRfjCYSf7V6k0N/5MD/88WSN/9Q9RPiI4ZBSV33EtWZiG168tpAb369Tuv1YaWz3z4e+W0fWdk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1699213551;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mfxB0T+KQr89SyO14Y8R/eqCiKvQmHwAMSD1O7MDC74=; 
 b=YXQl/z42SiuF0mzpjSFtSpc33AS2IVNdTCBNKc9KK14T/CFkdwtQ5flEmzBMWEhp1jVnTC9/3T86Q9mQtv7XIgaClCUOQH9T/UIRn5BespSjVxyk1l+4G4m1gZP4xMGT1BsRNOkDYWcaPg6RPZ4rCosi3QIa+ku4lcu9os40M5s=
ARC-Authentication-Results: i=1; mx.zohomail.com; dkim=pass  header.i=fsck.pl;
 spf=pass  smtp.mailfrom=enki@fsck.pl;
 dmarc=pass header.from=<enki@fsck.pl>
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1699213545155106.62343612545351;
 Sun, 5 Nov 2023 11:45:45 -0800 (PST)
Date: Sun, 05 Nov 2023 20:45:45 +0100
From: enki <enki@fsck.pl>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Message-ID: <18ba1050ead.e92a523a459223.2327298946072754198@fsck.pl>
In-Reply-To: <20231104143527.075bd95d@windsurf>
References: <18b80c0ce62.cb399136547843.6065948676717076989@fsck.pl>
 <20231030132841.3052429-1-enki@fsck.pl> <20231104143527.075bd95d@windsurf>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1699213551; 
 s=zoho; d=fsck.pl; i=enki@fsck.pl;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=mfxB0T+KQr89SyO14Y8R/eqCiKvQmHwAMSD1O7MDC74=;
 b=UjOzZm081zlk5hU0HiIww7DOJfiUhaD20czcnphAD1kADTNNewLb06tiraRAOI9C
 sj9dT9osf6hNyRdp0CtVv70+6zQhTEfn8FxO6p9UBpY7JPe1VRxKtTvLibbWLrmTjhp
 IaAgEca23ZtzX4YHs/FkFP00NTCF3czlMHHObl5U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=fsck.pl header.i=enki@fsck.pl
 header.a=rsa-sha256 header.s=zoho header.b=UjOzZm08
Subject: Re: [Buildroot] [PATCH v3 1/1] package/spirv-tools: fix build issue
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



 ---- On Sat, 04 Nov 2023 14:35:27 +0100  Thomas Petazzoni via buildroot  wrote --- 
 > Hello,
 > 
 > 
 > 
 > On Mon, 30 Oct 2023 14:28:40 +0100
 > 
 > Maciej Grela enki@fsck.pl> wrote:
 > 
 > 
 > 
 > > spirv-tools requires a toolchain w/ shared libs, add flag dependency and comment.
 > 
 > > 
 > 
 > > Fixes: http://autobuild.buildroot.net/results/53b3cf124d6c299398e620120465eca396ddcdff
 > 
 > 
 > 
 > This first build issue is a configuration with
 > 
 > BR2_SHARED_STATIC_LIBS=y, so this patch definitely cannot fix it.
 > 

Right, the initial patch also added a dependency on the C++ compiler. I reworked it after Yann's reply to be applied on top of the 
already applied C++17 requirement patch. I forgot to adjust the list of Fixed: builds. 
This should now be ok only referencing BR2_STATIC_LIBS cases.

-- 
enki
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
