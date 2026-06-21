Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC2ECD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 19:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C0124EF1B;
	Sun, 21 Jun 2026 19:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOjxiYOgHADj; Sun, 21 Jun 2026 19:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F7BE4EF0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782070681;
	bh=9IO98jKJnSXsFFVxBeZ2qpYZ0OujEUOojGbC67gW+zs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rr6JrBd1hJZpYOjWlGO/R5k4T09tLJRI4vnJgeKwGKcAuHJ+hGvciYrxMmdvS4C/a
	 fTgKoQsVba04TgPDNgkQYvrhZ0ABdevtrE4VTR1mcNGm+Sc3o4MpeLSixhyFx8le0B
	 Dpp1bHgo4fky+9zipgDjmKsJy+hRqMAus05LAAbXLsDgJHBT6z3PeoGeBdlcJ3+wLa
	 Xi+NGMElxQy2tXHmL5YEfPdd+tH9Bh8W7hgVuoTFsR7np9xHj/oXzNMYjEJXP1I5DO
	 A80CDIzH5zo1/iFb85kFZQcJYAdN+zI7+gNMwoxBmajELt1B7w5WpJ7g+EsyzJyAVQ
	 gErJE437ozX6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F7BE4EF0B;
	Sun, 21 Jun 2026 19:38:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AE2324D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C73A4020B
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:38:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmw94NiUSsyS for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 19:37:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 408594014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 408594014E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 408594014E
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 19:37:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1578780264; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 21 Jun 2026 19:37:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wbNzN-0000000EBmb-2IJe;
 Sun, 21 Jun 2026 21:37:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260619143024.3664850-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 19 Jun 2026 16:30:24 +0200")
References: <20260619143024.3664850-1-bernd@kuhls.net>
Date: Sun, 21 Jun 2026 21:37:53 +0200
Message-ID: <87h5mvadm6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=GvpWlnb+VO2G0vqMFM3wUcWVAVdCRHKIfp8FgkP78p8bsL/jmI6eYUgzEshLvNQCBKXXuBwUDiTvclKh38HkbPhkaWJotwCJcEhIuIVlsLaKbRYT9smmydQQ3pcI0hu7GXeaee1HgWLysLqV8Lwp1m6ODxtpwYRlYO6SuB+jyr/edqxNdlIcvo3jubojlRBxg0It0slt+0EsCL0l52igOYrd84UsdgbX4WxdOixPza5JDENMN0oYnpK0BqOY4YgMA79/hjvvV3j5mVYENM2k6Y55V0BcW/Gn2vZe+575TsyzQ/mEruNZNOLsFEho9j4IC5Qof5c95ArYmAVUm2c0BQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Ujl9x3QAKhLUW3/iT7qKH2/ALl3+2MBRsQRcLIGt/Fc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=GvpWlnb+
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-lib: bump version to
 1.2.16.1
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

 > https://www.alsa-project.org/wiki/Changes_v1.2.16_v1.2.16.1
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/0115e3c2ef3952dba6db5367ec30514c0831e6af

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
