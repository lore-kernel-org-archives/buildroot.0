Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270FFC5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E97076072E;
	Sat, 31 May 2025 16:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBwMlnNSzxar; Sat, 31 May 2025 16:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA776069D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDA776069D;
	Sat, 31 May 2025 16:48:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F03E235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F2336064A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfeQ4Lv4jr1p for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D72360640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D72360640
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D72360640
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:48:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A44E1C00BA; Sat, 31 May 2025 18:48:26 +0200 (CEST)
Message-ID: <d2d235da-debf-4e4d-95ea-b546478229f3@rnout.be>
Date: Sat, 31 May 2025 18:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
 <20250514151255.2316205-11-buildroot@bubu1.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250514151255.2316205-11-buildroot@bubu1.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710106; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=A4bPbcrqSdPe6qpdQoL4BMfRfni2kF/jctP1RWmVqMc=;
 b=lGlB14SlnHyO7YB9YAOpaWr1aqqCKuRwH5AtH95ao0Qu5gsX+/6o6bQ0ShMp6lQKY0r1SA
 3+XWv9MJ+spw+5NqP2SZ3LhDKHZw0VUMCRrRvFsUybjKse2NfTKIac3sIeVSR2cFzfs4Wq
 x2GmAPNVpXOc8CZLO1ZmazNfl0eM/XZHqPk8gqEsJ5qni5/h8oeqC4FQMhPo9aCqERJ/Nj
 MUErRFeSjU0wgwrQ2HuVGuit92KeiKfwXnXHUMk0jikweEjrb+Kg/Xzva8rJND5WodNWpp
 VDHG39dvCXwQD+hecEJHEZ2qjZtxKRgmkZzfSPXL99RJTfD/PP+bjVsh3hCLrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=lGlB14Sl
Subject: Re: [Buildroot] [PATCH v2 11/12] support/testing: new
 python-pydantic runtime test
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2025 17:12, Marcus Hoffmann via buildroot wrote:
> While in theory, the fastapi tests finds problems with the pydantic
> package, it's not obvious that this test should be run when the pydantic
> package is updated.
> 
> Add a new test that just covers pydantic.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> added in v2
> ---
>   DEVELOPERS                                    |  2 ++
>   .../tests/package/sample_python_pydantic.py   | 32 +++++++++++++++++++
>   .../tests/package/test_python_pydantic.py     | 27 ++++++++++++++++
>   3 files changed, 61 insertions(+)
>   create mode 100644 support/testing/tests/package/sample_python_pydantic.py
>   create mode 100644 support/testing/tests/package/test_python_pydantic.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 86a03fb74d..6138fd1ae6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2281,10 +2281,12 @@ F:	package/python-typing-inspection/
>   F:	package/python-tzlocal/
>   F:	package/python-waitress/
>   F:	support/testing/tests/package/test_python_fastapi.py
> +F:	support/testing/tests/package/test_python_pydantic.py
>   F:	support/testing/tests/package/test_python_ruamel_yaml.py
>   F:	support/testing/tests/package/test_python_tzlocal.py
>   F:	support/testing/tests/package/test_python_waitress.py
>   F:	support/testing/tests/package/sample_python_fastapi.py
> +F:	support/testing/tests/package/sample_python_pydantic.py
>   F:	support/testing/tests/package/sample_python_ruamel_yaml.py
>   
>   N:	Marek Belisko <marek.belisko@open-nandra.com>
> diff --git a/support/testing/tests/package/sample_python_pydantic.py b/support/testing/tests/package/sample_python_pydantic.py
> new file mode 100644
> index 0000000000..4c22f5ede4
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_pydantic.py
> @@ -0,0 +1,32 @@
> +from datetime import datetime
> +
> +from pydantic import BaseModel, PositiveInt
> +
> +
> +class User(BaseModel):
> +    id: int
> +    name: str = "John Doe"
> +    signup_ts: datetime | None
> +    tastes: dict[str, PositiveInt]
> +
> +
> +external_data = {
> +    "id": 123,
> +    "signup_ts": "2019-06-01 12:22",
> +    "tastes": {
> +        "wine": 9,
> +        b"cheese": 7,
> +        "cabbage": "1",
> +    },
> +}
> +
> +user = User(**external_data)
> +expected_user_dump = {
> +    "id": 123,
> +    "name": "John Doe",
> +    "signup_ts": datetime(2019, 6, 1, 12, 22),
> +    "tastes": {"wine": 9, "cheese": 7, "cabbage": 1},
> +}
> +
> +assert user.id == 123
> +assert user.model_dump() == expected_user_dump
> diff --git a/support/testing/tests/package/test_python_pydantic.py b/support/testing/tests/package/test_python_pydantic.py
> new file mode 100644
> index 0000000000..1369d82f59
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_pydantic.py
> @@ -0,0 +1,27 @@
> +import os
> +
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonPy3Pydantic(TestPythonPackageBase):
> +    __test__ = True
> +    config = """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_NEON=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PYDANTIC=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    sample_scripts = ["tests/package/sample_python_pydantic.py"]
> +    timeout = 30
> +
> +    def login(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(
> +            arch="armv7", kernel="builtin", options=["-initrd", cpio_file]
> +        )
> +        self.emulator.login()

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
