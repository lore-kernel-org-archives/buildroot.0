Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297F606A31D
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aZlXP6DK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e/m4dA2O
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7581D8203A;
	Wed, 21 Oct 2026 20:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YQdrqRveLhlJ; Wed, 21 Oct 2026 20:34:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 765DD82023
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614872;
	b=UZINODGsOXTn/VvhTtqa7JAdRZ+gR88xvtvCP07mPkhMIrfS246bGzHRYZ1psUw34p1l
	 JYihEIa3/71AfaszbgS8vE9nl8JJx3UvoSXXvgYfvlrn8jqw+WmjN6u3niS/uiIK+WGWw
	 24ie9rhocSNBDEeiaFBFbXeru5k+y088+ez3lAUn3d2vu8V+R01S/RhPmIeNVFxxdrmJs
	 EaL+vPc1tjO+wQ2HstHAmRy1MdbM8vk3kHCPHCyP7qrzC+MaDTR3oECTlT0ne/arTlHBa
	 PBrDrdLd73r/sZhRX2909N3YxgOl3nxx6gHfFOCpwY5Rpr9nyodcSA3/RyH1splZ9Iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4FXHFUg9mMglCJxdNwzotDr/8+eBEd55qXWbNaBFG9M=;
	b=N0wXY0JU/4StQNSTHWAksiq8GjLc57vsdoCUjZLgCM0b+u/adr4DCqRhTFmEEHwP/QpW
	 vgRSu0FE3TsXUoYNWqKxLCLvthZt0A27NiitVH4GGK8UjFdOOcTGbu28JwUbOKIkt+rG7
	 sW8IxnlIbKdEaKg0mQ6FvG8sVlJUBwoynaIWgRu7pU2ERd0IZK66eqGF89Ur3+AUJzFoI
	 8TtwgIyBALee9fZ7BEfcUqeno8dGJQQjFwxe0dVPOjkcn3x9fZFE2o3CCU1VkhEBLLhvj
	 2HypjV7n2IQR4Budl6HnvlBF39EnB8Uj5CzmVoVu04xKH5pj/boUs6BqJPqz920FIRQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614872;
	bh=4FXHFUg9mMglCJxdNwzotDr/8+eBEd55qXWbNaBFG9M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aZlXP6DKEkQoBw4/k6wNyI5CFykl+skA2WRRrzxBwJUIfX+xCc0Q4RoxEiKPkT9/B
	 mVWN+RkyCwc2Do5nHKkkqmZOJEIT7/+bJt9/MuTWXfuMlj+Ppo5wNFV1EnfsLgF2Yt
	 v4RTBlpm2iQpMhITX0Otb2RYdU+eKv9ruviCO8C+hzd6EszD5W639/Z/GlRfyz/iaG
	 F01ZpMhtUUfYthZb4+pAM6re/iEowcxEYzKv9fOJ+Za3eOH9QYkp/qiO5yTH2N0wIL
	 7RmXADMXcWCeBFYAEO/jSOs843VRxqobwSjeujqLUcZQvwoiNnKEwEDgp+lp6Cbmdh
	 LiTPdOt7N1Zew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 765DD82023;
	Wed, 21 Oct 2026 20:34:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25BA63A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 178B561614
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzkl7U7mhary for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6954961611
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614862;
 b=AYhnKo9RBhBTz7LTQ5IDH5WldJfnZq/3ASpWpUNlZwTPVR3FOdxfZ4GIMRnhT4jHMMM9
 +HLQzFa2+w2WJYRG2rmZV+Kg7TG7RxBxcuzsxawi7PLNmuFa4RGE1Cbo/Zmyge1v2e9lX
 0mnR1SnSUid9O0kvvJTJGxZqo8kNKb+oDVGgEU6hGCJEE7odKvxEfAN69YM22FqDb9IDq
 uoB9UhBkhhRNKXN1tHMBS8f8uD08+Cj3sbvqa8gR/Bqya0bivfcpOSkKOwDKdPoKyXCFl
 sT0GI1Y0mZFzDBKliJgI5jXyPQ51PI8FLdmBLRIYP+uhlq9vsnK7fx7z9TcRbKqSFmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614862;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=NPIlpoRs0mI1j/j/44MRNIFIClbDRlhOQdqXDUgvPFo=;
 b=OqDa4h++zAVQc9TVq5l5wDAABAlSFTVdjm0QqNsqPfTsCCZ37H0mkRqeHTdzZwMfocTQ
 g5Tv4jmOXGFZd/HdPPqrHUDExxwJ8H/LHoC53AKx9QK0e2RnFVZzEElbqQF4CSsVUvvzQ
 vwWOlouoZ4KYzrt0+WCZ0YYIOFBJfGUtC6ayoAXBhop5f50F+bKim/3IhYIjjKF4Wsshf
 2Qp3zvhUkSlkBK5hy6oNLJd8XbDy0rmpdtDe+eqUDxdSIFig56MTUAjqAZWGDj4l5B5ti
 LrD0merqvnuxso+JNO2CAYGoca7oZ+Ijzq2J/rX+RAmcRay1c3SQ8HfVaIGm6TWaUcg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="e/m4dA2O"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=e/m4dA2O
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6954961611
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:22 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-8446af403b5so831164a34.2
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614861; x=1793219661; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NPIlpoRs0mI1j/j/44MRNIFIClbDRlhOQdqXDUgvPFo=;
 b=e/m4dA2OAtO5NDok/VrcRelg8lT8qYQ4ZqbyV+9+M796U5GlPZgpz1lxhocxyS+MeD
 EO4LNpiZdNjAG63UgYQyGkJ3d5/7izNrI2nPjxogxg/bwpORls8IUHXQB+VvkJhGHmxN
 Lgf5yr7T9h0pKtHTVmYPW+pAmoO2l9MhwS4dqynNOxJb11CKz0kMAr90ZMFsGpCZdNwR
 U0ug7korZjqNyRu5n2+SFg8MEuM+JS5XSzlfxzuV3BCFeBVyvbXijVtZkXd6t6Wdyevc
 X3Ru8ZRMRVQnWqAONJQ6wKcDUXQrn2ETxg022l5n9WStIJmuLzANWN6CPTXLvnMTXNB2
 tcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614861; x=1793219661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NPIlpoRs0mI1j/j/44MRNIFIClbDRlhOQdqXDUgvPFo=;
 b=S/RJPJfFZuYGGYsWgNP3JwqkHtaRyFhQbHGQhg4hwBfLKyInm7mFVludf+vIWtC40a
 Hd0aBPaUriyC67euplyXNH4X9rqduCvjQ72/9pBuJYwgstKFe0mvgoHI3bPkrTs/ax9Q
 BHSjD47V9GP4sYndE98G5sHiorUYqa4ebF9Ijqw1DoQoW3wsUtqCrNPUOIPcs6Nzb99h
 K1PdawAB2eqqDtRXy9Ved4caGYWXEGXKVhOsm/0V9pmYO1RhuJDtsOBSeTXtKM4481lX
 xvnsYvIsPctb93Rgp9cddwNB1Jg0I2FYbZJWgxth6bfoXqbizl8L26Su0vVDk1C+xjha
 /J1w==
