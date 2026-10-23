Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D468606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EgtQK9U5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D04460668;
	Fri, 23 Oct 2026 13:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2rS88rqGjCR; Fri, 23 Oct 2026 13:21:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 34D0C60815
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761664;
	b=lR03m18/3EP6QB3+m1SwacdaalpbQNd2OlGrTSbwyIv9l7YVd77wI4ddQAT911eFMUKu
	 Ed/UVOmK2nHDGywl3M0xLbW4AWnNSZcK+BBkBTX1xnIh/pncR8UppmNhKyUorYj3v7ew3
	 Q9huUkUkRwxsvL8It4HY8r6+skSBwAONoa3wu0eNB36S3uzHT435UF/KcyFwvBGhJR0/V
	 sDn9Y0l4vE15XKEFWJMIdPDsNbvoR5sLl2nD5pDCKXg9ip6fT7qGszLpJkXDu+W3ZuSdw
	 32S/Zm3nRZnmMDI6DCEkuOYjSSIOu4oW+T0wZ1di5hoMOWu1ct11DboMjAU77YnqbAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761664;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=P3ldZSabyU2KaoS/caHQzhk13lzz/qQooCUrGpN7aVk=;
	b=GVYkPMv0FzIqV8kOqOXVKtbd4jfR0Gq8jA3vEZn500s3MbWD2eWr0wvp7+qMQpgRjkCR
	 5rTkIQRqsVkoIJc78GrpQAoMRsdf/jA+HhcHXUNPm2cXO7NNjSstJe/w4eqGm41g7D4bR
	 igbm/xFgWJEpkSwdypfpES39BP7HsnPLaqogf0mJAZ1rY58hdAubU4Tq8ugVExKq5mttS
	 Xn8jtPSvqQuqOTMv6W+cY0tdR0PBdi4ZW7A3auWywIk4arS+QQgIDsifBsRgG/K3XkVqh
	 tiOVS+M4TeI1M7o9n+03Je3/PJTlFSpvMh3LClTpM/F5deMDl+49mbwXAtkgw/Q9/vA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761664;
	bh=P3ldZSabyU2KaoS/caHQzhk13lzz/qQooCUrGpN7aVk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EgtQK9U5sdsV1qy9ktvA4R6Fyafuq7giMiSJOGPeV1U3JXpn0H5Qn9G+e1KUEN2Cc
	 pARTyVvNZfwHV1ZbXqU94QUHpRFifCatylUEv7nuCoyPlsk0TCLNluxLgnZ/5kdT5a
	 fvUnUkn0z/vtvnOWOd5YpocHtnrCufvpmPP8IuUUBgommMxEsum9NYsVX9qDH0323A
	 LjfOW7X7NLgT0aEqtx/azJOomaux2BE6iWvkECsUj816TtmZc9N/pOrD8oKHIoKBly
	 8f5FgT9IKt2LZBX/RlOM0yx1GuH1FRxR7rigbGi8gIL2wEy8BkJJaOJRZB4Cb4Sprr
	 J+0jYVF6gwGvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D0C60815;
	Fri, 23 Oct 2026 13:21:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 610063C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52552401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4onuLnJmFnw for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6019E400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761661;
 b=lR67h0WfdjnI37JQLXFFr0xONgRtd+nU+X9tkno33B5nfZBhydogZjV3DfCkognIZSMA
 mZvWmVxzRm3+Jl002MFI4s2/XL7o88vUVfObugpkmTZV5kj7+jCcfFxU/iFPJubYmRyAI
 8lfVn/fVIyXJsjr5RSJEAQ3t5oVfZ3PItas2p9OzQdfnGQkOk9fc+v7YYEQOkbF/PAAoH
 7sIUV7dKXdoMPK3uj7aTK6XPypJ2lc6ggbTEKhzeL1B0ny+FoGyiMZLfIqWrpniOkiM7f
 pGPb7dlK052uacecE9nIQXqcuhSwsfCQm0XPHM39Xv3ywmZXG+dFdpOAa7BMAPQJMnA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761661;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=fFKNK5FnlgC7DKCA+TmyXm5nAi3MsGCGllCUXQ7T1R0=;
 b=DAMJ/sAVHe98DAoaUn0GLfGL4aKzO+Bajv3gXAH6AxI75PWUoJ6xfGtVPK1aeZeTutQd
 CrqLlbKQHAgMYc7sEuWMzp156vqfZEdC6V0ZeFIGe4BwO+pNOTHTHMjMdey7YN+CskTFC
 qFlaaQfp5T3VVwzeE38RNBWKE3j6jBRTUl5wNWnoqzN14z9MwM5XAtDY4g6jZTIq7tyoS
 L+QE35Og8AryBvXDfWytudyeHSUlGdkxOCdpPbqFJYqg8GVCvqZQ9rN+Lb0w+/zMXOMTE
 0BWm6MA0WtMTs9ez7l9IUpWaRiMoYgDJqy15P9JPsmV5/O905OIs9nKUQt1MPurWB+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QNAO12ZA; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6019E400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:01 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48e20edd106so732893f8f.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761659; x=1793366459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fFKNK5FnlgC7DKCA+TmyXm5nAi3MsGCGllCUXQ7T1R0=;
 b=zm4B4QjBA522K5AvTOxTi9II5qikqaLBT9VYtPdeqqn+fbDhLdLAiFzstwCHY2+zOf
 Ojwym/p5HmfUzL2BT6Fj+VxdrBqZ7iNqWT0uSpp0BVjwFm3/+3jUk0Z9urOAmZZfhzEw
 Ua/iXDzRFZbzS9KZzxLZL22+NPsI3G5XtdZ3XE3nSxINYJ/Jib7ue6pb4+Lvk2BX2ZW6
 +apbbrQkdy2ih0D5mT0QOwwTHHwcnE2YuGtakABRKi7Ofv3fXGItbCVQzKrGnymF88qh
 soKoEY1fiNfrlT+zF8qNSJVjVV42JBmxSUjLqaa+LbAmCD+OSKwKqFVsEcYI2KWf4FcU
 Ml1g==
