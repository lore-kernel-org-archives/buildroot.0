Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4772DCA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8826823E0;
	Thu, 28 Aug 2025 09:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7d_Ja8tzsDrr; Thu, 28 Aug 2025 09:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D4E3823A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D4E3823A0;
	Thu, 28 Aug 2025 09:11:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70E06B8C
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6162F40918
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INjGAieSecCc for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 09:11:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8D0D540822
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D0D540822
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D0D540822
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 09:11:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1989825738; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 28 Aug 2025 09:11:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1urYf6-005OgT-2K;
 Thu, 28 Aug 2025 11:11:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Fiona Klute
 <fiona.klute@gmx.de>,  Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org,  "Arnout Vandecappelle (Essensium/Mind)"
 <arnout@mind.be>
References: <20250818132436.338635-1-fiona.klute@gmx.de>
 <CA+h8R2pxc0gy4pjVnBJr596Z6RTsMV25svYwP-OLOwigzTb6Cw@mail.gmail.com>
 <cc0f34e2-366d-4f78-a8e7-5c163e57c3c2@smile.fr>
 <17c60c20-55aa-4864-b838-45751b67210e@gmx.de>
 <20250826121851.06ec731e@windsurf>
 <f6d95d33-d134-4390-be7f-ee1a674b25ee@smile.fr>
Date: Thu, 28 Aug 2025 11:11:16 +0200
In-Reply-To: <f6d95d33-d134-4390-be7f-ee1a674b25ee@smile.fr> (Romain Naour's
 message of "Wed, 27 Aug 2025 17:22:30 +0200")
Message-ID: <875xe7lsjv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=mW8rwFzWyeNqUxwCugISVddNfDuAKT1y6zkt6OQsFSWrNXqDv0Fca205N5N+RQgBCUfYgA1HofX8Z8IPgDmoyxjDRIKNP4SQwOJuUK8W1q0TPnYp6jrtt27Ed7E3s1UXseYQ6VyEyKjSLKvsPENP5tMc6f5Y5LS8+QZD+X7soBfCXM4G/b3EVxoZueZ6YJGj8PnU8MkWh8E/Z1/hhE5UZ8lbfuxbsk3om+4YcrugEajaZxoglVclucUs92pldS7xX3qIHFzk1yhR+XJjBe3+JvDtOajZUZr/YW2JGIizaYozxyvFGOQe1HjaVcn884MUYJo1y8B25tiOTmTiEh7OmA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=nxq96VZz05CrbluRVph2ZJmAcxvCErAitzt+om6KfvM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=mW8rwFzW
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: prefer cgroup v2
 with kernel >=5.4 and no systemd
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

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

Hi,

 >> Totally fine with this idea. I think it's OK to require a 5.4 kernel
 >> if you want to run Docker.

 > Agree. If we really want to keep cgroupv1, we must at least add a specific test
 > to check if other packages (like docker) are still working with only cgroupv1.

 > I'm not sure it's worth the effort.

I doubt it as well. Recently, systemd has also dropped cgroupv1 support:

https://mastodon.social/@pid_eins/115088165140443645

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
