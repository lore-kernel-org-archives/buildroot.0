Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9657DC021AA
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 13:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B20E40847;
	Fri, 21 Feb 2025 13:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5YeUgsSePfv; Fri, 21 Feb 2025 13:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BECB040BD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BECB040BD9;
	Fri, 21 Feb 2025 13:24:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5C4E194
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAD054028B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLnxKKcHnGk0 for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 13:24:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48A0940194
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48A0940194
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48A0940194
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:24:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70E3944212
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 13:24:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tlT0m-003loL-2n
 for buildroot@buildroot.org; Fri, 21 Feb 2025 14:24:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250221081423.829735-1-peter@korsgaard.com>
 <87ikp3pkd1.fsf@dell.be.48ers.dk>
Date: Fri, 21 Feb 2025 14:24:12 +0100
In-Reply-To: <87ikp3pkd1.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 21 Feb 2025 13:12:26 +0100")
Message-ID: <87eczrph1f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvffufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeejueejueegieeukeetgfelffeikedukeeiueeiudehhfethffhhefgfefgkeejgfenucffohhmrghinhepghhnuhhpghdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gnutls: security bump to version
 3.8.9
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

 >> Fixes the following vulnerability:
 >> ** libgnutls: Fix potential DoS in handling certificates with numerous name
 >> constraints, as a follow-up of CVE-2024-12133 in libtasn1. The
 >> bundled copy of libtasn1 has also been updated to the latest 4.20.0
 >> release to complete the fix.  Reported by Bing Shi (#1553).
 >> [GNUTLS-SA-2025-02-07, CVSS: medium] [CVE-2024-12243]

 >> For more details, see the release announcement:
 >> https://lists.gnupg.org/pipermail/gnutls-help/2025-February/004875.html

 >> Update the license info for a move/rename of license files and a slight
 >> rewording.  The license clarification is now in README.md so also add that:

 >> https://gitlab.com/gnutls/gnutls/-/commit/a8727cdb076287d0a2098ba49d76899b4e70160e
 >> https://gitlab.com/gnutls/gnutls/-/commit/75f5ea80738156b81de30ae9b482a69cf4e77e9d

 >> Drop now upstreamed
 >> 0001-groups-represent-hybrid-groups-with-an-array-of-IDs.patch:

 >> https://gitlab.com/gnutls/gnutls/-/commit/9cc9d5556d258d23a399abfe45715773e719d134

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Committed, thanks.

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
