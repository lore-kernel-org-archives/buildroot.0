Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C452ACCD19A
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 07:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B2F83E95;
	Tue, 18 Nov 2025 07:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lx5HlnqNrQp3; Tue, 18 Nov 2025 07:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADCAE83D86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADCAE83D86;
	Tue, 18 Nov 2025 07:03:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FA231BA
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85C2140D86
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2kt2f2Amgkj for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 07:03:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33B1140860
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33B1140860
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33B1140860
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 07:03:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 794480150; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Nov 2025 07:03:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vLFkH-00000001kf6-41w4;
 Tue, 18 Nov 2025 08:03:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yi Zheng <goodmenzy@gmail.com>
Cc: buildroot <buildroot@buildroot.org>
In-Reply-To: <CAJPHfYOf7dNbKiJ4W_MpOUF3h4s-2_LuSph_LrbRC3VHW5JFFw@mail.gmail.com>
 (Yi Zheng's message of "Tue, 18 Nov 2025 13:24:15 +0800")
References: <CAJPHfYOf7dNbKiJ4W_MpOUF3h4s-2_LuSph_LrbRC3VHW5JFFw@mail.gmail.com>
Date: Tue, 18 Nov 2025 08:03:21 +0100
Message-ID: <87qztv7rgm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rndpVQHCNhNPaQ0ULZnvtps7akMniHCD3TguRD5GjCMevXFrX4zskVIgjvY79C4rEesiV7ZyIKjZzMXNMuHk1cdAUkOWsX0HHvOphBaUkYvhPGc6h/Ej9zq5rl7hu0DA8CyGK3UYXjyL3CHCSI46S4vYQXxuGlO7h6hs5Q7jrXNEzs+XwkFdEBysh6dODxtOWFNyI21FRhAuDinc7woOvrGUEL93FWLUlEdM39TUJDANCeL6HmkMW+hjiEDk8U0rFq42Gsmz+Ao7TGfeO7LnPiwcdxm13dJCA0SmJDKjyyR/WHBDZicUpHSdIbueET+U/SNdrCDWsFUWBWZ7MeM8Yg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=+ZV6GYAjEHekLaJkbmJJsvhPRg+z7UrdZUdeWXU6HSM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=rndpVQHC
Subject: Re: [Buildroot] fs/squashfs/Config.in typo, arm arch-name
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

>>>>> "Yi" == Yi Zheng <goodmenzy@gmail.com> writes:

 > BR_aarch64 is not defined. it seems should be BR2_aarch64
 > i can not access gitlab freely, so the only way to report bug is a mail.
 > Sorry.

 > ---
 > fs/squashfs/Config.in | 2 +-
 > 1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
 > index 4f898bfdd4..cb2f5ec969 100644
 > --- a/fs/squashfs/Config.in
 > +++ b/fs/squashfs/Config.in
 > @@ -114,7 +114,7 @@ config BR2_TARGET_ROOTFS_SQUASHFS_COMP_OPTS
 >        default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
 >        default "-Xcompression-level 9" if BR2_TARGET_ROOTFS_SQUASHFS4_LZO
 >        default "-Xhc" if BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
 > -       default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ
 > && (BR2_arm || BR_aarch64)
 > +       default "-Xbcj arm,armthumb" if BR2_TARGET_ROOTFS_SQUASHFS4_XZ

Good catch! Your patch was a bit corrupted by your mailed but I fixed
that and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
