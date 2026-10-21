Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C768606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 14:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MWCOYX+E
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA4E40920;
	Wed, 21 Oct 2026 14:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCO0YCG6JBaR; Wed, 21 Oct 2026 14:59:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 77800407F8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792594779;
	b=BHgs+UCU/k6H12z/a9kGIzXcx69kg7Pq9Gtn1JoAqSHIIjVlIIcdAfP9B0y9BSNrpjN/
	 pNYLQHsJ9ocukA1DSI5EiMgbwdHgm2z7h7h7I/x8tUmbK5PND7AOJsNO9+vNgwTbeXLul
	 bm92gZZZeXg4eFW76JwoQDqyznca1yrjwilk9/wWCmZ3O5vfw8GaVXitv0F3Qi2l7FqqV
	 snPKhbbyaV6yhq7lbSZkJCMECtz1PGReQ3p8cOZtYJ3+mhSC9Bp5wR+glan5Ox6SC0HMx
	 EXiSIAZ4MdI0dKcFK88IwVzIOTGX0M1mNtJRUcmZ4NukILyGEF6OXL/SveeHLjWol6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792594779;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Date:To:Cc:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uHHJJWSqMj+3BVIfE8ovrdnTuJ7OAqBYA3X85+peF9Q=;
	b=T8pEncTvE0h05G3Okt9Li3ItUxKvkKSLBMSGaOyhjyvd8oRN1JWIBdZuc9z2imDDB/p5
	 1Ltg/7sbdW4nSEMoTaB8nsBe4XikAsjiXpze1ab8x48nyHGWQqWm0CrGYnGZHrD/rC/Si
	 +ETPgg9g2Dw40qFOiBlT/NxM0+7bqEpkZbVPhOSCENvJeben1UsRxjXAgBqjWpFc1Kh54
	 fwhpjxcNTvZS9i+83L9Vk0RdWZSPxDlndan4OZhNAfGGN2tuCaMCQAAqy1JzRaAG25vz3
	 YX2NzAmINC5DEAGz9xOOeVf4Nb89XE9OuTVNpK0ZxFFhjosLZCunaGWZkW+MwLvkDBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792594779;
	bh=uHHJJWSqMj+3BVIfE8ovrdnTuJ7OAqBYA3X85+peF9Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MWCOYX+EMgcRjnpYG3uck7uEzSged+yAeAAY9Qy+3Ef+1mYcNV9GfQrLyGJa7rJM6
	 yTHP9q8SeQOGIhRLBOMXZ+gdme04Cjo5rZdr4l8uACpjtS02YXavx+tudcZcm/+173
	 1WbJWfxCzvsTwIYIw9xb/jNYsLBGrtPDXODcyVhQ2C4ObmMaQLszWsfZKsI3McqbdH
	 VxsA2jE715GEXQMjeHv2s5oc39yw8GDmGeqdlxKD0zXiOKoP5h46V3pnxnslxTcdoX
	 Qt61sEHE13HzXZOJZc2oTUMJTv5BmzvSjOdCLBaMl8ZWcMfUWuvYo+AljDuJNkV2Xm
	 T6ta71OiAh4FQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77800407F8;
	Wed, 21 Oct 2026 14:59:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D14AC930
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B783B4039F
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozjbtx2Lk_nn for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 14:59:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2537B40077
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792594777;
 b=LDr55m6LtLDZ7I5n02XoQYd7KzD1j3vQbknyo2gkZtXU0n2YT2OxlpDZlxC0vrzuoDxv
 BgFOesN5cWhK5kWG4mLaYpJ5clZuwH/PK1W1RWPp8a15f1rDz0cw9N4pMd0+e0MvrQYBm
 wBhWrQ9gsDQ1IDD3U5uo2W+n4O2rvDsSM5GN2iT/fyJ8DcXclMs8fkOIHIKWzNPyxLUjH
 +y6Ag1OYLMaDadXmKDchVrnCqBHGhr6rsH1E8IQJVIwV9zYidmdcU1OgGRMZgRFEi4zFm
 5PoOsP4l9LPMbOvbvHzhECSARweRSjz6+/Lv6apoD+DRctROTS6MWk45e5feBatLs9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792594777;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
 Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
 UI-OutboundReport;
 bh=b13HVfPEsC2zyw0N/s3fRFSL57MAm8NtI4k7NUpD75c=;
 b=AcB4QWSvVWvH/J1wZmRLf0PYpIVVLt2feIPuFbk03fCwDSEu2JGl5inJJHE1HpPFicPv
 3Ty2eupJnv0OKejk3Xu9r0T/aBQBGxYanfxmU4URx9h7nt+5my/SOWobwnH6nEdd3ddhd
 ggdHq+4oQ+BsAvn1YO/DjBWrZJls1pOhYG23upxkYlmMAgxyEebpMYvo9/JIVV8OoftbL
 hwvCliOe3wXpwk0ayyGyrh3ASXjeGHlDHA0TUA3kyyaxfU9yMOMEAChhNmAzT+K9n+U7Y
 0AgKr3k7FpauVJIwZn7AFqslgobozurOgyPKm9nr6dWf+9MYswWeii6a0DOLYyAltuw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=fz9onXYK; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2537B40077
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:59:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9MpS-1wY3wQ0KNI-00wOhf; Wed, 21
 Oct 2026 16:59:34 +0200
