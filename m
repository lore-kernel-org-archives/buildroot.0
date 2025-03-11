Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21875C28B2F
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 18:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC1D60AAD;
	Tue, 11 Mar 2025 18:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daXkIqQbzekj; Tue, 11 Mar 2025 18:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD31A60B05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD31A60B05;
	Tue, 11 Mar 2025 18:07:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 701FA1DB
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F25160B05
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w92EkF9oH4OW for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 18:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C8F3606DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C8F3606DE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C8F3606DE
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 18:07:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0528D43349;
 Tue, 11 Mar 2025 18:06:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ts40G-004FUO-29;
 Tue, 11 Mar 2025 19:06:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: buildroot@buildroot.org
References: <20250311101301.3583028-1-daniel@0x0f.com>
Date: Tue, 11 Mar 2025 19:06:56 +0100
In-Reply-To: <20250311101301.3583028-1-daniel@0x0f.com> (Daniel Palmer's
 message of "Tue, 11 Mar 2025 19:13:01 +0900")
Message-ID: <87plinfnlr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddvledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtsehttddttddtredtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepfefgheefledvfffgledujeefiedvjeeigfffteevheekgfejfeevhfeiheehjeeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepuggrnhhivghlsedtgidtfhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/prboom: Fix big endian fix up
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

>>>>> "Daniel" == Daniel Palmer <daniel@0x0f.com> writes:

 > The hack to force big endian support when building
 > for a big endian machine doesn't work as there is
 > some whitespace between "#" and "undef" in config.h.

Ahh, indeed. The config.h in the tarball has #undef, but when it gets
regenerated by configure it ends up as '/* #  undef WORDS_BIGENDIAN */'

 > Add a wildcard between those two so that the target
 > line matches and the replacement is done.

 > Allows me to play DOOM on my LC475.

Wow, thats old ;)

 > Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Committed, thanks.

> ---
 >  package/prboom/prboom.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
 > index c1ba05ff7035..fc440e5cf8d3 100644
 > --- a/package/prboom/prboom.mk
 > +++ b/package/prboom/prboom.mk
 > @@ -40,7 +40,7 @@ PRBOOM_CONF_OPTS = \
 
 >  # endianness detection isn't used when cross compiling
 >  define PRBOOM_BIG_ENDIAN_FIXUP
 > -	$(SED) 's,.*#undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
 > +	$(SED) 's,.*#.*undef WORDS_BIGENDIAN.*,#define WORDS_BIGENDIAN 1,g' \
 >  		$(PRBOOM_DIR)/config.h
 >  endef
 
 > -- 

 > 2.47.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
