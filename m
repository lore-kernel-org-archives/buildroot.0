Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F32DCA5FFF
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 08:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CDA406EE;
	Wed,  7 Oct 2026 08:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKd4879O2itM; Wed,  7 Oct 2026 08:16:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 573FF405A5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791361003;
	b=KHsDjLw2qePkM2JMLtpaIX00O6fmVmn3KOiSLe12ZVhZsOukBMxq5g1QQYNBvYqmpqln
	 vm9skCsFmfd366fozluN9agPOFNzvTKG+mbTTN3k+AsuZy+GrQYm+jC07XXPA7Uyk8lGO
	 MEXuyedw3FEmMWivzVQ3Jy19FVJT80i93dJrMvMCfd+5qOggVCXl7Qh0UOlx1uyIm/tv+
	 LvqtFSKL5REGYdnzeoTn7gh5wq6oaJ4a+L8hZ3xVBa2hauc48963xqIzBx031tYv8vGCs
	 plkLwbtPtWKre+9/6KhjRgoH+5REz5ZykbEs8c7e0por0EQjhQnlfed+GntK3EjDfsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791361003;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iGyvmS8HJveYX41GHpxD97QaoJlrB3aG2v69tBso1NY=;
	b=csePEq2O8Uc1BypYiAMlUtrkYcvYu4aXF6vNMIKV/0GoR0L5713D7+1i4vfWwxPom/Ba
	 MISD/ziLc73yO8EwS+GOD520P8D+cUmG/cZuLw6YhgF5indsjejbcwD3K1W6PDtCGoY5v
	 SzhxNf/PO5e3SIsZU6sM447C6PNSyVVaEytndUYWZDEGo/fWxUue2CXH33Ymvh0nqUnmo
	 qFjkZGJ7R58wRT0v7GXu3ViO8o6CbL7gQPyDymNrPj3ZddDnIYd8D45moqg+I2GjOnV1g
	 PybZUItpQyzH6FtPmCrHMETFGtrpvFU9I3cSQAdR1zV/397UQ4s9FZulMsh2VXJ7Mgw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791361003;
	bh=iGyvmS8HJveYX41GHpxD97QaoJlrB3aG2v69tBso1NY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MHO9YSaa0RJpKPhfH6+e5gjlkCweJY5MYXrc072Ht4+z1Hi4Eiyhu4+4i9PVYjSMn
	 1iQ84LxV/7+9vwDTNEcJpczo4r2iayDXZTtmVD7tH7O8PPUZ422zrc40U+4OhsqI7R
	 jzQKSL3v6mjEf0gGREPePdf8oEiR0zLFYX1T9dbAElcUIQtQJ0VLZnjAnsqxdr0cJV
	 L5QHmFc6rvoZGyAFbYVfmgNNfw66w1a1B5Z2W45Sp2QUqPV94XtPUh+WBjV4p4HwPV
	 Q9bTWUoqI9SI33GA0NiQ9UT3nGV++koqv0KXLvFif+EgcKBc/Mh95Lq/LfkFIWLaQ+
	 mD7AHIvgsHE4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 573FF405A5;
	Wed,  7 Oct 2026 08:16:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65CB232F
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B51E406A3
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:08:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmkEVKeKyk0H for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 08:08:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4B56C40562
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791360499;
 b=UUIRSZXnPh+R50pN2Q2Q5bDmsWjcII1LVQ561DBJ83FbEVVCY+W8A2dvlLaqkbzfI+MB
 y6IfKYS55T952DV4FYrR3BtNucessuXqPe43vfuPH3aMnytYEgEm31OXaMghbiOHGx7Fe
 Gvw/wgdEZTb9tGePUilP6uwf6AFbtRppHhhstPRFN3A4npz3/oab1RHWvXQ7THTid04Uz
 /KqM93mmFNQ9O6XopqK6Pru/Qn5G35ihqRpRH2viaPqW3g81PnrYCY+rKKjDM1xrkhWbF
 sUhk1OvRhGTFRjDEasydbmW2Ct9emJ8t4BOagE63zzzU71AmxFtqC3i9+8KC6GRhWZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791360499;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Lsf3ewxDWDpqo29mmTfVDQRijs4jG3fAeGokc4KvVno=;
 b=clfQl4adfXKASsA3X88lESFh1UbEZ6OHolU5IjnG6r7cddYYwf5bKnYz5msBV6XdieS8
 0IzE+Yn/LM8dSf0Ex29Hp/hJ0591yz6aQ1gzv6HcHr5HRsKJr3DQtwkSu14NvSO0MV+PU
 vaQdrI2FaTu+SKzwbf1gJaPpRIvqmK04HGxONbRkhJjQKa8DLsoDyw4nRS/9Vrm7MKzRH
 Bil6Irz11uGCKgUtvnrnzAACa51plWKzAHOynBLSgtmvQkYXpcZz2NqYh9bCp3DqpB0iJ
 J8/27cXKKVBw06yNjIxLRg0kuWOOLlLLzlGTiU4uDRxxZc+x5hokhZLDARWkD3ucMOQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=HRQD9ztN; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B56C40562
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 08:08:18 +0000 (UTC)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A07C34E411A6;
 Wed,  7 Oct 2026 07:58:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AA506075C;
 Wed,  7 Oct 2026 07:58:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6647510332C84; 
 Wed,  7 Oct 2026 09:58:24 +0200 (CEST)
Date: Wed, 7 Oct 2026 09:58:23 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asX7mjz_1woqApr2@windsurf>
References: <20260929090753.3570630-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929090753.3570630-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] utils/genrandconfig: reject qemu user mode
 on hosts with large pages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Sep 29, 2026 at 11:07:53AM +0200, Yegor Yefremov via buildroot wrote:
> Qemu in user mode cannot load target binaries laid out for 4k pages
> when the host uses larger pages, as the 16k pages of the Asahi Linux
> kernel on Apple Silicon. The dynamic loader then fails with e.g.:
> 
>   GLib-2.0: error while loading shared libraries: libz.so.1: failed
>   to map segment from shared object
> 
> or, depending on the target:
> 
>   qemu-aarch64: .../GLib-2.0: Error mapping file: Invalid argument
>   torque: error while loading shared libraries: libz.so.1: ELF load
>   command address/offset not page-aligned
> 
> This hits every package running target code through qemu at build
> time, i.e. gobject-introspection and nodejs, on mips, sparc64 and
> aarch64 alike, and is not something Buildroot can fix in the
> packages themselves.
> 
> As this only depends on the build host, reject such configurations
> in genrandconfig when the host page size is larger than 4k.
> 
> Fixes:
> https://autobuild.buildroot.org/results/4848e735fe83dfeef4f24d32655c567951fd113a (mips)
> https://autobuild.buildroot.org/results/089ddac5bdaaf5650cbc5c26d48952b5bede0ca6 (sparc64)
> https://autobuild.buildroot.org/results/c30c6719a0350370ebe3cfe262123727f4057734 (aarch64)
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5-5

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
