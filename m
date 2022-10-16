Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087A2C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 04:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F37D60E35;
	Sun, 16 Oct 2022 04:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F37D60E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTguFyEby1IF; Sun, 16 Oct 2022 04:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DAF6607E3;
	Sun, 16 Oct 2022 04:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DAF6607E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5CBE41BF3DB
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 04:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358DC40E47
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 04:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358DC40E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y78gpQCc9mTG for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 04:08:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FAF540977
Received: from sender4-op-o13.zoho.com (sender4-op-o13.zoho.com
 [136.143.188.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FAF540977
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 04:08:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1665893326; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nKTDyc62r/FVUdL1F8jZ9pM/iPg8mkZZX2NUgXi1Ldjud9fnZgKgLmw0GM1IfNYJ/xP3y8pt9LdsShZaf3jSFkQ0T7Fkv3I7Re0Cjuo4TsqxvV5MeBo5jg9Mc+uYQKE5Pq3ws3TLMmAAJNTXJ49GglWhypE+AuzqoRJNE0VbGhU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1665893326;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=2DP9VRffl5p+tsKx/uIKt1ZKBcBNLZBrn267uMOsZxU=; 
 b=MkRTptuu1VfH8wXK9o849bkn0kNTrojT46GxyDPMeNbTWJPUxBBv5Cpn2sU8oAleVabYDhNgiRuvHYwb1jrJbxsnBR36ZqxsefVTo4/zAzDPQ9N578gv/mirCuNyYj+LNeXOxZdoOa2arPxFaYr/01kkg5EphCnSF1+qEoTswE4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=linux.beauty;
 spf=pass  smtp.mailfrom=me@linux.beauty;
 dmarc=pass header.from=<me@linux.beauty>
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1665893324606288.188057776808;
 Sat, 15 Oct 2022 21:08:44 -0700 (PDT)
Date: Sun, 16 Oct 2022 12:08:44 +0800
From: Li Chen <me@linux.beauty>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
Message-ID: <183defad72f.103c9b752645508.6184936701214911726@linux.beauty>
In-Reply-To: <20221012224008.5dc7c7b6@windsurf>
References: <87edvdeseo.wl-me@linux.beauty> <20221012224008.5dc7c7b6@windsurf>
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1665893326; 
 s=zmail; d=linux.beauty; i=me@linux.beauty;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2DP9VRffl5p+tsKx/uIKt1ZKBcBNLZBrn267uMOsZxU=;
 b=r+yb5y8BdYesh6QAEsraay7HxLMWePHo8SZODcI7QUXwHEn/iSm/LXI02AlMVWM5
 9ENsdDbRAsJLQRmqsUXejo5PhY1o5LhjYpgm3VJGIOFxR3SLI0wip8awCN029edifG1
 ysONxjCKedC7jB2tKH4MXqAXJ2OOyKlHmfk6k1Pw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty
 header.a=rsa-sha256 header.s=zmail header.b=r+yb5y8B
Subject: Re: [Buildroot] [PATCH] package/kmod: use the correct path for kmod
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
 ---- On Thu, 13 Oct 2022 04:40:08 +0800  Thomas Petazzoni  wrote --- 
 > Hello,
 > 
 > On Wed, 12 Oct 2022 09:34:39 +0800
 > Li Chenme@linux.beauty> wrote:
 > 
 > > Content-Transfer-Encoding: 8bit
 > > 
 > > kmod install path is always /usr/bin/kmod instead
 > > of /bin/kmod.
 > > 
 > > So if we link modprobe/lsmod/... to /bin/kmod
 > > 
 > > We will get error like:
 > > > # modprobe
 > > > -sh: modprobe: not found  
 > > 
 > > because it points to:
 > > > # ls -liah /sbin/modprobe
 > > >   2551 lrwxrwxrwx    1 root     root          11 Sep 25 10:05 /sbin/modprobe -> ../bin/kmod  
 > > 
 > > and kmod is under /usr/bin/kmod instead of /bin/kmod.
 > > 
 > > Signed-off-by: Li Chen me@linux.beauty>
 > 
 > Are you testing a BR2_ROOTFS_MERGED_USR enabled or a
 > BR2_ROOTFS_MERGED_USR disabled configuration?
 > 
 > If you're testing a BR2_ROOTFS_MERGED_USR enabled configuration, then
 > the "modprobe" symlink, even if created in /sbin is in fact in
 > /usr/sbin, because /sbin is a symlink to /usr/sbin. So actually the
 > symlink is /usr/sbin/modprobe -> ../bin/kmod, which is correct as kmod
 > is indeed in /usr/bin/kmod.
 > 
 > If you're testing a BR2_ROOTFS_MERGED_USR disabled configuration, then
 > the "modprobe" symlink is really in /sbin, and /sbin/modprobe is a
 > symlink to ../usr/bin/kmod, which is correct.
 > 
 > (Of course, I didn't do a test, so maybe my reasoning is wrong, but the
 > current logic appears correct at first sight).

Thanks for your reply,
I cannot reproduce this issue now somehow. I will update this thread if I come across it again someday.

Regards,
Li
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
