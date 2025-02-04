Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D576DC0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 08:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E69541347;
	Tue,  4 Feb 2025 08:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hopYeHKm5t1N; Tue,  4 Feb 2025 08:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 193CA4133C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 193CA4133C;
	Tue,  4 Feb 2025 08:07:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E92512A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81B754114D
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRjQ1NuoZqKd for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 08:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 358F040C22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 358F040C22
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 358F040C22
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:07:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E7E944362;
 Tue,  4 Feb 2025 08:06:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tfDxR-00E1f5-1o;
 Tue, 04 Feb 2025 09:06:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
References: <20250109080130.759117-1-nemaakhilesh@gmail.com>
Date: Tue, 04 Feb 2025 09:06:57 +0100
In-Reply-To: <20250109080130.759117-1-nemaakhilesh@gmail.com> (Akhilesh Nema's
 message of "Thu, 9 Jan 2025 00:01:30 -0800")
Message-ID: <87r04eqgke.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeekgefftdeiveekjeehveetleduteevfeefudetvdekfeejheeitddvhfekffeuteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepnhgvmhgrrghkhhhilhgvshhhsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/radvd: bump version to 2.20
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

>>>>> "Akhilesh" == Akhilesh Nema <nemaakhilesh@gmail.com> writes:

 > - Updated radvd dependencies.
 > Changelog:
 > https://github.com/radvd-project/radvd/blob/v2.20/CHANGES

 > Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
 > ---
 >  package/radvd/Config.in  | 3 +++
 >  package/radvd/radvd.hash | 4 ++--
 >  package/radvd/radvd.mk   | 4 ++--
 >  3 files changed, 7 insertions(+), 4 deletions(-)

 > diff --git a/package/radvd/Config.in b/package/radvd/Config.in
 > index f1df0c3cb8..4149683fc9 100644
 > --- a/package/radvd/Config.in
 > +++ b/package/radvd/Config.in
 > @@ -1,6 +1,9 @@
 >  config BR2_PACKAGE_RADVD
 >  	bool "radvd"
 >  	depends on BR2_USE_MMU # fork()
 > +	depends on !BR2_STATIC_LIBS  # libbsd
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS  # libbsd
 > +	select BR2_PACKAGE_LIBBSD

libbsd also depends on wchar and BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS,
so I added that and propagated to libvirt which selects radvd and
committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
