Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB4606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CjUCT1Me
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C79FE811BF;
	Fri, 23 Oct 2026 11:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVV1kVB4R-lO; Fri, 23 Oct 2026 11:52:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DD54981201
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792756358;
	b=X8woscQXKaPEtpjsAFex0iNEdCTLvQ2CjEMcR11BklHL2sVy203/eWDIAnZSkMLO75jZ
	 J+K/IAm/8+KJdGYhWG5dNhQfHAcoHHUxGOx//VFUndXy1F72zcRsi3zzTYiSs4ApUHkPX
	 qI8dpn9d5qWW1SRMvzOnAhKCKWuOlae8BVMS/Kte3vWCLuFtUGlVSHe+g2LfUkaJMMBY9
	 /yppHhIfnX3yQRfGirmygSu3WlKRyD2zoMuj2GlDMR2Dqzn2bg1EVaxVojnHPb+Fd9fSf
	 +HU8h0SPgLliyE0pFi521lJSUbvq2scHP2O+Oe1EoFdPmxrDbXqRxwTc0C/fUve0rxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792756358;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gUfzLsay5fUqbOwQtdYZ7FlnNhH10HnjrtzT6WeV6u4=;
	b=J+MiRc0cIprOBOrTCcJSkjeR24/TQrtMhcVkhxdYg1wV/DJqMzxQZmzuvyHsrVe+8BSF
	 /Gbor2F6865HGoWLxrmg1Ay5qVln8EwJwU8zNOxYMGzP3ECgONlFPRzI+zGhIosSSAWC9
	 G0cS7Is6gdmWMmJ4yUE1/37snkEYP4RWnH+oglDdSxXeBJgss2uiV4KYoeQiDJ2Dl4lcc
	 DaKYLTAwV8g/rgk7oJdNJPzggZLQ9vTum3M5UXY663ntARzZpe+CvTVV0hp0OsX1bzYDY
	 O2/zJYBCEBtxI4Ql1dVpQvQJtOkLgyEjQ+KGw85to3x8kj6ogS6OR0kQ+X7ZopArXnA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792756358;
	bh=gUfzLsay5fUqbOwQtdYZ7FlnNhH10HnjrtzT6WeV6u4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CjUCT1MeBnYj1nQXxb98wNFkl97yQcGnPO2ldhfZHP34zaRmaGtl0XvcsTQ3HvJt6
	 PiB2WY4JagoYdLx46ZdX14HSFaFbTU/1wIpckT5ATaWCVTxvGb4KqfQsNN/ziilKXC
	 DLj0JXsI2pQKzxrGxxyKprO8I7dajzPQk67iE9Ak7a2wHnCkJaCtm4UZcO7S0nuCxg
	 tyVaATkmp5eyV92MlQwpGybffH9MF/bQDrA81nd4XqJki2KSkfPtJXgBqSqv9SQJUU
	 YGaw8/hEVN89UK4NH/o5Ys20a1Engnm16QksDFwxV95ad9GO8L+ZHCdZfCI88T9BFC
	 pXeH7D+qJ4McA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD54981201;
	Fri, 23 Oct 2026 11:52:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D483C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CBEE400DC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fsXoQZAN4nW for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 11:52:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6BBCA4008A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792756355;
 b=LK0LKthZhXK9pShhCS/9Jd8d7K3GIiDudjSHgKHBA5lbkx51KiwF47A6CYu+usmMIsMn
 PxMRbWKxIKFMSaKwS6RssGiqG/qBRp5kJ5RcBDNQRXPrxhZFyOSvw67VKjsQY5JLfzEgf
 B5m59J5ICj52O2Vunz5d9H6eMQlwh9uXemKILI9thmLjtsrVbqzzgSdEp6b87vvCjRwE+
 HFGrv2oY4suyrmTF2tyoamMDZByL6w2LXbpPYjKghd4yZVmHMKYUSZmSZyaqgo8fhkB5O
 ZE2Z6itEG6hTh9HGh2T38PoLUGhAgAZ02pWWluWFZkSC0VGFrqUYyK77mj3R1tk+4nA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792756355;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=sVZ8Ywem4a2rAQfhTCrUxv8xuxO0r2CTrV44obZdeWg=;
 b=grxxvxDSXFXxcSXzod9pbjdPLYkEuTLZBy/d7Lo4ZBwG8Xj3DfjpMjxyeVnwMVoZOF76
 3Xz5RDc5oempX4aXUb/kk8C4QavKswEE08XrDnoejNaT8hxBsoGhji6qquNshOZ5SbbR9
 v2/u2gNH/PXWLnCUH7yIRcUjbKCV+9WcI4K19yi+Y9CKT3tyW7U08wTTCNp8Q66BTt/FG
 93UPTCFaRh+ce4PYPUJxl68pC8Clhg4YjFnjcPR2RiIY4NWxu1hhghXXVQeZL5XgjWjyu
 +u+v30L15WPF4Kqa6pab/4En8FQFUTSH+0Pc9X4lfQ12XjZLA9DurezEM+Uyc7kkHSQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="RgxMzsP/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BBCA4008A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:52:33 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a0286c981dso8168845e9.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 04:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792756351; x=1793361151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sVZ8Ywem4a2rAQfhTCrUxv8xuxO0r2CTrV44obZdeWg=;
 b=Z519EXpvt7a9O3A2KXemFmcR7Au3Fy7wssmhuwGJ9YtgGjIuFh1iKNdJPaQC2LLvqe
 0OUqmeUeRkezqHECuBWgfb2eMYPSUYu1igjePM8j3BciLDS7fpSD7uUUkutU/uEuZo3z
 Q3Xc3WXtdNqU8BVutRDryf3Yc/m7pRInvoTzmvS1fdQfmaEFYgkXVa9IqNCZlR69+lZd
 M16/TGIoWwj7Gn6x/A5Wc0AcFnnT1Q2tmXQaUAOXXIKtxzltT3QkwWvHCOT30cJrpCys
 S38ZnCT3xUTNNqGq0MbM/Ti1GwICxskHxEOfl8Ylvk75QzNmVycuW6axS5uBxWTcD7Hk
 ByhA==
