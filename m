Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61A9606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZCtpRFYI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F38B80D73;
	Sun, 25 Oct 2026 20:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w740Ie1NIuav; Sun, 25 Oct 2026 20:21:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3FB7B80D45
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792959673;
	b=DAXOUOi0Zb8qTaW+PAUaSqA7v50UOaPmmUab+QVF3PMOBMB9DumDxfHOGfaAMUhrCebR
	 3JR53HpQKYHwLXZli13X5TnBy3A8WN6sKyNkuHjOTm1vkTMIzMmDrV3atAbudA0z8xB5J
	 F1LLP0ArdfLDvd6Xsu/PC8QgEQlsaHDmrSP4jVkO5LhSiDJmPFvOJPBJKSY4J9RcEyXt9
	 zZ7PNhNQHW+OiYKL9p3lUSm29ePfNYTQNrJHP8DFYmItyzZRem34sbQWB0LffVsArZQ/w
	 2u8IVx05f5nrJ9uFgoCPXk+lFetQoeAsF07hFqf1mB4wICY9DR9g8E7G3/nSMgfGFKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792959673;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9MwYqaf4tUDDY3mwR12oOFbIGbkNXlYHP9WXGVI73qk=;
	b=RUWc1r0mEZ0JRDiZMnClquLtdMM0eGalax2tVouPgziPHnqJdfmAiM1PuGPA8Z3wOMAs
	 ZC6qgIvxAF+Qlo0Yjko0LhmgiODyzscC0teHM7naAu+86adipBv3DVw3CkJPwpOWg+lMG
	 e3Vzi6DpXShUb0VIUE4dsYF+zmMdDrWWq1oMPx/7U6yQ5P8dma5M2u6pQmdhrFYyfGPaJ
	 hjG3JbNbDr1p/pT2bfRNcjp/kDL84+Qp9UOhEpVQe0u5iEOcftxL/CaJ+8lKzy0R6giJW
	 T4jpyfNyIzbQAs+nzdRLqJ9s3ZVv757u1Fe73wqmx0dTH9iAuGfMaquU9GquCiiu1Og==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792959673;
	bh=9MwYqaf4tUDDY3mwR12oOFbIGbkNXlYHP9WXGVI73qk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZCtpRFYIEBObHT6RQsPMuB3xWA3lHhWpahdXOR9tGeIxLG1Hqkk3Xi432U2yG19Jj
	 nk3NSkDCaWOmPmKpcYO44BUqx/rg0Gl1hPYPDLSddUwhmfl/WjePFW1zjHzmp4MLIv
	 i5Bzsxxce5GUVQRrPUx0KNSEF6hIHthcHwaoEdHyPukeOuUemJ70p122vk0PIenQJs
	 CdcwejMwh+cGv7PhES5vvxQH2n1Dfpzy/rDoUU88ywGmIHucvmWdxSZyIggziInCCL
	 5D4bKFCkm117+bSjuyErinr87gtiRIjRmzTmSbS5foOhIcHqbM2SRvNP6aEJ3lDNj0
	 U4cvTaK3rwxsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FB7B80D45;
	Sun, 25 Oct 2026 20:21:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B597B4D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6D514059A
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpr3d-KpOKL2 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:21:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03E9B40598
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792959670;
 b=XiJxLwMJydMlkjAzswmcT6esSdA6deBQQ3SPoYuDb1DiJT7JXB2eLYShSCOSjjFMEPBc
 YeibgP/xh55Be2k9Ls0xuUZFRFkl1CuNtioYa7YwG1hjkRJnchIifiLB4mLqyX+N4OnHW
 tQ8lnKeLnDcebYawljyPh2TmRyoMdOog71S1mi3aLtRGhSdUjRjoVwIImtZ8sgsJOVCZs
 y4HvFwuiKTRK+LL5D3kakLIU3ICZ+68XFCDqhKEDIHeVrvzUe0Fto5dRneHLCIc5XAuQa
 sS8Qzscu4kkZH9o5IC2Y6icWkBQXvt4UeQcX3pGR+WsKwpdnA0aa/EVHBncjubbJkCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792959670;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=p0A6Wb09pT1XE1NGC0BsEKDTUTWi3P0ZqcQtmTzvchg=;
 b=nZ1aAiUUdFRIyF8wnLI7cQEzp1yNqH9spzkvfDj7CY0vUVjjxBhlF/vr3bgiztavwKUg
 AC8vMXlBHR/TKCjgLgK819cXeTKIX+LLoBK72fKg12BRQz08pR12y80uYjDkaxVpQegyt
 SXBkxTYX5/LU+tvA0UN3jQ5Rg8MCHEb+S3aczh1etpxf6Pu/pQ2/ov3GKtwEYa7jUJquS
 nVJv6/3wSth9EkNIIxcIKS//ls7K01Mim3npSNZnJyis5Hqt7ril90T4LNbC4+9HGEqjv
 TWSIb+G2IR0h5KE6M03btJzKikIL5ymdbcYy06iAnG2/t7FEApDs+GN4AG2eLBgIHZw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=f9kjsv4F; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03E9B40598
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:21:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 51921C51477;
 Sun, 25 Oct 2026 20:22:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5FBFF60740;
 Sun, 25 Oct 2026 20:21:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 262831032902C; Sun, 25 Oct 2026 21:20:58 +0100 (CET)
