Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D401CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15E5C4059B;
	Sun, 11 Oct 2026 13:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHkC9q_abhUk; Sun, 11 Oct 2026 13:38:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 33581405A6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791725933;
	b=MXGl/o7WcKN7BZ+xN1pGISlpaDNDoqbojnhDFUbIJzlbD0kJCvFeVBIfVTHERbf5rALg
	 +DxV5oo4Ap1cwc4iPM5NbSSQfWFjs4E00lvt3fCphwUi8TcGEyN00Zju+MjJm5rfL2wJa
	 Acexm+xn/sAZ9AiCC2APZFu1WLjE2VK8ETsW9oabwHMYk3ICRX22dQH8fnFzyylchVNPX
	 QrTyBqA6P0qxf9ayBsRJ9EjBHosDczIIpaN+zAVkPghOh1kVpWA/fmoC8Wsa0KL9mcMTM
	 LLehiJylfOfBBk+L9c5NTaGC9/IH2zbr/MOKGZ98Mt1eI0YhI+p2zn0b+lX24yGGErQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791725933;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=dHhXZsb8/OUAC3Q8leWFJVJ3JG8ex+UtV+94YkyBe8s=;
	b=K+CcVojUlShswpwjbLqLdyDKoVyWH1U41/fqDGhyeh25zsBEC18F4Ys4LA0j5RtweeHm
	 olp5c7xw31zhR6+3Te2YT2189Bk7O43ULgzoh8LmU3z1dg5rMC+ZEIKeQXQjM/tCxjD38
	 bCLR+vDbkWkpDgHmsHAMBxwguhnNFGO6DMyRbqEYWMi7z0Jio680EN28KKOiL6xbTJs5H
	 rnUN6EoJWqU77JZ9b5Y3vYXr7q1arkiqO8gHpR3An2iMy5KsfW6VnNW1WDNyzKezXoC1c
	 CeQng+U0lTMHR+Ih47Zgq1e/3a6eHcmtpnJQ97iShc63IiVBFa/4nPycSlbNd7n2WQg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791725933;
	bh=dHhXZsb8/OUAC3Q8leWFJVJ3JG8ex+UtV+94YkyBe8s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a1mND7YjCnbB5DJ0WIMQ+Lj2Imn+IUCsyfm059XO0PgIIfk+3Oet+rwwVen/QAtTx
	 R5PwGYGKoIYoY7M2WLXyCKONL1KMnw83JhrrciBu84yv/SfFuKXcp/hlMyfmSBEG43
	 eFgUf8n8OoZyd5dBvQBE1xOWHyZo6HBFpjxvZnrcDGaqUbjhrGKVlPeJYCsj0o4q4y
	 gV+dhYuU8fQ/sC5oqHzwXLyF9LvOmxa+DGI7A0d1sE84Lkt+PNIPdFUEOnCEik2Oe6
	 s5kHbvSmWC6Qr/ppSqq2ND/5dly04GhBdoGPOwr/KQonBv5o4rCuTpJFgY6Q0OFwor
	 SD3CJX6SKdGsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33581405A6;
	Sun, 11 Oct 2026 13:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AF1D75
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50C96405DA
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgNhXs4_-HRV for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:38:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 930984059B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791725930;
 b=j+WMPW0OgQ7m3/8zQheaTVfvafsLDh4QHroeh+MFbas+u4RYTkPELJadm7MSIAGeN/xz
 ll033mH0y5+kJm/ToOuMkxF6UVX7mM/z9N3EaDZPq2rdoORdjmrRasiAPL8W1OOB3kkgt
 hvbIWRFStCtFSshR4l3bSj8R7G42uKxuVljnelBmTaMUeIoN46Ji0ipCHvfW3FqTBsN+H
 8p6KAVP1lTVeq1jgbYkXWSMu2ShIYMKpvMG+c2e2uElgwaD5MnnwnQelKfda3GRw3Y0Sy
 evVB1WHNjxEXW2lOWLHicYZMT1vp8xidoQk1IjmCiHZbbbzhoZaKAjCwUjt6cJG0VEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791725930;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=6UfFwqUaUMEaLJf1oNdzeBjoWnAsmdKgu+QpdE/6eYs=;
 b=NC1zUBuiU3SAZHdcQy9h5qslBIq/oJWhQH5XokX5tioKUEt2H4TDLKrIQJ5nT9YC3zGn
 BYBRdDjm01/pu2saobiCnp6PtKJRQUta4C70jbN796lNDsBDleIw49RMj7dPqJhuBIF5y
 Odzt5+pykIkqQyYx1pVbiWP8XpyBzfmsjkRhsbztvEDV/MmP/3cF6x82YE7QLoL4StSLk
 NMSBStVQjkvgdb0NbQMdfmn/UnmtLJxAD2xn9ma+7zl1kk6MDcSiDw4f6yV0D+/H1dleW
 4MGTPvH1pagURjCqeiyIhTWyInvUgPbc+iYE3OoEhXkVz/NlIYhkuHNXTfMoqPL173A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b="n/ecC+n2"; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 930984059B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:38:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DB24B97A154; Sun, 11 Oct 2026 15:38:41 +0200 (CEST)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Sun, 11 Oct 2026 15:38:37 +0200
