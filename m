Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9231BCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68B6A811A5;
	Fri, 29 Aug 2025 15:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v_3ySAQdyKyG; Fri, 29 Aug 2025 15:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6828844B3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6828844B3;
	Fri, 29 Aug 2025 15:33:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0279D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 871ED413C8
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oqRpXW0UEKbk for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:33:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81830414C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81830414C3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81830414C3
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1853779444; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 15:33:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1us167-00Chel-0H;
 Fri, 29 Aug 2025 17:33:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250828130513.146485-1-thomas.petazzoni@bootlin.com>
 <20250828130513.146485-2-thomas.petazzoni@bootlin.com>
Date: Fri, 29 Aug 2025 17:33:03 +0200
In-Reply-To: <20250828130513.146485-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Thu, 28 Aug 2025 15:05:10
 +0200")
Message-ID: <87cy8ei1n4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Us6yNuX1ZHVBDrmwH+wKH4ZxbDdax6W3pO5bH0TuMX4GJHE6zKIepzaR4548DA/i/0t28BCRc2Pc37qpfm0Y1V5Q+VbNi4aw90z7tq7irogSpIcQnADkYmeWUyk8aUZppVUe+foyGMkumn82FI21W0xr2J3E49zxnuhJ93O7zRn85eXaAEKiBBHFthIBes/IPPBLGl+EYKjqzc9GxCAPYRCiJN4I/A2KSDFpqPZKyQOk9WQ6tPrcTOmUp66ghKsCsrfjH7PZzo+JvrxtG9kZK8hZ1nKQgLB7Js358RE8RWJoTl/bI0ElYBJLw+5gg8sG7CzbL43naMmkn3bMB8iVzw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=qcdraYqkZAgFBYytEaE/K78NQx2NJATso4LlR4oLur0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Us6yNuX1
Subject: Re: [Buildroot] [PATCH v2 2/3] package/libsvgtiny: remove package
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > This package hasn't been updated in years. It has new releases, such
 > as 1.0.8 from December 2023, but nobody updated to it.

 > Doing the version bump is not straightforward, and the original
 > package submitter, Peter Korsgaard, is no longer using it. This
 > package also had no reverse dependency, and no maintainer in the
 > DEVELOPERS file.

 > Therefore, let's drop this package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > v1 -> v2: also drop from package/Config.in

Committed after adding a Config.in.legacy entry (and not for the
host-only buildsystem), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