X-Gm-Message-State: AFq9FYJ5i/oAYqBI2Dme4UVBlwbxnHP7q9CtUh1wpU9vMosENILB8jtd
 V7AA2BC0sqLPmh/han/6PxiN37cwnXff/edgE5S93TmZO4AqavVL5l60215QE3Whx3loY724AjD
 3ofTWNuU=
X-Gm-Gg: AYBFou1USjuxBQjUdB90ypuTp1GH1/HeMj2qttZwx0dWrhgmTAqKLY+eK7143e+UFLk
 8IaGZ/Hz66O7T06BIVseQroDmTflxeoEJ0P8CBRkI1UIJE3nmzOaCSnlJ9sG95QYPcf92CP7tIo
 WXAxvVUBpTOJHeMvhR44AX1g0o9q3PAtjJH+FvI7mV4kEwD+XiPMG0PYveUW4yXXI1ivFir34Zk
 k1ZRoKxkD2jkTjs95U3n9LBnNVlzfq6t/JrAkeRN7xc87/xgiXN0F4c7ssrQiEM1UpMUSZVjUJl
 e3zjthoHxGDUUnRuqqtk1/6WVX/X//f2vqbgxLOah66I8sIHpjTYsklYAoAeTMJLNnJegjjb5qd
 k+BD3s4saUjtX/M4+L/mG7rZhKVRWf/8iEEn/ctj2L9my+2mn9FHZfLv7l+P1+U3udeu0OrGxm6
 /r3ZbckoiOwB86dx6/yR4w1W8zGs2TYU076rjVOrldScUku5spf5M5eHmZeLutQ7KNv8pTI3ofR
 lCFWX0d3ziRDA+nrIBDXBeoVZmlzaoOJD8Sy/c6hW9AT35nMfCqFp6SQ1yiIn4pMxT03PRPl7l8
 zRg=
X-Received: by 2002:a05:6000:4555:b0:48b:123e:2f60 with SMTP id
 ffacd0b85a97d-48e3859ae7bmr2506047f8f.39.1792761659081; 
 Fri, 23 Oct 2026 06:20:59 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38025c72sm4287364f8f.18.2026.10.23.06.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:58 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:54 +0200
Message-ID: <20261023132056.1607231-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018120941.1476904-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/download: enforce
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y for missing hash files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is supposed to make the build fail
> if any download cannot be successfully verified against a known
> hash. However, support/download/check-hash would only warn if there
> was no hash file at all for the package in question, and allow the
> build to continue.
> 
> This is a security fix and should be backported to all stable
> branches.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/pkg-download.mk     | 1 +
>  support/download/check-hash | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index b38f0c7053..896fb59def 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -116,6 +116,7 @@ define DOWNLOAD
>  	SFTP="$(call qstrip,$(BR2_SFTP))" \
>  	SVN="$(call qstrip,$(BR2_SVN))" \
>  	WGET="$(call qstrip,$(BR2_WGET))" \
> +	BR2_DOWNLOAD_FORCE_CHECK_HASHES="$(BR2_DOWNLOAD_FORCE_CHECK_HASHES)" \
>  	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
>  		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
>  		-c '$($(PKG)_DL_VERSION)' \
> diff --git a/support/download/check-hash b/support/download/check-hash
> index d18ec8b134..669c3a0d78 100755
> --- a/support/download/check-hash
> +++ b/support/download/check-hash
> @@ -98,7 +98,7 @@ for h_file in "${h_files[@]}"; do
>  done
>  
>  # shellcheck disable=SC2086  # nb_h_files is a non-empty int
> -if [ ${nb_h_files} -eq 0 ]; then
> +if [ ${nb_h_files} -eq 0 ] && [ "$BR2_DOWNLOAD_FORCE_CHECK_HASHES" != y ]; then
>      printf "WARNING: no hash file for %s\n" "${base}" >&2
>      exit 0
>  fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
