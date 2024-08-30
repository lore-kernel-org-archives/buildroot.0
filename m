Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDE1CA0EE7
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 07:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C225441884;
	Fri, 30 Aug 2024 07:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTbHrOEcKs-u; Fri, 30 Aug 2024 07:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 832374188A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 832374188A;
	Fri, 30 Aug 2024 07:14:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48BD91BF846
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 07:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 363224031F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 07:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4G_JpC2T1dN for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 07:14:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 552FC400FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 552FC400FF
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 552FC400FF
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 07:14:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B684FF806;
 Fri, 30 Aug 2024 07:14:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjvq9-007uIh-2m;
 Fri, 30 Aug 2024 09:14:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf> <87r0a994or.fsf@dell.be.48ers.dk>
 <20240828154253.206391b0@windsurf> <87ttf47nr6.fsf@dell.be.48ers.dk>
 <20240829234416.4131264b@windsurf>
Date: Fri, 30 Aug 2024 09:14:37 +0200
In-Reply-To: <20240829234416.4131264b@windsurf> (Thomas Petazzoni's message of
 "Thu, 29 Aug 2024 23:44:16 +0200")
Message-ID: <87le0e32jm.fsf@dell.be.48ers.dk>
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

 >> NIT: No, it is the sparseness (E.G. the holes). Compression in fact
 >> breaks the holes (replaces them by zeros):

 > You didn't understand my point, and Arnout explained it better on the
 > chat.

 > My point is that it is *very* easy to lose the sparseness. You copy the
 > file around, you share it in Google Drive, or download it over HTTP or
 > what not, and bang the sparseness is lost.

Sure, but that is all about distribution, where as mentioned before you
may want to compress it with gz/xz/zstd/.. and/or stick it in a sensible
archival format like tar, ..

The specifics of that is very use case specific, so IMHO not something
where we should enforce silly old .gz - Especially as bmap supports a
number of different formats (by shelling out to the extractors). From
bmaptool/TransRead.py:

This module allows opening and reading local and remote files and decompress
them on-the-fly if needed. Remote files are read using urllib (except of
"ssh://" URLs, which are handled differently). Supported file extentions are:
'bz2', 'gz', 'xz', 'lzo', 'zst' and a "tar" version of them: 'tar.bz2', 'tbz2',
'tbz', 'tb2', 'tar.gz', 'tgz', 'tar.xz', 'txz', 'tar.lzo', 'tzo', 'tar.lz4',
'tlz4', '.tar.zst', 'tzst'.
This module uses the following system programs for decompressing: pbzip2, bzip2,
gzip, pigz, xz, lzop, lz4, zstd, tar and unzip.


 > Instead, with a compressed file, you get a file that has pretty much
 > the same size as the sparse file, but you can move it around, transfer
 > it, it won't consume its real size. And the bmap metadata file allows
 > to use/flash that compressed file with the same efficiency as the
 > original sparse file.

 > In fact, bmap is quite useless is the file sparseness is retained:
 > instead of using bmap metadata, you could just ask what are the holes
 > of the file and skip them when flashing. So really the whole point of
 > bmap metadata IMO is that they allow to do fast flashing (skipping
 > holes) even if the sparseness of the file has been lost.

Does such a tool exist? I am not aware of one. If so, maybe we should
recommend that instead of dd for writing sdcard.img from the host?

Anyway, I find bmap a bit half-baked, E.G. rather than wasting time (and
space) compressing and decompressing all the holes that are then just
ignored it would make more sense to have a file format encoding the
holes (E.G. tar --sparse or something custom), then optionally compress
that for transmission and have something small and simple (E.G. not in
python) on the host/target to write it to a device.

But oh well, it is what it is. I don't need such a tool often enough to
care to write it ;)

I'll send a patch to drop the gzip step from genimage.sh.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
