Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7B5C0218D
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 20:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7B460672;
	Sun, 26 Jan 2025 20:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZqVPyWOMOKS; Sun, 26 Jan 2025 20:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA5F6072A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AA5F6072A;
	Sun, 26 Jan 2025 20:07:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBEEF10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 20:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7945540912
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 20:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQu9SHTfFuTE for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 20:07:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D17C40902
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D17C40902
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D17C40902
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 20:07:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DCC140002;
 Sun, 26 Jan 2025 20:07:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tc8ur-00GNiV-2O;
 Sun, 26 Jan 2025 21:07:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241222182026.1231497-1-ju.o@free.fr>
Date: Sun, 26 Jan 2025 21:07:33 +0100
In-Reply-To: <20241222182026.1231497-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 22 Dec 2024 19:20:26 +0100")
Message-ID: <87v7u18hkq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/acpica: security bump to
 version 20241212
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > For change log since 20240927, see:
 > https://github.com/user-attachments/files/18117996/changes.txt

 > Note: the change log mention "Fix 2 critical CVE addressing memory
 > leaks" without providing actual CVE numbers. For reference, the
 > upstream commits for those security fixes are [1] and [2]. From the log
 > of those commits, it seems those memory leaks can only happen in old
 > Kernels <= 4.9 (which is end-of-life since January 2023). Technically
 > those leaks could happen in any program embedding the apcica code
 > files. The impact seems very low, if any, on the acpica standalone
 > tools.

 > [1] https://github.com/acpica/acpica/commit/987a3b5cf7175916e2a4b6ea5b8e70f830dfe732
 > [2] https://github.com/acpica/acpica/commit/8829e70e1360c81e7a5a901b5d4f48330e021ea5

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/8707592086

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
