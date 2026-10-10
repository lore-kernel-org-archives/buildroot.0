Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70E7CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 953A040621;
	Sat, 10 Oct 2026 09:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZnKYLe43FmK; Sat, 10 Oct 2026 09:41:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 71A1140C08
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791625304;
	b=sSAeM709Z5EMGKh20IBCPGLbmjr1+kZN4215pY7xNYH4TUtN3/BMwenwuUYL1zjUOR2d
	 L9wv3F2ywsI2kbFWnEdPiSaW0AmkrU/pk7Tp+aAK3FYgPLrZR0X3/kM5Y73ku8uQMOFu3
	 lDw3eRZN+AQqH5DwXe3AZDmeyc3BhW7WP8+mjq0yLBo9tXmcEjIlxXCue9h+qlIsFiQ1T
	 UScjyoJ6e22jrxIlBAJ4Urzhx45Xz5asDLaGRK4B+jSa8m9CuzpYbxZFn72H5Uzq3Jil5
	 rH02wpx/POBWJRn5TfWLByFR3h4+1eFe+xChNWOPPbZwrUpprppfHrYBbTEDcShSYeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791625304;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mr+CI0n1WIAMky/UDMBjHRklApwd9jaPr63ckxDarZg=;
	b=XbKJgqwIOb28SQ+h1m1tVO2ezaLPKzsNofRp5B9jFken90DWbW3JLsP174fgugfV3NhX
	 5k/umAf8c/M37kx4vqGTJqhKdxaOxKCS0SXfF2dKsjuzMXrkcTZP+t3yp1w+jnHwwqute
	 BETDGZASEqTIiRu+/CHrO6glN2QptmRcY4vKg5GJxKHcdi3Rl23g7nx59y4HHx6qXQ/fv
	 7eboX7cqX0njKXomrEKKLwe4zjNyp5KeitxJEIKicrgRnWC+5kH16u1oYuwKN3+hsP8L7
	 NH85i74j/bGkrBWMTn/l386NnUnfKPqKEi5fkdnkLndDp7HWLy5xyU2G+pitK7lp47A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791625304;
	bh=mr+CI0n1WIAMky/UDMBjHRklApwd9jaPr63ckxDarZg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QZcLIhGh4mtsUWl1cFKYeq50r654Q2R41FM+rAoq0DJPBNsSg55ufyraLTTRU1yEe
	 qvPFgvIuvVhxIRomOYDexLHYAml3yyjwp/Yu2MYUSnqeQuR/D27nSgcVSy/+QeK1PM
	 5b7FccTv+2lKjDkJ12Bf4k6uEdzlTi1oKyIcsnhYXuffGyX2jMcYeJxMrETe7QAaxe
	 GAAAwgwpuayz5ErTNSY1S431WVIsGLDcvVml/dhXLDmuQJZGr4TsCzr15IY4Axe4Ha
	 I3Hy61DvxxLWxtJOHUa+TissfRJ30osTwVZQvWT9ZQCufKEzCGkaYhYlcv6QXA73M3
	 3Tv9XoS8o4n0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A1140C08;
	Sat, 10 Oct 2026 09:41:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B02091DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1C62400AE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aw_xo2gfu8Uk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:41:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4EF1740004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791625302;
 b=G0qsuzSSAsVQ71Gsn+1K/lTvqk6TgW3hYJAD0Aw3MFJN5CujrU8PgnT4mDiQx6Y/fOzT
 zFsZGEEpvaTptRcNSYv5NWzIAf84IKPaOW7Ix1rK2nkUmbFP0KSKxL8Y9PFkHDrka27UL
 /+vRzq0h0Sp3+UMiorBzNWgAqkeFzYg2601Hi152wMTHOXu0tDq/qj598mGuwaVtRv7ei
 a/T0N911SnhuLsxB/wuPDDPVCkuiv837PeNlDb2KZjLfJbvdNemSBu+NrGvoayRCIAtdJ
 lR/8UGuvl+ZlHHP1SrMRyC1mHOIkTAZRDzC5ZvVQzWkvufxrmvC9u18JoUgHU2HbGBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791625302;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=GTuXsrF3mVIKfI82FEO9h5Sy7rzwfv9dX9D9DINT69U=;
 b=hlikX6fPO+yCVeYjwVRl6kzXiCgoOJ16dxfeFwUKzUbCnxUDrBmwvNk2BrPSLQ2B0ErI
 IH1dBG1mRyqb8ZMg8jhVlEAen0kjpSwcgpl9gJeY6vsFZCUymWSH4Vk0L7NO1osTqaSBG
 ya7GdG06XJAjEV7Gt1g688wSCW+5K7xqj6nHKCAfPPxJMFjLbWtujr5O5T/fwwChgpfzW
 NAC3oF9l2tPVfo2LmJbCUR+7+1nDUm4BwbczaZQwe205uXjJ1yTGqwKh9akaj6C6H/Qrk
 PsQl+8rAF+j8EAqh5+vw13ok5vggcaOBElMqAS4dltacQJ7WHeYf+wx3li7fsILiOVg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=noZfkqHG; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EF1740004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:41:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0FAE04E411CC;
 Sat, 10 Oct 2026 09:41:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D37396075C;
 Sat, 10 Oct 2026 09:41:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B84FE11D700E6; 
 Sat, 10 Oct 2026 11:41:37 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:41:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <asoITUqocOw3xxJC@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-44-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-44-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v8 43/84] package/qt5/qt5base: Add support
 for OpenSSL 4.0.0
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

On Tue, Oct 06, 2026 at 06:20:24PM +0200, Bernd Kuhls wrote:
> Support for OpenSSL 4 was added to the Qt 6.x OpenSSL plugin by commit
> https://invent.kde.org/qt/qt/qtbase/-/commit/e806630e694d89f567cffa9c982d1f471089ecd8
> contained in the 6.12 branch.
> 
> OpenSSL support in Qt 5.x is not plugin-based, the move occured in
> version 6.2.0:
> https://invent.kde.org/qt/qt/qtbase/-/commit/d385158d5213ef568b7629e2aa4a818016bbffac
> 
> The upstream repo is not updated anymore:
> https://community.kde.org/Qt5PatchCollection
> https://mail.kde.org/pipermail/distributions/2026-May/001690.html
> 
> To enable support for OpenSSL 4 in qt5base we add a patch set mentioned
> in the OpenSSL issue https://github.com/openssl/openssl/issues/29117
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>

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
