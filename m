Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D00C6C61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 14:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4AEB41878;
	Mon,  9 Jun 2025 14:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hjnQgkR5rMQt; Mon,  9 Jun 2025 14:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43BB411C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43BB411C8;
	Mon,  9 Jun 2025 14:24:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A38EA1F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89E258150F
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id diXjlZUbuFCL for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 14:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E306C813FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E306C813FE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E306C813FE
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 14:24:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2002404220; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 09 Jun 2025 14:24:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uOdQT-00EHg4-2x;
 Mon, 09 Jun 2025 16:24:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@smile.fr>
References: <20250608105840.14711-1-ju.o@free.fr>
Date: Mon, 09 Jun 2025 16:24:37 +0200
In-Reply-To: <20250608105840.14711-1-ju.o@free.fr> (Julien Olivain's message
 of "Sun, 8 Jun 2025 12:58:40 +0200")
Message-ID: <871prt9emy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YvxS7wogPTuVZ5REq1qLtn3rgj01WZZNQO8vFX6RejFFl5reJNllT0Q42S2iZzuCKhnXeg8wYIaFNLPr1DyyoZPX9S4V9cDlpbh0ph04N7ObtKPuvKiCk8kjI9MxBEHWYarZ+q060jA/jjUQPfF0tiHn1EBhclJG79vt5e0fzce2g5NI377W0gVOWjEU9O/LJkRIipq/e092TZmlE8aExG3VVYlQFRDTIP3fHY+19Tw5c074ediXfcWF1xh5FN2I2rn3A7Aj+6Zh09/2TwWIogNZ6rKnq6jLyCYtoDqUqBZemn+B8c6CNPZNziqA0N1THZvOfp0pws1pKN7jC9sQUA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ipLj0xGoAAEXX2fSdDj9315dg1UNCKJv8LpmDPuo6yU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=YvxS7wog
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator:
 propagate llvm depends on wchar
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

 > The target package spirv-llvm-translator was instroduced in Buildroot

s/instroduced/introduced/

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
