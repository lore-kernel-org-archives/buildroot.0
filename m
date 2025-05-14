Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46603C3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 12:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA30A8133B;
	Wed, 14 May 2025 12:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRI_Fn3vRKlm; Wed, 14 May 2025 12:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB648129B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBB648129B;
	Wed, 14 May 2025 12:57:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06654150
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E062C60A8F
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkwCcm_tMvXU for <buildroot@buildroot.org>;
 Wed, 14 May 2025 12:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FEDC60865
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FEDC60865
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FEDC60865
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:57:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6713143B16;
 Wed, 14 May 2025 12:57:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uFBfn-003Ugq-0v;
 Wed, 14 May 2025 14:57:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250509191040.253049-1-ju.o@free.fr>
Date: Wed, 14 May 2025 14:57:23 +0200
In-Reply-To: <20250509191040.253049-1-ju.o@free.fr> (Julien Olivain's message
 of "Fri, 9 May 2025 21:10:40 +0200")
Message-ID: <87a57ftkng.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdejtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpefhleetvdethfehieehhfegteejvdeljeejvdetveehkeeihedvffdtgeejjeeufeenucffohhmrghinheptghvvgdrohhrghdpghhithhhuhgsrdgtohhmpdhtuhhkrggrnhhirdhorhhgpdhgihhtlhgrsgdrtghomhdpohiilhgrsghsrdhorhhgnecukfhppeekledrgeejrddvvddurdegjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekledrgeejrddvvddurdegjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhhurdhosehfrhgvvgdrfhhrpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/xz: add security patches fixing
 CVE-2025-31115
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

 > This commit adds four upstream patches fixing the CVE-2025-31115
 > vulnerability. The reason there is four patches instead of one is to
 > exactly follow the advisory recommendation [1], which proposes the
 > patch [2]. This patch is in fact a concatenation of four commits. In
 > Buildroot, we track package patches as formatted by git, with extra
 > "Upstream:" headers. The patch [2] was split here in four for a
 > clearer traceability.

 > With the addition of those patches, the XZ_IGNORE_CVES is set
 > accordingly.

 > Fixes:
 > https://www.cve.org/CVERecord?id=CVE-2025-31115

 > [1] https://github.com/tukaani-project/xz/security/advisories/GHSA-6cc8-p5mm-29w2
 > [2] https://tukaani.org/xz/xz-cve-2025-31115.patch

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/9989403875

 > Note: I am aware that another security bump was proposed in:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20250501092633.84651-1-kadambini.nema@gmail.com/
 > This proposal is including both the major version bump (from 5.6.4 to
 > 5.8.1) and the CVE-2025-31115 security fix. This makes LTS branch
 > maintenance harder.

 > I propose this patch instead to help the LTS branches. The 5.8.1
 > bump can be applied right after.

Agreed. Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
