Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FAFC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 14:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A20734064B;
	Sat,  2 Apr 2022 14:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_pNnm6A2E5u; Sat,  2 Apr 2022 14:42:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0C574062A;
	Sat,  2 Apr 2022 14:42:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBFDD1BF867
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA4FD60F9B
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 14:42:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e9Uo36xHjzt for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 14:42:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48F9560E8B
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 14:42:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:284b:b661:4b1c:c314])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 07899B004E8;
 Sat,  2 Apr 2022 16:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648910557;
 bh=atZ/w6IuH+NR46queQLKOoanTdAg95sVtlsO7vw/A4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y4WNx8RvXgDAOlCSeWj+SUBHzfEc7cY1D6kM8sNl4wY/RVXwL3PfR5lC5x97Lch0z
 saPQnVnDfE0RXy+RvUdbLog7MVVwnjcekSh38IIgqWxCDSrUdLhVk/fwqCEMZf4xdK
 1Oc4AZ0BxV00jRnJ5apNFvrsa96cL3nKtdiEPxvD9+MdWMU5BXkkB8hr0D7zXZqeZE
 e4IokJ0N/mbw1goggcMK0jMDcCprYTB1UquKIlCOnnW0Fso8dodjaX1I8VX8DBhA8h
 MtiQ4SeXTjTZeNKy81bfB9j3XD7br8tbXakfjgARcFtcMo31RfeYXyGulTE51WCq8C
 jgFWTRfsyB7xQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Apr 2022 16:42:34 +0200
Date: Sat, 2 Apr 2022 16:42:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220402144234.GA1811301@scaer>
References: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402141531.1320584-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/4] support/script/pkg-stats: allow
 disabling CPE matching
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-04-02 16:15 +0200, Thomas Petazzoni via buildroot spake thusly:
> This is useful when debugging/developing the pkg-stats script.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Patches 1-3 applied to master, thanks.

I'll resume looking at the 4th patch later.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/pkg-stats | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 8cc64a54d1..ef9482ed95 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1125,7 +1125,7 @@ def parse_args():
>      parser.add_argument('--nvd-path', dest='nvd_path',
>                          help='Path to the local NVD database', type=resolvepath)
>      parser.add_argument('--disable', type=list_str,
> -                        help='Features to disable, comma-separated (cve, upstream, url)',
> +                        help='Features to disable, comma-separated (cve, upstream, url, cpe)',
>                          default=[])
>      args = parser.parse_args()
>      if not args.html and not args.json:
> @@ -1184,6 +1184,8 @@ def __main__():
>      if "cve" not in args.disable and args.nvd_path:
>          print("Checking packages CVEs")
>          check_package_cves(args.nvd_path, packages)
> +    if "cpe" not in args.disable and args.nvd_path:
> +        print("Checking packages CPEs")
>          check_package_cpes(args.nvd_path, packages)
>      print("Calculate stats")
>      stats = calculate_stats(packages)
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
