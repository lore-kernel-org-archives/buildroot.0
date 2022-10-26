Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863F2C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ED9560E07;
	Wed, 26 Oct 2022 21:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED9560E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88A7UxaSuTQG; Wed, 26 Oct 2022 21:20:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DBB060E03;
	Wed, 26 Oct 2022 21:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DBB060E03
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A43951BF31D
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F72460E03
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:20:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F72460E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64EvKB4V4SfT for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:20:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF4CA60E02
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF4CA60E02
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:20:51 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 14C3E320015C
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 17:11:13 -0400 (EDT)
Received: from imap48 ([10.202.2.98])
 by compute3.internal (MEProxy); Wed, 26 Oct 2022 17:11:13 -0400
X-ME-Sender: <xms:cKJZY90VhYY86frzKhziJyLM4UYtPfLj0Wb1mlv0Y67Bepnql5RHXg>
 <xme:cKJZY0H5AO5JtMaaJg8CKk0dF4rr-RyaEvdAvFyCnvljWsbczlgUDe64XpSjGpM4Y
 EZiG_OeDP78-H3Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpeffrghnihhlohcuoehmrghilhesuggsrhhgnhdrtghhqeen
 ucggtffrrghtthgvrhhnpeelffelffetieelhfeugfegjeegledvtdehvdevueeugffgge
 ejteekjedtjeegfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrghilhesuggsrhhgnhdrtghh
X-ME-Proxy: <xmx:cKJZY97eplP43L0-5vobJiRMt0fCho2fx8xncChgUClSK3xt7sA_Vg>
 <xmx:cKJZY63E08fcDe3MaCBrLf-P6DYEkZel7wKrCO23yWHFDps3qkHJvw>
 <xmx:cKJZYwHwnemSs4uAl5PcnZTyhjyZqNbP63KYXlB3kyhxqmXWEF20NQ>
 <xmx:cKJZY0Ht9B4atefMnbKK7GMkQYDXZi2Oj_o7ACJthPVMkJNcmeSAyA>
Feedback-ID: i85804083:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7D01931A0062; Wed, 26 Oct 2022 17:11:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <5ed339df-22c9-4d89-917b-87f7605a084e@app.fastmail.com>
In-Reply-To: <20221012002101.02c1f4bf@c3po>
References: <20221012002101.02c1f4bf@c3po>
Date: Wed, 26 Oct 2022 23:10:51 +0200
From: Danilo <mail@dbrgn.ch>
To: Buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dbrgn.ch; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1666818672; x=1666905072; bh=N61SaJ42LV
 KU7+1VI4C/kwnCJIu5E3lwx0/rN1SCm14=; b=ctgiyPBaMVZ7c+5hMU/LUB7RtF
 ixtU8g4PqgA4ilJbBPpXtSwU9kNC+XM/AiJzJjs2JW//8ljKIbOOmPyDQogtNkPk
 dSNl7jyO9I3EbSoHMtnt/R6VvyvUmgncZAv+k8oFOJLrYO9Cdbe/X1HEqu3UFX53
 /cQdlpbac4Bx4qrDj7vVTuTfzxauteGwWzsTAqtG2FVEz3Da+pbmtJVSRoCLyEqs
 3pjxGPYll0ImIR9rzoGXlWAtdXTUdRRYIW2gJ+E0nWn3KJFW8rMWyR+9O3sU44Ma
 dSIY7p5oTy3RIJ9ewwUANcGLFTwCkzId3Vs15wI14yoUpjpsoroAkrs6Mrkw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666818672; x=1666905072; bh=N61SaJ42LVKU7+1VI4C/kwnCJIu5
 E3lwx0/rN1SCm14=; b=obXrPnZtVE18DA2oEBclnKdcS2dan78bhK4C4GhgQGUo
 MZ9yEd4FkIesEi4tBjyJQKKMRhmAwMLuQM9jrVQj0DPoEhS7GT297LtyHFSMPY3N
 Nr04ZPeVkCbOatEYkIKr/PCK3/uWCusf1N2Fsf98SKiL8i0A/Wv5gERHdL/8ko0F
 c/B0WI9y+cOwIjEGRYwmyTXT9U2KBz/fQaWprszlQzFVcvFZC+kbJk2twlPlT4kf
 AyZF/rUN9PYQHvan7fpocR4c/aw2WJ4kSbpgnk3dgLcJMdnsIpwiUxCEs1cYmY9D
 JvrKEkwbCvsE1kEmhjewUBszBGwQm6eOqdTH0IY+7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dbrgn.ch header.i=@dbrgn.ch
 header.a=rsa-sha256 header.s=fm1 header.b=ctgiyPBa; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=obXrPnZt
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: bump version to 1.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

This patch can be ignored, it has been superseded by the patch that bumps to version 1.6.1.

Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
