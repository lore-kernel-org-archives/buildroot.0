Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3453C606A321
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 12:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EhIjnPg0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=q1dRROsz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EDE8607B6;
	Fri, 30 Oct 2026 12:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czbL6m7TH1dy; Fri, 30 Oct 2026 12:06:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B852D6079D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793362004;
	b=KOGZM71wKroHxUtf3WztvrIYM8YN93n9F2D8MV/YgJQrox/oqg+KOsgkKtPuot3t65R6
	 OL4Q+BYYN72NDve9jy7SS9mxOLTGV/KOC2t1GaOdW7kZdA41B1EePCurobMYlnT+u8bQl
	 AguN/isgb68w2iYnHdCbVthTDNhHU7Mb5pdKz2nvZ4hiNJH+PDc1DYF+b4tmPY0TQ5AQg
	 iKwSsVyq3XmraHEgUhKrHwlANYwMPslEyjwyi5hlEs5V/FXY/3HUA5fvO0H7BHlq3d0qr
	 6+9z7M3O9G+WoPjQCaIzu41UOqygBmy1u2Va0VwhCcwAYMhwQ/UG4eaBjphkaOA1Ahg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793362004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sLUI3r5HJoXiOLfhSyhIdabvycZzow9qr99PtbXywXQ=;
	b=QsNK+edwovcUKBA95LVQc1B1o6lcLND2S+rKbLB9iA5UG3kO8DH7k43a0saBioCwryCz
	 JsEpQ7rPQtfjVfeLikJC9rkfJ7pRjJXRwHECTx4wI0ij5ldItUg4hP81ZsOeH9Y8plWk3
	 eFvILB8zzmMlt1AIXgJkeeIPZUybp/3RyciYrRdym/1f/4kgeAsApo5LGPh17RWp4FnNn
	 HrQNMgQMoQ8h6tjmzWrfdvaRZvIzA7fP0JgE6ssH9Ay7huKAuvRcpWFadANc7TpI9rkMW
	 4YND35TU9B2ByV6wPhICBeXTXzKaQulS/mdDOwAIUJY7R4HbsFPtajt8IZuprO149Rg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793362004;
	bh=sLUI3r5HJoXiOLfhSyhIdabvycZzow9qr99PtbXywXQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EhIjnPg0jbZRnUttPVbX0gfRMIrbQ5aNTPD928fhzbmCLcYcQZpZ1sgo/appmmdVV
	 4dYgH8oEW/ZP7r+Ng9XgZ0TscHD5anr2sfuAHXcOaWMbo38+b2Pn3OEcQbY9Q7m8El
	 3qMiZGKGrm6CtVf24G1Yv3oU7tzAKMNuqVC3BOUEZvXfbWXbSXplMgPyc0iUWe6viL
	 08fwIJo6koJQ5bmh4q1R0TTABQWRbGG6/+rmaqEhPYV8/coU8ScOmdhIVFnLA4w5Ap
	 CLlMO0Vrxi4JlnbSqjepPQxRxYTvnlduSHnH0EMP5JsgJiPkF4oCJa9Ny5i7xIVBs3
	 z7cFcQq9iSlHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B852D6079D;
	Fri, 30 Oct 2026 12:06:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 602FB4BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 457FC40243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIRHxC09Swxp for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 12:06:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2D2E4401EF
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793362002;
 b=ihqBHlPkK2nI3Sh6aaflh6jbPCJ/wLjhwrp/DiOoV5+4Ic7RhsAQLDZEytc8EgT5ZnPo
 EGD43i2Pd7JejGvJlEtsGYd6x1q3cceZv1KnLwSONBvItDxQwUexcTznBv78tOjAlxWJ7
 wsmHd5o0ZFuFmkc8ZyMNTRhO0OTy8aznVyNBIL8mDvn3iF/kjlzlUmdDIogrmp4mjMpEb
 h9Jw5TLB6J1FwcQ+0e6xLh3rc0JcBlsosmgYQ4tp4Ql3xiI3B15JRWZc+5Eoy7o6f6zcX
 FKLOIU181N6/1pF3vZf5nIlhUgjq1nFK7OdTHxfBTQukLv86V7Jny/xgqGCrBt1pB2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793362002;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=qY/T32mgacpZFvml4ss5OEm13VR++VxqNvqGc0Hz6Zg=;
 b=ezkOEmOHN7GxRMe0xjkVyhz6hAqseJT8NGO6gcOgdCFQvKCTljciOHHM9Z/mlMaojoZn
 btvMWL5Yw16cQsC5bfRgxdOLKoH6j4yHzJTKaPmQRxq1I0Tw71BkTf5gJscI85sVEUu8e
 Fn0y77czEks1U7Pv3XplXq1gcaweBemw4k2WuZIoUKpVQIPS1ojmdEzUk7bARp39wGAJr
 5b76mta/fFx208g1n/zRYAHTWYZR5GIRIkrPcAFi1eodeMCadWUAv9E9eLhDpg+XnJsKh
 0Jm6zljiYBi3UyorRKsby4rdSJxe2II6GaIwRyziTG/B+OolI8ilXeQUBENZ+TyKE2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=q1dRROsz; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=q1dRROsz
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D2E4401EF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 12:06:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=q1dRROszbkpeD0U3v3uF5czlzoMdD9mYcCzHf9bbv/F/YvElR1wp/7J6Nx/NuOmBzjV1IFUIHrZJLdiQKndQYDZ/iYIPG03pBdcqqChpOFoIAx90XlUoa6Aj5icQYs1Hjj/RswQ6gi4b1rYPCrflGzGhzAPmuIITw7DsaKRfa+v6UNSnOXoCP5DPNq8Xik9E0kCNkTAYjN0u/Pbm9uWgS6yU69vb13R1l/9JXhn86GmTeV8ixx3DWE0wniXomYbIUYhCGh7bhZTdZrKLFjZNt5eRH5vWKKQwCHKiP5+C2kMCe7O0wbUko9brDGGEqyTa7LvxkCQmjvxA97r+DsoCJQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=R5NdpiQJRkaRs65e+ejTJ0zw2kHJ7A4ArrzB35OfwgI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 648591884; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 30 Oct 2026 12:06:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xMlNR-0000000DHo7-3QcF;
 Fri, 30 Oct 2026 13:06:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Daniel Drake <ddrake@baylibre.com>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>
In-Reply-To: <20261030112940.45635-1-ddrake@baylibre.com> (Daniel Drake's
 message of "Fri, 30 Oct 2026 11:29:40 +0000")
References: <20261030112940.45635-1-ddrake@baylibre.com>
Date: Fri, 30 Oct 2026 13:06:33 +0100
Message-ID: <875wyjwfxy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/imx93frdm_defconfig: fix U-Boot
 build without host GnuTLS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Daniel" == Daniel Drake <ddrake@baylibre.com> writes:

 > The mkeficapsule tool is enabled in the U-Boot config for this board,
 > which needs GnuTLS. If GnuTLS is not present on the build host, it fails
 > with:

 >   tools/mkeficapsule.c:20:10: fatal error: gnutls/gnutls.h: No such file or directory

 > Enable BR2_TARGET_UBOOT_NEEDS_GNUTLS, as the other i.MX93 defconfigs do.

 > Fixes: 638c9592cf ("configs/imx93frdm_defconfig: new defconfig")
 > Signed-off-by: Daniel Drake <ddrake@baylibre.com>

Odd, I thought I had done a build using utils/docker-run. Committed,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