X-Forwarded-Encrypted: i=1;
 AKwUvByco1yo3NwMoHMFQrTlbFpVcbN8uCCv7GvtlOBbemm0m8qobulHywCdHkDDeC/gG8fbUBmj2UdQ3kg=@buildroot.org
X-Gm-Message-State: AFq9FYK7uRpvznBXfO6EeMGxGpuw/q5f+GqhGKuTHinls3V9WChFiXTV
 AB7puIRGDX0KplgMIDROPHKwY2BNWtOd4y3/TwSr1I+8dyMSVMA08kO06z6NptQ9xPkpb5f+cPX
 rA4Uz
X-Gm-Gg: AYBFou1s/O1TCOut84nAfJ7zc0cBSywiwfT9A1XJAbJH+V8X6PdpRXTD/9fsNO9NAMs
 9U5uwEQfFpBDxE06ZNnP8T6q1Ig+t+57VxyON0TPKj9GUst4oEGhxcCeBhmWY9P2I5Y6tk5UJFK
 YkFIydThigZ16SoGIdsR7i8CH6lU8tN9bFfYUxiETtFpfViA0UuOnEtoT2k1ECpg095SEhWTcaZ
 6CbSn/CSY+0/UtOt8QANjQV+8N8qIzJjIyavQCsPP8OsGt31HRWc04KygCKr/2tDSa9zHBqtuFq
 mhljdzT9iTc33k0OrhPcn5VElSoMBOgFv/adqN1XwtzO5OXWqmZW1MuJZzt0XKH+S4fRmqAZ8Rh
 OVny8u20B8ahPxoDsvSZIAOlNpYye8MAG1rczqRHo5N7sqkpBVCjf7laJxVD7t6TDOFPe8OPFwz
 82mMi+SFoOh/aENwD/DyttBYOzBLYFMOlyWo7GAFmVTV1vVPksA+MEsdbb1RylrorjPKbuQRoQN
 /xrayfJMq2rhWH/9ONkEU4+m8BdbfvVD0F4RYkLpd7rboVnvQWvS0eXWvUI7IQJFol9Wufhqe8y
 x2nBP7xoLf1KunOs
