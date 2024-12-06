Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2242E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 19:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E252605A5;
	Fri,  6 Dec 2024 19:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rb_CIBtV-biH; Fri,  6 Dec 2024 19:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2EDF60618
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2EDF60618;
	Fri,  6 Dec 2024 19:53:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DAA57ED7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAFF460618
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIrXzq8gUyyf for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 19:53:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2F7B605A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F7B605A5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2F7B605A5
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 19:53:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F49CE0002;
 Fri,  6 Dec 2024 19:53:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJeOb-0080pF-27;
 Fri, 06 Dec 2024 20:53:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: buildroot@buildroot.org,  Bernd Kuhls <bernd@kuhls.net>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  ju.o@free.fr,
 mmayer@broadcom.com
References: <20241115195213.633633-1-f.fainelli@gmail.com>
 <878qswlbzk.fsf@dell.be.48ers.dk>
Date: Fri, 06 Dec 2024 20:53:49 +0100
In-Reply-To: <878qswlbzk.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 03 Dec 2024 21:58:55 +0100")
Message-ID: <87zfl8610y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/linux-tools: perf: Disable
 shellcheck
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:
 >> The use of shellcheck within perf is not a functional requirement and it can
 >> lead to build failures where the perf makefile attempts to link in empty
 >> .shellcheck_log files:

 >> https://lore.kernel.org/r/fb078045-dc05-426e-b21e-72ffae3e8e1b@gmail.com

 >> Disable shellcheck since we do not need it at all.

 >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

 > Committed, thanks.

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
