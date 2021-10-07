Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8762C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 05:46:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74830610FB
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 05:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74830610FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D71960F61;
	Thu,  7 Oct 2021 05:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NzAjmJyfmcEP; Thu,  7 Oct 2021 05:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C0FF60F23;
	Thu,  7 Oct 2021 05:46:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC45E1BF5F6
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 05:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC44940982
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 05:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XYU5YzoUJRA4 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 05:46:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9FC44043B
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 05:46:36 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 10719440777;
 Thu,  7 Oct 2021 08:45:50 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1633585550;
 bh=lp4MhSkpKZ3oddYmWWwmNPXhxn3uQDhxMi6y2NR3TZA=;
 h=From:To:Cc:Subject:Date:From;
 b=KLsh/4OLkOXSW/5o9eD7OaiUcTdVj4bHC6PRg/x7M6CjROgn/2UWbZ+PwMStKCDFP
 /VLlevL+7dXAg+48l07f9KMov985wt5A2pJ71x9g31A5MqeeUTmdc1GYrORjmqV6G8
 BIsf/CO1qy4a8ETF61qdWW8DRvPSipMhv48hrMmWbz3KUw6SlCPbU+0EE8gd35S5Ty
 VrLigDlUqmSWO+WmywfOXBQGQ5QrTeZksDDndh+5SPRmQTdOb1jxxlAR33zp6qxYKn
 qGnMqg/JPeI7QoBiXCgMVUBLsM8/yiJ/arWeaews1s3DnHlW659z+WOfrQz+HMWlKb
 vcvsntI4hlOGQ==
User-agent: mu4e 1.6.6; emacs 27.1
To: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 07 Oct 2021 08:13:37 +0300
Message-ID: <87a6jl5qvb.fsf@tarshish>
MIME-Version: 1.0
Subject: [Buildroot] Buildroot patchwork strange Submitter
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jeremy,

The "Submitter" field of some Buildroot patchwork entries over the last
few days from different senders is set to "Baruch Siach via buildroot":

  http://patchwork.ozlabs.org/project/buildroot/list/?submitter=82609

Any idea what might be causing that?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
