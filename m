Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B593AC54FAA
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 13:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F23F38132B;
	Wed, 28 Aug 2024 13:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Ogk68ildBqB; Wed, 28 Aug 2024 13:58:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8FAD81254
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8FAD81254;
	Wed, 28 Aug 2024 13:58:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDA381BF2BB
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 13:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAB2640B0B
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 13:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rClJ5DB4YNZP for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 13:58:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 429EA400C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 429EA400C7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 429EA400C7
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 13:58:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 878F7C0005;
 Wed, 28 Aug 2024 13:58:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjJBl-0055zV-2Q;
 Wed, 28 Aug 2024 15:58:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf> <87r0a994or.fsf@dell.be.48ers.dk>
 <20240828154253.206391b0@windsurf>
Date: Wed, 28 Aug 2024 15:58:21 +0200
In-Reply-To: <20240828154253.206391b0@windsurf> (Thomas Petazzoni's message of
 "Wed, 28 Aug 2024 15:42:53 +0200")
Message-ID: <87ttf47nr6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: michael@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> I would suggest to drop the gzip step and only create the .bmap files
 >> (which presumably is quite fast?)
 >> 
 >> What do you say?

 > I understand your concern, but compression is also what helps in making
 > those sparse images small.

NIT: No, it is the sparseness (E.G. the holes). Compression in fact
breaks the holes (replaces them by zeros):

truncate -s 1G disk.img
du -hs disk.img
0       disk.img

gzip disk.img
du -hs disk.img.gz
1020K   disk.img.gz

gunzip disk.img.gz
du -hs disk.img
1.0G    disk.img

To transfer a file with holes without losing them you need an archival
format that understands sparse files, E.G. tar -S:

truncate -s 1G disk.img
du -hs disk.img
0       disk.img

tar cfSz disk.tar.gz disk.img
du -hs disk.tar.gz
4.0K    disk.tar.gz

rm disk.img
tar zxf disk.tar.gz
du -hs disk.img
0       disk.img

Notice also that the .tar.gz is a lot smaller than the img.gz


 > Of course, as long as you keep them where Buildroot generated them,
 > they are sparse, so they don't take much space. But as soon as you
 > "distribute" them, they usually loose their sparse-ness, and this is
 > where compressing the image + the bmap metadata file helps in lot in
 > reducing the amount of data.

Correct, unless an archival format supporting sparse files is used, so
if anything we should make a tarball of the images - But that is also
not so simple, E.G.:

- Busybox tar cannot extract sparse tar files
- One tarball for everything or a tarball for each image?
- What compression algorithm and parameters to use?

So it very fast ends up in a very use case specific setup, hence my
suggestion to NOT do it and leave such customizations to a post-image
script.

 > But fair enough, I assume this compression can be done as a custom
 > post-processing step by whoever needs it.

Indeed.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
