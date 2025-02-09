Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAE1C02199
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 15:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E04681BE3;
	Sun,  9 Feb 2025 15:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4mf_fQG7Ack; Sun,  9 Feb 2025 15:09:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CBD181AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CBD181AF3;
	Sun,  9 Feb 2025 15:09:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D0426C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1069D605F9
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eB7CjoxNmrYa for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 15:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1F2C605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1F2C605EE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1F2C605EE
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 15:09:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2BABD44283;
 Sun,  9 Feb 2025 15:09:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1th8vf-004861-1F;
 Sun, 09 Feb 2025 16:09:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
 <20250208142327.418271-12-romain.naour@smile.fr>
Date: Sun, 09 Feb 2025 16:09:03 +0100
In-Reply-To: <20250208142327.418271-12-romain.naour@smile.fr> (Romain Naour
 via buildroot's message of "Sat, 8 Feb 2025 15:23:27 +0100")
Message-ID: <87v7tj5f5c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefheegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgesthdttddttdertdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpedukedvheejueehteehudevveejvdethfdtheeuieffvefgieevlefffeeliefhjeenucffohhmrghinhepshhhvghllhgthhgvtghkrdhnvghtnecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhr
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 11/11] package/mdnsd: fix shellcheck SC2320
 for S50mdnsd
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > SC2320 is now reported for $? that always refers to echo or printf
 > since shellcheck 0.9.0 [1]

 > Apply shellcheck suggestion by using a variable to store
 > the start-stop-daemon's return code.

 > [1] https://www.shellcheck.net/wiki/SC2320

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 >  package/mdnsd/S50mdnsd | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
 > index 13b65d0c69..d022f9a664 100644
 > --- a/package/mdnsd/S50mdnsd
 > +++ b/package/mdnsd/S50mdnsd
 > @@ -37,6 +37,7 @@ reload() {
 
 >  case "$1" in
 >  	start|stop|restart|reload)
 > +		RC=$?
 >  		if "$1"; then

This looks wrong. The intention is presumably to capture the exit code
of "$1".

I've instead reworked it similar to the logic in S40iwd:

"$1"
status=$?

if [ "$status" -eq 0 ]; then
      echo "OK"
else
      echo "FAIL"
..


exit "$status"

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