Message-ID: <179172462322.180911.14758630260298969085.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260405185608.1357633-1-fiona.klute@gmx.de>
References: <20260405185608.1357633-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v5 1/1] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 05 Apr 2026 20:56:08 +0200, Fiona Klute via buildroot wrote:
> The BR2_EXTERNAL environment variable is passed into the container,
> and each path listed in it mounted. This allows using external trees
> when running a build using utils/docker-run. Testing the existence of
> the variable instead of a non-empty value allows passing an empty
> BR2_EXTERNAL variable to disable currently set external trees.
>
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

 Applied to master, thanks!

 We didn't quite reach the "within two years since v1" deadline :-)

> ---
> Changes v4 -> v5:
> * Avoid Bashism in "does BR2_EXTERNAL variable exist" check, suggested
>   by Yann E. Morin.
> * Make relative paths in BR2_EXTERNAL absolute for container bind
>   mounts.
>
> Changes v3 -> v4:
> * Split BR2_EXTERNAL on spaces OR colons
> * Revert changes to mountpoints processing loop
>
> Changes v2 -> v3:
> * Use read to make the loop that creates mount options more robust,
>   removing pre-exisiting shellcheck override. Suggested by Brandon
>   Maier.
>
> Changes v1 -> v2:
> * Correctly handle spaces in external tree paths
>
>  utils/docker-run | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/utils/docker-run b/utils/docker-run
> index 27c169db72..37f6c12c0d 100755
> --- a/utils/docker-run
> +++ b/utils/docker-run
> @@ -97,6 +97,17 @@ if [ "${BR2_DL_DIR}" ]; then
>      docker_opts+=( --env BR2_DL_DIR )
>  fi
>  
> +# Testing the existence of the variable instead of a non-empty value
> +# allows passing an empty BR2_EXTERNAL variable to disable currently
> +# set external trees.
> +if [ "${BR2_EXTERNAL+set}" ]; then
> +    docker_opts+=( --env BR2_EXTERNAL )
> +    for br2_ext in ${BR2_EXTERNAL//:/ }; do
> +        # bind volume source paths must be absolute
> +        mountpoints+=( "$(realpath "$br2_ext")" )

 realpath also resolves symlinks, which we _don't_ want.

ln -s $PWD /tmp/brx
BR2_EXTERNAL=/tmp/brx utils/docker-run ls -l /tmp/brx
ls: cannot access '/tmp/brx': No such file or directory

 We should use the same as br2-external itself: $(cd $br2_ext; pwd)

 Regards,
 Arnout


> +    done
> +fi
> +
>  # shellcheck disable=SC2013 # can't use while-read because of the assignment
>  for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
>      docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
> -- 
> 2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