X-Received: by 2002:a05:600c:6990:b0:4a1:f377:5c68 with SMTP id
 5b1f17b1804b1-4a215aec798mr23251745e9.34.1792756351375; 
 Fri, 23 Oct 2026 04:52:31 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3805c596sm4864414f8f.49.2026.10.23.04.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 04:52:30 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Date: Fri, 23 Oct 2026 13:52:30 +0200
Message-ID: <20261023115230.27888-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atpWg5UkR_bg_Qo9@windsurf>
References: <atpWg5UkR_bg_Qo9@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: add uuid as
 serialNumber
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thomas, Heiko,

In reply of:
> On Thu, Oct 22, 2026 at 08:19:54PM +0200, Thomas Perale wrote:
> 
> > It's optional in the CycloneDX spec but it _might_ be required by some
> > regulations to have an unique identifier.
> 
> Ah. Then maybe we should leave it out, and ask Heiko to post-process
> the CycloneDX SBOM produced by Buildroot to meet his cybersecurity
> folks requirements. And we can revisit that later if other people show
> up and ask for the same uuid field.
> 
> > It's OK for me to include this change but I would still like to offer
> > in the future a solution that can fit both uses cases: reproducibility and
> > output customization with product owner informations/requirements.
> 
> Like "generate-cyclonedx --reproducible" ?

Personal opinion but I would prefer to not add too many arguments to the
script to keep it easy to use and readable.

My idea to is to be able to pass a JSON template that contains custom information
and allows to use a set of tags that will insert information at runtime.

Here for example what the base template would look like for the reproducible SBOM:

```json
{
  "bomFormat": "CycloneDX",
  "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
  "specVersion": "1.6",
  "metadata": {
    "component": {
      "type": "firmware",
      "bom-ref": "buildroot",
      "name": "buildroot",
      "version": "@BR_VERSION@",
      "cpe": "cpe:2.3:a:buildroot:buildroot:@BR_VERSION@:*:*:*:*:*:*:*"
    },
    "tools": {
      "components": [
        {
          "type": "application",
          "name": "Buildroot generate-cyclonedx",
          "version": "@BR_VERSION@",
          "licenses": [
            {
              "license": {
                "id": "GPL-2.0"
              }
            }
          ]
        }
      ]
    }
  }
}
```

Here another example of a template someone developping a product with buildroot
could use:

```json
{
  "bomFormat": "CycloneDX",
  "$schema": "http://cyclonedx.org/schema/bom-1.6.schema.json",
  "specVersion": "1.6",
  "serialNumber": "@UUID@"
  "metadata": {
    "timestamp": "@TIMESTAMP@",
    "lifecycles": [{
      "phase": "post-build"
    }],
    "author": {
      "name": "..."
    },
    "component": {
      "type": "firmware"
      "bom-ref": "my-product",
      "name": "my-product",
      "version": "@VCS_VERSION@",
      "components": [
        {
          "type": "firmware"
          "bom-ref": "buildroot",
          "name": "buildroot",
          "version": "@BR_VERSION@",
          "cpe": "cpe:2.3:a:buildroot:buildroot:@BR_VERSION@:*:*:*:*:*:*:*"
        }
      ]
    },
    "tools": {
      "components": [
        {
          "type": "application",
          "name": "Buildroot generate-cyclonedx",
          "version": "@BR_VERSION@",
          "licenses": [
            {
              "license": {
                "id": "GPL-2.0"
              }
            }
          ]
        }
      ]
    }
  }
}
```

I don't have anything ready to present. But I think it address the needs of
multiple user that want to add custom informations to the produced SBOM. For
example:

- https://lore.kernel.org/all/20260305115752.1861153-4-martin@strongswan.org/
- https://lore.kernel.org/all/20260305115752.1861153-3-martin@strongswan.org/

Something similar is used by 'brotli' to generate their SBOM:

- https://github.com/google/brotli/blob/master/sbom.cdx.json

Personally, I think what Heiko is doing right now with 'jq' is unfortunately
the correct way until we have a better solution implemented. If this series is
applied I will have to use 'jq' to remove this property for my use cases so the
problem is just moved to someone else ;)

Let me know what you think.

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