Date: Wed, 21 Oct 2026 16:59:33 +0200
To: raslene.ziadi@gmail.com
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>, Raslen Ziadi
 <raslen.ziadi@enim.u-monastir.tn>
Message-ID: <20261021165933.36c5c64f@pc-1>
In-Reply-To: <20261021134656.30706-1-raslene.ziadi@gmail.com>
References: <20261021134656.30706-1-raslene.ziadi@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:1OXYupuw6ixwHTo8oIzLCMtw5L1wA5o0b+Vbw1j7Y2osvzM+bxD
 fwxFbtfbU9RbQ577ZzB9UXFeGj/wbAX7MHI6dd0yjod7Tr2+wwhO9Eg5KugMamZ/Q2vASis
 fEZyUjc4cormlx+rtwftdv5nO696KycBm++V5IKI/s9o3NbrT5K+puJ72o87z1mLrV0nMHQ
 P+8gLb9lOh3i13E/kpbiw==
UI-OutboundReport: notjunk:1;M01:P0:M4aLhEK9/A8=;8e0iTHDDH4t8gTFJ+XtlzCwo3Hk
 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
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: handle
 missing git repository
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Raslen Ziadi,

On Wed, 21 Oct 2026 14:46:55 +0100, raslene.ziadi@gmail.com wrote:

> From: Raslen Ziadi <raslen.ziadi@enim.u-monastir.tn>
> 
> pkg-stats can be run outside a Git repository. In this case,
> retrieving the current commit fails and aborts the script.
> 
> Handle this failure and omit the commit information from the HTML
> and JSON reports when the Git commit is unavailable.

Stumbled some time ago over the same(?) failure and sent a slightly
different fix as patch (see [1]):

   [PATCH] support/scripts/pkg-stats: use BR2_VERSION_FULL instead of raw commit hash

Regards,
Peter

[1] https://lore.kernel.org/buildroot/20251218200628.2615661-1-ps.report@gmx.net/T/#u


> 
> Signed-off-by: Raslen Ziadi <raslen.ziadi@enim.u-monastir.tn>
> ---
>  support/scripts/pkg-stats | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index eb6d1836c3..52a4293948 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -1260,7 +1260,10 @@ def dump_html_stats(f, stats):
>  
>  def dump_html_gen_info(f, date, commit):
>      # Updated on Mon Feb 19 08:12:08 CET 2018, Git commit aa77030b8f5e41f1c53eb1c1ad664b8c814ba032
> -    f.write("<p><i>Updated on %s, git commit %s</i></p>\n" % (str(date), commit))
> +    if commit:
> +        f.write("<p><i>Updated on %s, git commit %s</i></p>\n" % (str(date), commit))
> +    else:
> +        f.write("<p><i>Updated on %s</i></p>\n" % str(date))
>  
>  
>  def dump_html(packages, stats, date, commit, output):
> @@ -1300,9 +1303,10 @@ def dump_json(packages, defconfigs, stats, date, commit, output):
>      final = {'packages': pkgs,
>               'stats': statistics,
>               'defconfigs': defconfigs,
> -             'package_status_checks': Package.status_checks,
> -             'commit': commit,
> -             'date': str(date)}
> +             'package_status_checks': Package.status_checks}
> +    if commit:
> +        final['commit'] = commit
> +    final['date'] = str(date)
>  
>      with open(output, 'w') as f:
>          json.dump(final, f, indent=2, separators=(',', ': '))
> @@ -1371,9 +1375,13 @@ def main():
>      else:
>          package_list = None
>      date = datetime.datetime.now(datetime.timezone.utc)
> -    commit = subprocess.check_output(['git', '-C', brpath,
> -                                      'rev-parse',
> -                                      'HEAD']).splitlines()[0].decode()
> +    try:
> +        commit = subprocess.check_output(
> +            ['git', '-C', brpath, 'rev-parse', 'HEAD'],
> +            stderr=subprocess.DEVNULL
> +        ).splitlines()[0].decode()
> +    except subprocess.CalledProcessError:
> +        commit = None
>      print("Build package list ...")
>      all_trees = get_trees()
>      packages = get_pkglist(all_trees, args.npackages, package_list)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
