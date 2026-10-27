Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEDB606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 17:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=auniji41
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E140606CB;
	Tue, 27 Oct 2026 17:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2pQoRU8AI1s; Tue, 27 Oct 2026 17:39:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9A07D605D7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793122740;
	b=JEK8sSqHZNegw+Ffl88fRZXqEyjJW8/th3pSkmy5vwl/fEBF25kDgkg0UGUPlTzBDU1C
	 A4k2nM1j88ghgqY+FaTHKjPYbdTFvt+sMZ/g5IuKHrISHWyyzLY8aGmd7bjltYp8Rk3Jo
	 QpNX9Hw/4IN6B9NjXSoyWFiLOQAGn/AJvXNg+cMx6EI2XgPtxiU91cNvAt5gV+Ptf6USK
	 VJeK4Dkp7C6EgvkYWjQi+4FyTVn19Taq9BcCX+bf9sdvDJaYCqL9buJOPcTseMBJC0tlc
	 u1vHHC2aU4LzniUyT7xtV0exGVwOxfKLkHzeWJs4Tg0QgRD5bdBInM4neXniVdlUuzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793122740;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8+vIqzM333XOOfHBpcect3hQqqMScaq8tnWI8XvmEKc=;
	b=YhvMzQDESTsWWjo/AXlcI168JNRHs97syjx/qLgn2SCCTCK8gkgHckEkdlOfFytnxugo
	 9wXfUu48hUPfIsTji1egl2cAGAxNJqQ9j2vpLkM19cbuT+ebSvoZg0gd9x2QU5+FPCCcm
	 hHEgcD4YQuDf6UYCRp+0nM+Qp6kkqTT6esuLR67YTqGvn4F2RJ6ohLCKmD86jyHx4HEXN
	 HtTt/2XPboNKCsgZqb70dYJw5ar54cWSCEyFCeN2eyUnxhpgBWMiM2pKTsK9NXKQFSGED
	 d13EgxuEYU1QE1r2iStek7sUvTJLOSGS96f4qTGVp2MbPkqB0feHDIOKOoVIK9/oW0A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793122740;
	bh=8+vIqzM333XOOfHBpcect3hQqqMScaq8tnWI8XvmEKc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=auniji41wToc5LAL4J5RnOu280yYOBJ9zCjnUFw5inS2QmjVcYs3rSXxygZwm5oq1
	 Ez8PjEidgWcLn0cQciLWpzBLZvb/6WBtyawgGLhJ/ai2ffbdWsBpHbaQEH1tZRI8sZ
	 XaNkB3oLKyss3thS7YjcmXEi0hrjNdukW7o8v9xvTZNP1R4/90wJN/sLtzYe6DiIlk
	 EKIxdVtDDoQx8TVX1j/y93PvR9mj6OXAVlFJwvWBzzfP0lIjON/9gYSJYHrTSzOtvv
	 oAeOkgCWlDVGcrVXi75RZOerdpuIzcBxG5+CzeGkDVO1JVQWMY6tjD1E3V9mYOpvq7
	 T7gh34AnuxWtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A07D605D7;
	Tue, 27 Oct 2026 17:39:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 344ED4D1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A0A2401A0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uGa__eWKwWU6 for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 17:38:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C0C904006F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793122738;
 b=KcqUzdr70kiJUwxAgl4bVMTvxjKM9GKG/cv/SPksgZXNBe99WQ4VxW3+0fpzfSz0jOwa
 yjdCJGGhku2IxxBktTfsMgW1Wqq7oHhfnkDBttdNmfz3mGZw5jsdVf02xzED6d30JnP6T
 3K535zQt+fT40MiJma3kdDF1ewJ//0I/vK1p23zl6nFODFLwPehrFtTwT50C6HpqVzQZi
 6+lKCbpx7VX5ad9l3KJd32sYB6J5TwN5xXD7+wagpG9/BMI0d52c/vJ/cviStQZ1FR2U6
 g3NISqnCPwlD4mu8qzNRam/NDQZVDVQTgzCtlEIk6fchgYhM8QvKU3aQLEjOr7vBjBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793122738;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=hiAXVIYTXW2PD9q6vpIydxgqv0Rn6hb57gOiXYEyrz4=;
 b=kZeuHZ/dFNg00YkIqPlYJ52iTWfjzlsmD4XYWWIXV9hzUEoRg6KVRp2iO+QlvrLKcdFd
 5jL1MalIYVDoWW58PVT2FEdd7HQ7T0PhrJXu0O6+T2yxTzk28U2mKFqFM9Z8OgxVHHXSX
 cX3SXbX7eJwiUOS/wuURN562GVyU+p5dhGAe4KrRombWXqT7TWGkAFMgvQOHg4LrcO6pP
 GPWu5pao+w875mM12WBAWlqk5B8T2S5FkcMUWbnozYEt8OgTSSlncxXduApDU5viFY+pS
 OqkJtIgEadKWhQQWo6EODzXiIG9GOSv/XTFb5cf1RpjaMGc3GKrpdJ3CvJv2hIW0QDw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Wjc6YAOJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0C904006F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 17:38:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48df0fa43c5so94353f8f.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 10:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793122735; x=1793727535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hiAXVIYTXW2PD9q6vpIydxgqv0Rn6hb57gOiXYEyrz4=;
 b=niS4x5v4Jfp3t9GIdiIAvoaJlu6ED66+xYMFIeOSTgsUcNOA+768qHA2r5pjmwHpMh
 5VMyqI/qTt/M2QPhtVb4sUtubskxqaHNguUEY1hdmkwEAWMRPBHocAZTRDMrrMCGBNs4
 z3pVgYsJaDcX1Wt00fjXp2k0Ver3xfBtPxfdhd0uIorH9EbaJ6CiAdBOgSrCJ2gZNBwD
 NyrF6wWq4godB1YW0A3wUIrroSyVsdLJb9B/g+WrHOPEYXIWNmUG3i8Cna2FT052EkTQ
 wUkrKpP/IoxtyDAdaAgtiCJ+diGLN/OKOuwqtgPDUwLVx3dfWguMPN1gX0c6DUr4qzrG
 BVsQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwmID0glaA36Sq5r1W5IEsrkGjQVd7CZnc36X/iI8oPSCE/TV37gKcxaqyqOZOGLE+XeVr+y8yi6vc=@buildroot.org
