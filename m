Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90837CD8C8C
	for <buildroot@archiver.kernel.org>; Sat,  6 Jun 2026 13:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37958841D2;
	Sat,  6 Jun 2026 13:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkGf-ZeFTdlc; Sat,  6 Jun 2026 13:12:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A3D7841C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780751528;
	bh=aPtdCEsbjmWlhNDO1Ng0fICPBTIyln+P2gjDHefeMJU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZEbQzfwoVC7N/R8azKT1M9Lciyd8Zz13FO9mZlCs4nFf+5OaQbQx1zw75ee0hSCiJ
	 O0ZoXH8Wbkq4ZYkxVHfXEf9/RTS7fxisQp5BR6185yyqpaCitzWU2BB/+l0vDzYlff
	 846rUx6MpaaX8W49wj9r5siCm+Ai+ZuEUJxgY2GwIiJd655cIKNd9P7KCP1bH0i+Jq
	 QD8NpbPL2NYWeh67kBUmOqkiFOEh6cbhanSW8AbNu9Y+8LNMSUkCMzPwZRCoZd5/El
	 CBbixLkbMXHuoMtdyCRlGdchMTuumryRcvC+ZHI59/g+LywI/ww7ZM8Tq+SbJk4WRL
	 YN9BbXMpCW6nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A3D7841C6;
	Sat,  6 Jun 2026 13:12:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97B58345
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 13:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 953FE40826
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 13:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZIMboxxcM3p for <buildroot@buildroot.org>;
 Sat,  6 Jun 2026 13:12:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00BDC4085E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00BDC4085E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00BDC4085E
 for <buildroot@buildroot.org>; Sat,  6 Jun 2026 13:12:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2109343432; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 06 Jun 2026 13:11:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wVqoW-00000003TBc-3HUJ;
 Sat, 06 Jun 2026 15:11:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260605224249.2590975-1-romain.naour@smile.fr> (Romain Naour's
 message of "Sat, 6 Jun 2026 00:42:49 +0200")
References: <20260605224249.2590975-1-romain.naour@smile.fr>
Date: Sat, 06 Jun 2026 15:11:48 +0200
Message-ID: <87pl23q0dn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gbnLiDQ3ccLH+NE9NCcsinWBtn+4hdbQ9GfjomAbWy72s5WExHdoBz7fLNllJQg6Ao5gIgCEz0RDRKuYU2qZJKVcD9HDOBHXSj/3BCXXDs4YqoAZDIjLtA1fSGXOM1hfQSx5WfOLCN4+O2JaP3k9ieFku1Av3tMwn+UjiMvtrq/hCWAq5+Dk3CFpMeBpPI6x3cTEN8iZYefEQ5IwrxREtFptAUfG8pgDoOOOB7jJVMkXN4vrql82qLCBAeekGeYOPKN0PhH2391bGzwXnqxX9n7Oq5A18p0BY5x79W1zPhliT8HHgHIUXuuqvzuHRbw01sMNrUN4vbH7lh4JaOWQsw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=zu1wEN5nhUPIXczYkkxSvXRC2CJCbY5Dy+/4+sUzcH4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=gbnLiDQ3
Subject: Re: [Buildroot] [PATCH] package/runc: needs user namespace support
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

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > Since the runc security bump to version 1.3.5 [1], the TestOci fail due
 > to missing user namespace support in the kernel:

 >   proc/self/setgroups: no such file or directory

 > Like for the docker-engine package, a script check-config.sh is
 > provided to check any missing kernel support.

 >   Generally Necessary:
 >   - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
 >   - CONFIG_NAMESPACES: enabled
 >   - CONFIG_NET_NS: missing
 >   - CONFIG_PID_NS: enabled
 >   - CONFIG_IPC_NS: enabled
 >   - CONFIG_UTS_NS: enabled

 > At least make sure that CONFIG_USER_NS is enabled for TestOci.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/14696525946 (TestOci)

 > [1] e013e2df84fb36985261d7b3c6e6af06afd40f93

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

I did run the docker tests, but indeed not the oci one.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
