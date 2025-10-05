Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9811ECAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70DE340981;
	Sun,  5 Oct 2025 13:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5C8raL2QlVQH; Sun,  5 Oct 2025 13:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA40240719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA40240719;
	Sun,  5 Oct 2025 13:31:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD22226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825D0400C4
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tT99o8oa8gm2 for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72CE040965
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72CE040965
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72CE040965
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:31:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 852954357; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:31:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5OpV-00Gl9Y-2C;
 Sun, 05 Oct 2025 15:31:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <20251004155057.1520336-1-dario.binacchi@amarulasolutions.com>
Date: Sun, 05 Oct 2025 15:31:13 +0200
In-Reply-To: <20251004155057.1520336-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sat, 4 Oct 2025 17:50:57 +0200")
Message-ID: <87qzvh3272.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=YbcvF8Z6HlIu6Aet4kfKJmn/ikaEZxm8E3fqhJFaUlG6qxTBR78SjnmoCvIjOEoQT6mDQVFV5N9cNx72ZMHCFR5iBLBEg/CqQBVPDQSE0STWNqDh0osAX+cV2JmJecDKIe3KuhGWJso9Ms5mBZx54r7/RZxrUJwGow5D/RVYFuLbA6ohoi/IA+4J0o0ILGh2HTykeIth/ybmwlZaO+akkR/C/hqBRK8f/ityFUmJE0ZGFk6/LXDMojOeE/NLsPIAx2B3VWMQGyCFEhTTHabk/lTSaV4mHTZORPT7wmQ8okSuTfr0npQdYZMUycZZjKZ3W6ToOOxUtNS0DYT4GthyvQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=pLxsSiylmIJqf1fs1/kUjElKEKvrohOtbCcg3xREPko=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=YbcvF8Z6
Subject: Re: [Buildroot] [PATCH 1/1] package/fio: bump version to 3.41
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > For change log since 3.38, see:
 > https://git.kernel.dk/cgit/fio/log/?h=fio-3.41

 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