X-Gm-Message-State: AFq9FYKPT4sxKLq9sGxrL+uFD1esS7NCWK3PXlG8v6/+sNey5mG7fFRK
 +oohuNAAMyDDaYTliTT+4GoPcrjW0B4OF985/1Rc+yE1D1+8kLQBUrqo/f8LpK7rJ+9CTcAGpie
 hgs8g
X-Gm-Gg: AYBFou2YUOL+vAu6FA+TTCkq1io2GQtdcxXrkxh0h0BwCIrXgIWWB0Fj96wRV/sx2Uw
 LT2K/wsFfpwNSHWgAiyMRtFI4o3K1bE50cT7VkNm74ZhuYfBOW0fBAVi6Ek7u92RDIHnB6xsZgc
 HrgG27wB+IPj5/EGFbQPIZlfuq2/piRw6iyeLk7dtN5U9YbA+/oQwfHdmnI9vX03cYLJDcFRhHE
 u96Z/04BwWPrlE/l2OC9PSXr1FJrIjL/ySnd34YrEQCZ/gBbmg2jzn4yuTC09Mx75i5F7l8jGQC
 NwxRKkc2K/AfxJAgTyMwjgdPxzPJXnjvakuwWyB9BW5dcLfDgSoD4buDapDv2hSgnv2D6Zee9ZK
 EcIc1KNSNEiT1ev35I5ekNdEMAQhFz66KFPbEqsxyU8PCn4fFSCEUZR3XbrvNHK6i1fZtRTko4u
 fn5Y+ylsdzMwQJAnMZMi+KumvmE8hoEUxD/vGQKdPdJzyO2Ah2+sUXScTBqBglr7/a28ADZJtgy
 /OXCU00Y22p3CIlmU3Ai3EPmi35cTFGhRTNhDJi5BG/CaMgInK4pi+JPH8nhmpDKyW93hI=
X-Received: by 2002:a05:6000:4919:b0:48e:127a:c914 with SMTP id
 ffacd0b85a97d-48e55a36c3fmr7645973f8f.5.1793122735060; 
 Tue, 27 Oct 2026 10:38:55 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecde7easm24305649f8f.52.2026.10.27.10.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 10:38:54 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Oct 2026 18:38:53 +0100
Message-ID: <20261027173853.301624-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027170600.130042-1-thomas.petazzoni@bootlin.com>
References: <20261027170600.130042-1-thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/drogon: add CPE information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thomas,

In reply of:
> See:
> 
>   https://nvd.nist.gov/products/cpe/search/results?keyword=cpe:2.3:a:drogon:drogon
> 
> With this, cve-check properly reports CVE-2023-26137 and
> CVE-2023-26138 as affecting the package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

> ---
>  package/drogon/drogon.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
> index 8c51d16ac0..4772228960 100644
> --- a/package/drogon/drogon.mk
> +++ b/package/drogon/drogon.mk
> @@ -10,6 +10,7 @@ DROGON_SITE_METHOD = git
>  DROGON_GIT_SUBMODULES = YES
>  DROGON_LICENSE = MIT
>  DROGON_LICENSE_FILES = LICENSE
> +DROGON_CPE_ID_VENDOR = drogon

Also need to include the following

DROGON_CPE_ID_VERSION = $(subst v,,$(DROGON_VERSION))

To strip out the 'v' prefix. As seen in [1], the prefix isn't used.

After applying those changes I ran

```
make drogon-show-info | utils/generate-cyclonedx | support/scripts/cve-check --include-resolved
```

Which correctly output:

```
{
  ...
  "vulnerabilities": [
    {
      "id": "CVE-2023-26137",
      "analysis": {
        "state": "resolved_with_pedigree",
        "detail": "The CVE 'CVE-2023-26137' has been marked as ignored by Buildroot"
      },
      "affects": [ { "ref": "drogon" } ],
    },
    {
      "id": "CVE-2023-26138",
      "analysis": {
        "state": "resolved_with_pedigree",
        "detail": "The CVE 'CVE-2023-26138' has been marked as ignored by Buildroot"
      },
      "affects": [ { "ref": "drogon" } ],
    },
    {
      "id": "CVE-2021-35397",
      "analysis": {
        "state": "resolved"
      },
      "affects": [
        {
          "ref": "drogon"
        }
      ]
    },
    {
      "id": "CVE-2022-3959",
      "analysis": { "state": "resolved" },
      "affects": [ { "ref": "drogon" } ]
    },
    {
      "id": "CVE-2022-25297",
      "analysis": { "state": "resolved" },
      "affects": [ { "ref": "drogon" } ]
    }
  ]
}
```

>  DROGON_INSTALL_STAGING = YES
>  

Also make sure to rebase to include [2] or it won't apply.

Otherwise:

>  DROGON_DEPENDENCIES = jsoncpp util-linux zlib

Acked-By: Thomas Perale <thomas.perale@mind.be>

[1] https://nvd.nist.gov/vuln/detail/cve-2022-25297
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/89fcc7132a9b4f94d082fb9936b4335d28d91b43

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