X-Gm-Message-State: AFq9FYKp+KhIQf0aSv7HeT4r2Y37axLVfF8taFLA7EnFPZmOjhOy5fw1
 n5b2EB7Prl6aGsTjr6yAKuagIH5h3voGarw/Eqc0PUl+nMSueSw4JnQQmN+N3g==
X-Gm-Gg: AYBFou1t6HivOI2GdpSndq0VD8YQNCJPP2jjh6wHmz9mGGQqnqnRzJASro9+Di8br4P
 gleApShjFFE5lDxk9B4uRoW9T5jnRkO5Qx+q5uwZFHgl1kqYklp/T2UclfphLLO5WGpye5Lx2yN
 aYEEMQwpFEHvdBFu0vcFIUezYJLpzBx9YmFO27WRfBEHc1+GC4LSw3VFMSqhGCWwNhhh6YUDTpr
 9IJ3SQeBXFCcBeW1Vx5pswFPpXbbSoBM4pDlm6aAxMnZMNDyp+mzb2A7r1VuOqs0GC/XkAAeSUV
 Ys91lLB/i+0NSYT0TVWw/PXr+ZuNSJJd8rwh1kmj0uEzMr6hWKa01XPamGcS24bXEtYXCQTDJME
 e50QS4+kgGIkMI95Bqft2qpX5eDDjdgLeD620F6f1L2JHiFVCdYnNjXPCy/8SF+aWKc9hRpw8qG
 qxjx2wVY+9VD4EspN8uQcYEVj/4MuHRGF+VVPuJKrm/H0Prtf4KYiXXRIi10Z8I8d1H+D4zVdmy
 6WT5/wPYc5PcMRf9dTLDiQyF3OuNKul9HFEZcIIyPbEMizBmsAOGkp2Vj0K0XwKdOiBSM94L0yz
 TYYvpayyfndDqd+Jam6DSqK60DyN5cqWkfDcQmWMQBAKwQ7Fl8fybuffRspJdVV2xp3Z3vAiTNM
 bVXCFBu6oq9EyyM61z7ndgZIRkf3506th2ao+AtIhY/jLks1LFD6N7yu/xj/kJcEeovSW6iT2ea
 qcmJSPetukJv1CRYa7mwBEAe8=
X-Received: by 2002:a05:6808:1524:b0:53b:87e5:8c9a with SMTP id
 5614622812f47-553596fff0emr2288063b6e.17.1792614861176; 
 Wed, 21 Oct 2026 13:34:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:04 -0600
Message-ID: <20261021203410.3114473-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 10/16] package/python-shellingham: add host
 variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for host-python-typer, needed by the typer-slim
dependency of host-python-jaraco-text.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-shellingham/python-shellingham.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-shellingham/python-shellingham.mk b/package/python-shellingham/python-shellingham.mk
index 7e07606714..7253774dc3 100644
--- a/package/python-shellingham/python-shellingham.mk
+++ b/package/python-shellingham/python-shellingham.mk
@@ -12,3 +12,4 @@ PYTHON_SHELLINGHAM_LICENSE = ISC
 PYTHON_SHELLINGHAM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
