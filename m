Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227D606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mefufOVH
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45594051F;
	Sun,  1 Nov 2026 16:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSRagQJ651Bp; Sun,  1 Nov 2026 16:39:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF6A84048A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793551189;
	b=dj4jh1rcrOsqNG46R3la4Q3eGh/25pPOA/SKzbDFlUog8bgFeQLVnZsgNdW9WRFgHih9
	 apK28ZaQScPh5rE68HV+mI7J1vdHpq2hWXmEX6KbQZaZkUOmK3atYA53f07lUVLvnZrPZ
	 vCsu2rcJKQJFsvGk1MIjMBI++GqXCWU6VFsa/eAXzT5Y6ubYGj2TjXOp/zY8lCd/ARpZt
	 4KY4Hy+FXjG1yAxH2bWOh6Ze1y1FYDyi8zJYoiegACXVt3BzUqiiaAXh6+SvkK9jdTvSE
	 XQWWwoNQQfpHWi1dmCoHunfk46j4EWqEdGvjfXDJuuhkgCP5pipbZ0tHgcPpY9qJ0XA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793551189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PJ0Qy7Vam7gUdBOGLASRBsCx2IWBpOHyWIb0KXXH/Mo=;
	b=DGcFt3QbJTVtDvDEPWeuCdSlpSxOLKWpMCvbpzz+SMPTtlTqPvCldqmJXDizcT2T795Y
	 OlMh/iTkcfpZpd39vrFobBM1HvsYRyNS59Z0LuE1YpZvuyC1NooQuHgrA4Nhov2uBozXL
	 hBUr7R+8qEA8nyOm65oNihBGChL/Rt7RmU9AyQTiwJCgyMNiAF+0h4QmHinaSh7QLGWrn
	 1rm/0J6LxfWjpkw4lSXZ+V6jT/f435J1gUiGMrqtTP8ClyC/I5TxW5fLGDOI0upDG8lAW
	 4wnViv/23DVIttAL6vL8pXsLL4bwhO1LcCXa8iS9kmDsLIxYV5Tny8lH6REqD/xSfIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793551189;
	bh=PJ0Qy7Vam7gUdBOGLASRBsCx2IWBpOHyWIb0KXXH/Mo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mefufOVHlEsP9t8H7384A+FVh77Q0h8NwzYMdsAxLTyIqKjmfw9IOBjzWyvXgGBop
	 SJqI7unEd1os/01p6obJM5JbyfUrqaopY9OS1O4wJoaCCtza/WRhI1DfHodZbUTKyO
	 8q+qYTlvDVjmB0pSSX0f4NORFyJvXE7w3qt+in9NQGKkBHRjR+h/65Oj/wW1ST5fY7
	 SGyCP9Q22LNIpeLJ0VWr2i6pzRJEZUbXfdpiXtYD8eKfYPuMwWuN9RtrVxwznRozhH
	 2Es9EFDH1wtjYs7bwlIJMm8OUuo4qlKqAZ/Ckempr0dYfVhaaNzP9XfC21WQiFx/LM
	 DqriXTdOz+sKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF6A84048A;
	Sun,  1 Nov 2026 16:39:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B8C943A7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DD6A4048A
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kGQQuHNNsda for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:39:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0A9C740462
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793551183;
 b=nLp58zZ1PXs0eIlT1IXUo5EDF5h81VtQPayInVW65bGmuBrUxDwcVHBVFMq/hCOcAsPt
 ZOewQa8DKAWxog+j4g/8IyXJyI72+ki4xmG39cmRDcr8DF5kp7XRFu0Uw92MkupLUHryW
 t7KMxEH0KjxJMsV6MPd7/VUB0u5UJOk83VOe3vk1YrVzgBv0L8vCdaS0OaxZhtGjuL0BP
 YrDtI3DnNYhHfvB+wxWMV45p/EoqSLNAe2ZuFdxYnW2k9KmguTR3bjZMyGppSoTAcaIGy
 0vxwOAXljJAX94tpdohhEt3s0zJMR4TqV8X6HbxzBlysz538BP0TY+fuVJvzwPkRfUw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793551183;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=PCM4JxBkz97rfvk3nUaGKeon1qqKbB9A9NThy7uNoRc=;
 b=mFzUl0Wa6zHs2cxZ+E6si6ddGRhy4C12IRdwAg1xFuZyBqesVyX8z3yjnMuBcnkn8h1q
 30GEDcQ2o5dhUMshrPwiY6ekf82rKQRE8yXWgkkEphW+UTSB25vcH3Y0NtculB4ixfJ4s
 AxBoF0lIPrCzghgSbefr9Eufs4LxeCT22hssBlmQix7OmMvTV4EcgTYd5M0cOcFTbRVTh
 Vh1bwvpwjNf1LvhyBJ3CU+YErKMMvkfBob3e98o3tFRpytBhUZfRnTRlH113P2oMK09UE
 EgYQnLS6MSqPVM5b4dIMTjUmkzmHGy7LXCkxmJAvNbTVOlJPy+IbIzYeazY7i7OEhqA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sYR2NdIV; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A9C740462
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:39:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A0A864E41378;
 Sun,  1 Nov 2026 16:39:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 632A560750;
 Sun,  1 Nov 2026 16:39:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 46FD010329162; Sun,  1 Nov 2026 17:39:35 +0100 (CET)
Date: Sun, 1 Nov 2026 17:39:35 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <audrQhAQ30W_lPWX@windsurf>
References: <20261031183632.1561453-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261031183632.1561453-1-thomas@devoogdt.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libglib2: bump to version
 2.90.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 07:36:31PM +0100, Thomas Devoogdt wrote:
> Changelog: https://gitlab.gnome.org/GNOME/glib/-/blob/2.90.1/NEWS
> 
> - COPYING is now a symlink to LICENSES/LGPL-2.1-or-later.txt
> - CVE-2026-58016 is fixed upstream, drop the patch
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

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
