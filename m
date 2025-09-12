Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A19CAC582
	for <buildroot@archiver.kernel.org>; Fri, 12 Sep 2025 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66BFB831BD;
	Fri, 12 Sep 2025 15:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElNEhSb6bDXA; Fri, 12 Sep 2025 15:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9514B8318C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9514B8318C;
	Fri, 12 Sep 2025 15:31:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F93E25B
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 054DD8318C
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4DMnlgDlAwM for <buildroot@buildroot.org>;
 Fri, 12 Sep 2025 15:31:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0725D83145
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0725D83145
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0725D83145
 for <buildroot@buildroot.org>; Fri, 12 Sep 2025 15:31:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -393361669; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Sep 2025 15:31:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ux5kR-001sWr-24;
 Fri, 12 Sep 2025 17:31:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250911171334.593571-1-bernd@kuhls.net>
 <20250911171334.593571-3-bernd@kuhls.net>
Date: Fri, 12 Sep 2025 17:31:39 +0200
In-Reply-To: <20250911171334.593571-3-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 11 Sep 2025 19:13:33 +0200")
Message-ID: <87jz234rhg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=PtU/wJ6u/hNfNIngALgDdW1Qg1kA44+ZdAqTN9/kFRU2xNQxeLhIcDgoyra7N6WZyE5dJoZoRf4R+onAV3kKDBckRlFIOfOLEgU7MRYu6gVpcY8TiggnoFwfv9qE3HgKm8U273wxrv3hvsBwFIPkU+ABa2PmFqrjxlTZTSw0cwUjYdcoXaCy2JoOLDI4+kxyNvy78WyS/cs/PnMGu/ATjQM5abMbnBQI84G17rN2IWhLQBTumKJRRcxiFwoZaO1HbN7y6281zlu4AvS9qhmu8gnhzDrmn80qPs4T0qtKm29auaF+26s8kgVpMrf7eemrZuo063K8rSIcvar8uV7PmA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=/WuLp+xr4xmgToJRC9uo0T/3UfMlmeHWPTHitcxtYZo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=PtU/wJ6u
Subject: Re: [Buildroot] [PATCH 3/3] package/libcurl: security bump version
 to 8.16.0
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Changelog: https://curl.se/ch/8.16.0.html
 > Fixed CVEs:
 > CVE-2025-9086: https://curl.se/docs/CVE-2025-9086.html
 > CVE-2025-10148: https://curl.se/docs/CVE-2025-10148.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
