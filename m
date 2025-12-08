Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8030BD3ABEF
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 09:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E832807A9;
	Mon,  8 Dec 2025 09:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0M1_c6fyTaZd; Mon,  8 Dec 2025 09:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 523F2811C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765186402;
	bh=Zivza18U+m4lCQ5UsKExCXYybTBzwWgO9FBsHdnbmjw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C098ukscOjM2alGbtg4IRVcMlDPkv3wyIl9U9sNFovyttThM2AQ5o/bPgGCvuc5ID
	 d2QulrS1OZOT8P3R4uUGjEZ0lH6iGI4jWmlC1DSvTU/acMEQs7DQ/uBUyjVymCMe7/
	 vBjCySHxdQ56v1Nt9L+YqjwC/oeZbBDv/qejZfZAvflQLxnlfzHXFFQUwUXbFyQx1G
	 ay6AhhMqH6HYruO1ZQ/GQs24ZEW9SLVn/3xQW9l74Lw6G3kxTnzNrlwXuGszdVznu/
	 iKdvV2Sh8HE+wfH/UooWyBmuU5K4MKo43PvGKLs1FlAIqqAuh2IkQFVAwnjQY6BCiD
	 Vvfqg9n1cQpng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 523F2811C1;
	Mon,  8 Dec 2025 09:33:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E070E151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 09:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D23E3400C7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 09:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwPHkBUd9T6Y for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 09:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7EB084005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB084005C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EB084005C
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 09:33:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1915806372; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 08 Dec 2025 09:33:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSXcD-00000006MJD-22hI;
 Mon, 08 Dec 2025 10:33:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251207192343.1089336-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 7 Dec 2025 20:23:42 +0100")
References: <20251207192343.1089336-1-bernd@kuhls.net>
Date: Mon, 08 Dec 2025 10:33:09 +0100
Message-ID: <877buxuxm2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=U+NiIXUAy1D3cb0e7P7oR2ghSL/f1rqJX48E6hCa5GucVGzx/nQnOttS52iAv7iP77SNub5t2/qmDrROJOMgmPgKXTCRh69Wg6ri7WIDiPoKELqClaJmZdz3tW2INIanxgJpRZD4T83nQFNcw97Kv5cthbKMMS6gXLhCIEberYJRMusr1uvigy4ImBESxnBx8KU9XX9Y7auPvRCYyTF63fCnl5qqKXCcLY1Hnd27vfa1M1C2yR7fQpa7X6G0b3wdgITYh5hXhYpO0F7CY0tVSUSUjoVAhGIkDnl+MWm6cQoS1qLZv8SOl+trs+e2DrkoJDxWOu5irT9f+JNTrp1DMw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=T3/g/I9WjrAMjIWFWLhWE7qlMF6jznG68jcvWdnlj70=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=U+NiIXUA
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptodev-linux: Fix build for
 Linux 6.18
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

 > Buildroot commit a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c bumped the
 > linux kernel to version 6.18 which broke the build of cryptodev-linux.

 > Added upstream patch to fix the problem.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
