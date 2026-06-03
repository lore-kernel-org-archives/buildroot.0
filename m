Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306EECD6E4A
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 07:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0D2841C4;
	Wed,  3 Jun 2026 07:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pok_ZKOeFBC9; Wed,  3 Jun 2026 07:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B453841C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780473382;
	bh=Z/bOcfo4+HVi4QxyeD1g/J7EPuTglkZh2qTYYaK8Z5Y=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PH543i98xfmjaf1f93Yk5JbDscrKNFKCqMa4emMF804Sbd6dmAU0rp0+pnBOTRcaG
	 t+1/YEcmLQX2HrescJzq3ngOfNP16PNpDFgU4QcTKUTvXECImi1jZGwV3/L/DxoCtz
	 jr/9UMrRhv9wXCCjJ7pHodnona5eJE2X6uSXv83fXOQbySzAZSE/WAlnIiwtQmlRGG
	 MkEr61bpfzVqKliTkpjEoYX291Vcb5usbvf+V66Vst3JS2N8jtH+iC8PHu+6No+eJw
	 iNI9gggAVKf8c/Xsuwp3V6TifsLD0vZFuhW7/rLZPn+g1DnpBjTMHYYYuT1XvhLZv2
	 ekxSgjWAbDhvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B453841C6;
	Wed,  3 Jun 2026 07:56:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDE37192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D16A461162
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqLre2RiOiH6 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 07:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE41960FA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE41960FA4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE41960FA4
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 07:56:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1650068168; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Jun 2026 07:56:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wUgSX-0000000CH04-13wd;
 Wed, 03 Jun 2026 09:56:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Thomas Perale <thomas.perale@mind.be>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>
In-Reply-To: <20260602202443.54352-1-thomas.perale@mind.be> (Thomas Perale via
 buildroot's message of "Tue, 2 Jun 2026 22:24:43 +0200")
References: <20260602202443.54352-1-thomas.perale@mind.be>
Date: Wed, 03 Jun 2026 09:56:17 +0200
Message-ID: <87v7c0oy5a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=c8h7pi5vIisO6w5XnAxwOzrR+3LODRGM4XB96NahFRvu3dH700MC0H16F06d6RGgCcZW9oAliebSVtWV+Vn63tj1P1xpQFLgspQsQUmBmvJdWboYxkWl20kMilqu8DY2Dts5yxE5jLWDY0ubczAD3E8h9bQFq02xdbg2xVqOydayCIkbWEcqfOs8fVXnU0xDdR9kG/5RLXLMypwZPlrfFAVciuybqsqP74iC5J32Qkyjs93WJF24r2mfSiFpcAQg/2wEjcGgt9sUOD4zW5TO6LEmFK+FbMYozcIptfHgJsQ2ci4Dv8ouJgqJskyF7XCbPyvM0SAdgRMWzSApDS5hHg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=9RZNwnw0FjvoIFkYKz/1kEn+ucCmf53xRBx4J9bRo3w=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=c8h7pi5v
Subject: Re: [Buildroot] [PATCH] package/unzip: patch CVE-2021-4217
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

>>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:

 > The patch is provided thanks to the Ubuntu community.
 > - CVE-2021-4217:
 >     A flaw was found in unzip. The vulnerability occurs due to improper
 >     handling of Unicode strings, which can lead to a null pointer
 >     dereference. This flaw allows an attacker to input a specially crafted
 >     zip file, leading to a crash or code execution.

> For more information, see:
 >  - https://www.cve.org/CVERecord?id=CVE-2021-4217
 >  - https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
 >  - https://bugs.launchpad.net/ubuntu/+source/unzip/+bug/1957077

 > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > ---
 >  ...erence-and-use-of-uninitialized-data.patch | 57 +++++++++++++++++++
 >  package/unzip/unzip.mk                        |  3 +
 >  2 files changed, 60 insertions(+)
 >  create mode 100644 package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch

 > diff --git a/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch b/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
 > new file mode 100644
 > index 0000000000..4f9c4c1858
 > --- /dev/null
 > +++ b/package/unzip/0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
 > @@ -0,0 +1,57 @@
 > +From 731d698377dbd1f5b1b90efeb8094602ed59fc40 Mon Sep 17 00:00:00 2001
 > +From: Nils Bars <nils.bars@t-online.de>
 > +Date: Mon, 17 Jan 2022 16:53:16 +0000
 > +Subject: [PATCH] Fix null pointer dereference and use of uninitialized data
 > +
 > +This fixes a bug that causes use of uninitialized heap data if `readbuf` fails
 > +to read as many bytes as indicated by the extra field length attribute.
 > +Furthermore, this fixes a null pointer dereference if an archive contains an
 > +`EF_UNIPATH` extra field but does not have a filename set.
 > +
 > +Upstream: https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
 > +CVE: CVE-2021-4217
 > +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 > +---
 > + fileio.c  | 5 ++++-
 > + process.c | 6 +++++-
 > + 2 files changed, 9 insertions(+), 2 deletions(-) 
 > + 
 > +diff --git a/fileio.c b/fileio.c
 > +index 14460f3..1dc319e 100644
 > +--- a/fileio.c
 > ++++ b/fileio.c
 > +@@ -2310,8 +2310,11 @@ int do_string(__G__ length, option)   /* return PK-type error code */
 > +             seek_zipf(__G__ G.cur_zipfile_bufstart - G.extra_bytes +
 > +                       (G.inptr-G.inbuf) + length);
 > +         } else {
 > +-            if (readbuf(__G__ (char *)G.extra_field, length) == 0)
 > ++            unsigned bytes_read = readbuf(__G__ (char *)G.extra_field, length);
 > ++            if (bytes_read == 0)
 > +                 return PK_EOF;
 > ++            if (bytes_read != length)
 > ++                return PK_ERR;
 > +             /* Looks like here is where extra fields are read */
 > +             if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
 > +             {
 > +diff --git a/process.c b/process.c
 > +index 5f8f6c6..de843a5 100644
 > +--- a/process.c
 > ++++ b/process.c
 > +@@ -2067,10 +2067,14 @@ int getUnicodeData(__G__ ef_buf, ef_len)
 > +           G.unipath_checksum = makelong(offset + ef_buf);
 > +           offset += 4;
 > + 
 > ++          if (!G.filename_full) {
 > ++            /* Check if we have a unicode extra section but no filename set */
 > ++            return PK_ERR;
 > ++          }
 > ++
 > +           /*
 > +            * Compute 32-bit crc
 > +            */
 > +-
 > +           chksum = crc32(chksum, (uch *)(G.filename_full),
 > +                          strlen(G.filename_full));
 > + 
 > +-- 
 > +2.25.1
 > diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
 > index 5436c7a46c..129b749a9e 100644
 > --- a/package/unzip/unzip.mk
 > +++ b/package/unzip/unzip.mk
 > @@ -51,6 +51,9 @@ UNZIP_IGNORE_CVES += CVE-2019-13232
 >  # 0028-cve-2022-0529-and-cve-2022-0530.patch
 >  UNZIP_IGNORE_CVES += CVE-2022-0529 CVE-2022-0530
 
 > +# 0032-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
 > +UNZIP_IGNORE_CVES += CVE-2022-0529 CVE-2022-0530

This looks to be a cut'n'paste error. I changed it to CVE-2021-4217 and
applied, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
