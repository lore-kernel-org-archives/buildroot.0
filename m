Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B9FC021B8
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 07:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FCBC4048B;
	Tue, 25 Feb 2025 07:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHvuHsAhykob; Tue, 25 Feb 2025 07:14:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E821140BE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E821140BE5;
	Tue, 25 Feb 2025 07:14:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C65A72DE0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 07:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95DF340BC2
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 07:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMRZC8JRtR1a for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 07:14:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D69854048B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69854048B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D69854048B
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 07:14:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 282E944285;
 Tue, 25 Feb 2025 07:13:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tmp8d-000xm1-0h;
 Tue, 25 Feb 2025 08:13:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250222104220.1342617-1-peter@korsgaard.com>
Date: Tue, 25 Feb 2025 08:13:55 +0100
In-Reply-To: <20250222104220.1342617-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 22 Feb 2025 11:42:20 +0100")
Message-ID: <87mseav6mk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekuddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeeghfdvueekuefgteetjeeltdegleegieduleekffejtdeiheehveejteelgedvkeenucffohhmrghinhepghhnohhmvgdrohhrghdpohhpvghnfigrlhhlrdgtohhmnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehtvgigihgvrhdrphhjvdesghhmrghilhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libxml2: security bump to version
 2.13.6
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

 > Fixes the following security vulnerabilities:
 > [CVE-2024-56171] Use-after-free in xmlSchemaIDCFillNodeTables
 > https://gitlab.gnome.org/GNOME/libxml2/-/issues/828

 > [CVE-2025-24928] Stack-buffer-overflow in xmlSnprintfElements
 > https://gitlab.gnome.org/GNOME/libxml2/-/issues/847

 > Null-deref in xmlPatMatch
 > https://gitlab.gnome.org/GNOME/libxml2/-/issues/861

 > https://www.openwall.com/lists/oss-security/2025/02/18/2

 > Drop now upstreamed patches:
 > https://gitlab.gnome.org/GNOME/libxml2/-/commit/fc72e0833a4e5724aef604e2fd9adb1014cb4844
 > https://gitlab.gnome.org/GNOME/libxml2/-/commit/539663626b91567159a70791c0f2b3b167135e9b

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2024.11.x, thanks. For 2024.02.x I will instead bump to
2.12.10, which contains the same fixes.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
