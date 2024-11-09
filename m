Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ED0D5E376
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 16:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3438405E;
	Sat,  9 Nov 2024 16:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X06Cfv3PhBuo; Sat,  9 Nov 2024 16:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B50A820DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B50A820DF;
	Sat,  9 Nov 2024 16:48:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EEB2D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7177E820DF
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:48:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ddP3ijURRERF for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 16:48:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8A4D4820D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4D4820D9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A4D4820D9
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:48:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50066E0003;
 Sat,  9 Nov 2024 16:48:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t9od1-006oPA-2G;
 Sat, 09 Nov 2024 17:48:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
References: <20241008174822.3625910-1-bernd@kuhls.net>
Date: Sat, 09 Nov 2024 17:48:03 +0100
In-Reply-To: <20241008174822.3625910-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 8 Oct 2024 19:48:22 +0200")
Message-ID: <87pln4cq0s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20240910
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

 > Release notes:
 > https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240813
 > https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20240910

 > 20240813 fixes
 > CVE-2024-24853:
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01083.html
 > CVE-2024-25939:
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01118.html
 > CVE-2024-24980:
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01100.html
 > CVE-2023-42667:
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01038.html
 > CVE-2023-49141:
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01046.html

 > 20240910 fixes
 > CVE-2024-23984:
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01103.html
 > CVE-2024-24968:
 > https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01097.html

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
