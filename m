Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1F6CA6002
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 22:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F87A4052C;
	Wed,  7 Oct 2026 22:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgEsseIpMxai; Wed,  7 Oct 2026 22:16:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E793D4052F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791411418;
	b=BCAaN+KAMqXFJD1wvwYZ6n0BNMMeZLB5DSiCEezX+ZTUxW8psvmwKFJXMmBG6NrXvOiX
	 XkR7tN0+cahhKTukNyTP9rKpA44iaFLU3/ucIrzIfqu2waHR8F+O0vZaCbZomHmK7iGRI
	 beAJAUPFHeTPdhmZsLP/GjqzEDx6JmLd98XdjRL0Ntq6zZaGMZO5d/WBqWKDCnO3asAf4
	 SM2wWjNP02FlwXJ0UIe0S3849dEpL/yQwC7rvhOfYQuFjLDxVz86fKuOWNgrCbhU1Sggy
	 3yYayhTOmWd4ZHqeBVNw1Cj+ekiUHD9uMi2xJsNqyn1dOKW2uK8aeeGGM049cV/CQ/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791411418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=10RTYsH6VQn3D2QdsjXyiKja1T72kMjQ4Sa7JSXqwFQ=;
	b=lexThcWoU/LuaRtRDHycTOcS3FrUXiWvT9SEs+RNI58BTICYMdbl4A3K4AUP+YXpegjm
	 KaRpHKKEac2q4PPmS7GoTunwpjFk5jAwRjrpyWOFb8VwBLtDqD0aoAd4hyi89N3ohJp6L
	 gtIMnTPFzuCEXtMFWHTMrmubFC+BMz142sFy0vHz9bpfZg4Gv8NvsbJRqqqg+JRqxVpuk
	 7+CNQb1q3wovz84i8mUvMpIfsXqFxqmJp+55LTqknLlPCI5y0cyP5LKt3BfaPms73cZCn
	 inGQpfStCUmOKIaQqnc28+aKCYrowlE3qJwcJncnqzyxqKth69OBY3AZbbsRyJpWgaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791411418;
	bh=10RTYsH6VQn3D2QdsjXyiKja1T72kMjQ4Sa7JSXqwFQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+Qy54MzRacQ7arP+GmGSyD1HgEnqqxVMuWuT8uop2qc53jOTAULHgD843LZFXzWS
	 oHeKRky0bICu06OfWhT7QoMkRKpPO4MOBehsDdGon1wKSjNjatzsJgxsjWc0E/pKO6
	 pmkwLVWGLDMvNqoItIV64TjAnyJEyIwQf84xbggrJNFijN8B+YWj2vq+eI1ffbjvq8
	 JKWNipOa6GBoZbBGRm6/v2Vh6prTYeottaa9zbfKQVTWti4GZUsW7WSZVtU6LcREF/
	 OvDqdj0a7JbyzY9ukzkQXM9rLAL0gkWYMxX4D1i56kMw431MkA2DPmewmhG/H2jmtP
	 eFk40EqjI17qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E793D4052F;
	Wed,  7 Oct 2026 22:16:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B801F75
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DB6B40080
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QbYoYs1Vg4vg for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 22:11:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 468964004A
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791411075;
 b=U6hlPXP7FEKlAQWAF/DmBEWHmrekEVWxAmH94KJ0kRaPaydAjgdGWhherwFUmqYfVRrQ
 ZT8bdgoqniAWqSBngGbdNSyJKoKHMh14+ni/KThBLc6eX4s4ePBRJoypAQtMsY+XNKCmp
 OtO3swdDWChmpOeB+N1BjigRbLvHaSdqWnX0GMnBtZxBaO5P+X0a9INyhJttOwih4meCE
 riE/4oRI2mHqLcNZs2XQ9ZsoMQnh+E7MqE5JiZpge+iJFqocpErYatcwO/be0QPN920bS
 cyKoEAVowNITwsScs/tUoOIFKEwOwc4lR6846rOcAHAvLeodnviJpWlEUc/esaeHnIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791411075;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=DIopiT5s86bMEQmX8IDUBN6ONNaptdqUs93t7wUfPTM=;
 b=FYPUwzOr1bmqNzI3boAnPzDwYbYzU/h9GoOd5QmfwYS4W6HJZZJwdvC43tBygdKu2sNe
 gvOYNVWej+nTznL7Bo1ioOstixQxyE8HIjcRZl5fg2c91h1Oe+503W1O2x+u5/oejsJOP
 TR01G3jHPtAzCOefmpPZwY2i04FT51gPTvkPEcR17TiUX7TZPfueHf4L44heVWuXjbvRL
 gKgFj5MChuucjqcXKmvuinFGcRVd6G3POTMYK0+8G6wVP+KH6H7P4R80uwYijUD43ogLZ
 9ARUGqZk+vbrn4IkQiZEgihvyz0MX15fW35LgU+odN6d0KTFdhexZMDh/kKHGA6HbrA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=ZPbz8tLF; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ZPbz8tLF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 468964004A
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:11:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=ZPbz8tLFrx2NzuU2V2movXNsgqrjG1J31W89sr9deZGgZjJq1KYNmGI+HojjUGF9maXSGlUjYoUAQyrZMhBPPPMK6bvBbdbSsBEbJUDOsZQSI8HSBtYm8xzUgN4M2TVKcsKH+WYmBKgbgd8C2QkRs2Sc9Qb1ch5mkV/GJh9p9FQ3B1aXtQCBOE1gtnGg4qbHiH1bEUTTOQD+UDZey18M1Jxq2Jo1d8RWQ905Avbowiqa+/JPEdM3+kwhJAiNS97i+jMkCpjlR6/XL7NeJG6X9VCNvUrfnKpZKm1kN4w6bOdSh/lGekzDk2cIa9mcrNY3/ph/hHKKmiKueO80gpSuOw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=jaK8XOpcSh4ToNoVrfvJ39ucFM9rgMM/h1TJC7qqXYo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2050123814; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 22:11:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xEZqu-0000000FDxN-3eLS;
 Thu, 08 Oct 2026 00:11:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20261007195935.1615148-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 7 Oct 2026 21:59:35 +0200")
References: <20261007195935.1615148-1-bernd@kuhls.net>
Date: Thu, 08 Oct 2026 00:11:08 +0200
Message-ID: <87wlrt88lf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.9.0
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

 > https://github.com/libexpat/libexpat/blob/R_2_9_0/expat/Changes
 > https://blog.hartwork.org/posts/expat-2-9-0-released/

 > Fixes CVE-2026-77214 & CVE-2026-102633.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/7f94443e4e632c515950d3489c6af67a6d4ab81d

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