Date: Sun, 25 Oct 2026 21:20:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, 
 Sergio Prado <sergio.prado@e-labworks.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
 Olivier Schonken <olivier.schonken@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 James Knight <james.knight@collins.com>, Mario Rugiero <mrugiero@gmail.com>, 
 Adrian Perez de Castro <aperez@igalia.com>, Simon Dawson <spdawson@gmail.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <at5kJQqc8iPk3NYG@windsurf>
References: <20261025160912.468488-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025160912.468488-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/fontconfig: bump version to
 2.18.3
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

On Sun, Oct 25, 2026 at 05:09:12PM +0100, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/fontconfig/2026-May/007334.html
> https://lists.freedesktop.org/archives/fontconfig/2026-June/007345.html
> https://lists.freedesktop.org/archives/fontconfig/2026-July/007371.html
> https://lists.freedesktop.org/archives/fontconfig/2026-August/007385.html
> 
> Due to upstream commit
> https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/7643efb77552076b035d3eb506ca836ed4764ca5
> added in version 2.18.0 fontconfig now uses locale_t which adds a
> dependency to BR2_ENABLE_LOCALE that needs to be propagated to its
> reverse dependencies.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks, but it seems to be lacking a few dependency propagations:

package/foot/Config.in:1: BR2_PACKAGE_FOOT selects BR2_PACKAGE_FONTCONFIG, but does not depend on BR2_USE_WCHAR
package/ghostscript/Config.in:1: BR2_PACKAGE_GHOSTSCRIPT selects BR2_PACKAGE_FONTCONFIG, but does not depend on BR2_USE_WCHAR
package/python-matplotlib/Config.in:36: BR2_PACKAGE_PYTHON_MATPLOTLIB_QT selects BR2_PACKAGE_QT5BASE_FONTCONFIG, but does not depend on BR2_ENABLE_LOCALE
package/cairo/Config.in:1: BR2_PACKAGE_CAIRO selects BR2_PACKAGE_FONTCONFIG, but does not depend on BR2_USE_WCHAR
package/fcft/Config.in:1: BR2_PACKAGE_FCFT selects BR2_PACKAGE_FONTCONFIG, but does not depend on BR2_USE_WCHAR && BR2_ENABLE_LOCALE
package/wireshark/Config.in:23: BR2_PACKAGE_WIRESHARK_GUI selects BR2_PACKAGE_QT5BASE_FONTCONFIG, but does not depend on BR2_ENABLE_LOCALE

Could you have a look and send a v2 that fixes those issues, if they
are correct?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
