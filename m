Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CE7E6F075
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 18:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F3480307;
	Fri,  1 Nov 2024 18:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8Nhgwmit50f; Fri,  1 Nov 2024 18:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A08B082052
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08B082052;
	Fri,  1 Nov 2024 18:19:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39D26AF2
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A31582060
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lC0R9b8P0XPW for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 18:19:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4BD780307
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4BD780307
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4BD780307
 for <buildroot@uclibc.org>; Fri,  1 Nov 2024 18:19:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1t6wEm-0000HM-Bg
 for buildroot@uclibc.org; Fri, 01 Nov 2024 19:19:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 01 Nov 2024 19:18:04 +0100
Message-ID: <pan$d6378$4825ecad$a03bf387$d84f2e3f@ID-313208.user.individual.net>
References: <20240921185558.3647651-1-bernd@kuhls.net>
 <20240921185558.3647651-2-bernd@kuhls.net>
 <20241031205621.064eceae@windsurf>
 <CADvTj4oYpFkJYp_CkXc30WM-K-pVQBTLKmN0kN11v5kWxJNvyA__39333.6642578774$1730473113$gmane$org@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 2/2] package/python-emailproxy: new package
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

Am Fri, 1 Nov 2024 08:57:46 -0600 schrieb James Hilliard:

> But they might not be real dependencies, could try bypassing with build
> opts: --skip-dependency-check

Hi James,

adding

PYTHON_EMAILPROXY_BUILD_OPTS = --skip-dependency-check

does not fix the build error when host-python-cryptography host-python-
pyasyncore are missing:

  File "/home/bernd/buildroot/output/build/python-emailproxy-2024.9.12/
emailproxy.py", line 52, in <module>
    import asyncore
ModuleNotFoundError: No module named 'asyncore'

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
