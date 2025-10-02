Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98A0CAC5B0
	for <buildroot@archiver.kernel.org>; Thu,  2 Oct 2025 08:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51126415A9;
	Thu,  2 Oct 2025 08:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRABk-uISaEP; Thu,  2 Oct 2025 08:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1E9414BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A1E9414BF;
	Thu,  2 Oct 2025 08:52:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CF9913D
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 08:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F241414F1
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 08:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdIG1VY347i2 for <buildroot@buildroot.org>;
 Thu,  2 Oct 2025 08:52:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5711C4152B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5711C4152B
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5711C4152B
 for <buildroot@buildroot.org>; Thu,  2 Oct 2025 08:51:59 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 7C639C08BE;
 Thu,  2 Oct 2025 10:51:56 +0200 (CEST)
Message-ID: <eb2d66cf-6831-474c-bb8d-dd1a30e6ffca@grenoble.cnrs.fr>
Date: Thu, 2 Oct 2025 10:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Horst Noecker <horst.noecker@cellomation.de>,
 buildroot <buildroot@buildroot.org>
References: <82448835-75b5-4952-a1b3-3105c1971145@cellomation.de>
Content-Language: en-US, fr
In-Reply-To: <82448835-75b5-4952-a1b3-3105c1971145@cellomation.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1759395116;
 bh=iz1u8Oh30U0sWx7wBDjrxTcV88MmtYUsM+RqvIGa1dA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=mFwA4Mi7UEUkr7DHUUrUrN9Oaes2JxaJFg3Dakv8JFnZjORhFPPZr2L8LjCJTRJfr
 v19GpeqJQrlSESe0bSi6btDUqvGRCpvTSQaxP5g2NuHSlvXM7khvZoeb1QexjWC7fr
 7UXg43Gv2hIy+6L92GTSy36D34TIMxVXMMfMW40KvxoExJynh6kFhvE8YY2VOXay7p
 jgb0BxaErGGwwSRQ5KNEV8BJ56GLG/9YaREAHXdRc2IdC8eav1tOO65KxZqAcbrQ4d
 DTVTX3DOyFZEc+Yh1xjSprHhL1SzaM7p/nreBpa0WeE/joKQ2aFDExBWzbS8LpYSSX
 viKWpZRaBmehA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=mFwA4Mi7
Subject: Re: [Buildroot] Run Test Problem
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

On 2025-10-02, Horst Noecker wrote:
> $ support/testing/run-tests -d dl -o runtest_results -k tests.package.test_mariadb
> [...] SystemError: Build failed [...]
> Does anybody have a hint for me what I could be missing here?

Most likely you are missing a build prerequisite.
See docs/manual/prerequisite.adoc .

Look also at the last lines of runtest_results/TestMariaDB-build.log:
they may give you a hint on what package is missing.

For the record, I could successfully run this test on a fresh Debian
trixie VM as follows:

    sudo apt update
    sudo apt install -y curl build-essential unzip rsync bc libncurses-dev
    sudo apt install -y qemu-system-arm python3-{nose2,pexpect}
    wget https://buildroot.org/downloads/buildroot-2025.05.2.tar.gz
    tar xaf buildroot-2025.05.2.tar.gz
    cd buildroot-2025.05.2
    support/testing/run-tests -d dl -o runtest_results -k tests.package.test_mariadb

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
