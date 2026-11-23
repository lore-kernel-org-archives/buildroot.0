Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC2606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 18:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jANvAvWN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=SQR40zE0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BEDC40568;
	Mon, 23 Nov 2026 18:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dz4ZYp-CfBpr; Mon, 23 Nov 2026 18:55:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 88ACF404F9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795460135;
	b=qEgpailMaMv3tH6Eygj70n2h7kVDgqAGsbd7eKspyfgeX6pl9xCmDEHxmFSv/6a6Vggv
	 39P6GnKmFoyZ1VQHrjIsg3ezvXo6dssHDX7gf43Q41ZJnNBlyoNbWM3ktrLO5rWG9kI6x
	 OUE68k+NGfQB8C+dEK1j05Ted/AhEloj+OgaLB7Mr+7xucHOl8mK9YeLr0oxtUkA7MioS
	 e0broAsJGOLmuNWdgXiw975q1Y9y983CqVJtR8T3T8FxG2FkepohBP5UCAlTkWtxqp/2h
	 Fhlp6Dar9pDJGDOw9Q4P0c3ItB7VoQnV81baKDSkZoImQZq/vM25IKO/QdmxWV/VXog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795460135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ugqtQA0t3qiFmN9A+r5SDfRsiqx4g17ijSVW467xAI8=;
	b=o6THahHx7PJQp9skK3SkHUJCF3vTMxA8w41blFEZpHImDuMs3AZK0MRBsaKd3gS21sNg
	 dgOHjqLHeYHS5pFQvIYrIJpwUEH++CVDMROSF5G2chZZH9KstOLyUFNw5IZtzjUVSQyOA
	 S0T9JCdeaeARMOlt3QqM/nVvG0r/CespjvbsY4EQdbQy7+cSRxjHKJPV0XaLPFUn+lfhB
	 WOepavhRm+EqWqYJjfM1xTPncbECL4gUJb4JpRsCGyEUeKyi+tO4uYmKWG18LWa9DVRqb
	 w/hJVAzP407pAHI0ubAHynSDiolWCjMiFwJerub+qtk1WAcQZJXKHQqcZvo5a8RuDyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=SQR40zE0;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795460135;
	bh=ugqtQA0t3qiFmN9A+r5SDfRsiqx4g17ijSVW467xAI8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jANvAvWNZMjxwVK17VXfKgtg4t2C4/3/aE5i3p8CwqLt0Qj5nnyu+KB8hqSAO3eQ9
	 ggAS/cBrsRbU0SzoB1nMhlgZmBX0HzR8o7dmHI1DCE4aUR1TqLEbSCo7G3Bjd96Fca
	 qxKzX+SYh6uWPzYXj0XU3WTfK5A4vhw1QNVxIiGk+SVl2eNkDXhY+cxnN4TOb7r8ol
	 TtVFjYQy8tdzd75/5TGBL3pxFkYjtTGTEjyzjZAiM6QgONWY6QPr358JW1nDS42ZT1
	 QoOy3sOIcgnGbMViy1AQQQDsQzoiFRN0A7mdECZ2QYc3nyG8auRUNcXynQQK4pG6XU
	 4FArs+Ck1ASSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88ACF404F9;
	Mon, 23 Nov 2026 18:55:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E46F922B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6362404F9
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3m5mH9dQiA16 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 18:55:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C2DD640483
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=SQR40zE0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2DD640483
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 18:55:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=SQR40zE0cn8YAe2J8FKlzxlpbhAi1omj0fOz2/lUDepYMrIq9sH+JeaaNpcBfqLCnlRjqFjPCBeZvWYVJMum0S9MZh5t6+nojZRSC8qgjypXv/p8mUxu2NIo09drWFaehVNmRZ2E+yBnRONuSKa5+ozpksVrL3oPijMaFkt0Z9TT7A72X81lqlldm+Lv/Jlw1Ig/N24E5+e6qu5MdtZ+Ff+0XMF8/Et2IzoHV1hFnssgVFTqyfWFj7obwWZXR+oJnVvEJrd1UHfKcY7o3dlad1oYlsPP/oeIviH5qKkS2xP9u0mxx1GCWw7uUZxzeYv42XgXAvZOSHx6e1OHBbLm/A==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=UJk0x1daOvCdFp+HkhboZwJzHmGZC80wWKTsIqR/ZkI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1154774191; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 23 Nov 2026 18:55:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xVZCI-000000089xM-3wjr;
 Mon, 23 Nov 2026 19:55:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org,  Charles Hardin <ckhardin@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261123182317.2826593-1-angelo.compagnucci@gmail.com> (Angelo
 Compagnucci's message of "Mon, 23 Nov 2026 19:23:17 +0100")
References: <20240326042522.34109-1-ckhardin@gmail.com>
 <87plsyhwx2.fsf@dell.be.48ers.dk>
 <20261123182317.2826593-1-angelo.compagnucci@gmail.com>
Date: Mon, 23 Nov 2026 19:55:26 +0100
Message-ID: <87fqwrl6n5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: add qt5tools
 as a dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Hi all,
 > This patch is still "New" on patchwork, but it is already applied:

 > - master: c107dd33e679 ("package/gstreamer1/gst1-plugins-good: add
 >   qt5tools as a dependency"), in 2024.05 and later releases;
 > - 2024.02.x: as Peter wrote above.

 > It is also in the 2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x and
 > 2026.08.x branches.

 > Accepted: https://patchwork.buildroot.org/project/buildroot/patch/20240326042522.34109-1-ckhardin@gmail.com/

Marked as accepted in patchwork now, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
