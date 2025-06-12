Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D5DC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0861A4088A;
	Thu, 12 Jun 2025 20:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mA7nzu-GmxHr; Thu, 12 Jun 2025 20:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FF8840720
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FF8840720;
	Thu, 12 Jun 2025 20:05:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE9591BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B535D40720
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVMV1dnOPork for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0C9E405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0C9E405A1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0C9E405A1
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:05:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C28521C0E09; Thu, 12 Jun 2025 22:05:41 +0200 (CEST)
Message-ID: <47325a2f-cf5f-419f-83c4-6c766ce4bb02@rnout.be>
Date: Thu, 12 Jun 2025 22:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250531140721.515340-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250531140721.515340-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758741; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ggak2MuxhrKtiFui+h9YQL6Iz2zdxwC/t7gUadQdpJI=;
 b=YdKyLSou9BU7Jrvx6zQuptyiTxvOKNlNCuvit0arYC3bS8aZozs6zb3iej766nhIEyFWlA
 aciPoZ8v94kCfSJ1loDJ4iGt64FO8EQLYGtp8bidhbvcoz1Zwu69QSteiZhGL6Ku2m+jA1
 zqqqLgtpxiDtwhvm6BWHJT5nI2hXZhgTeWkJB98QfDBdCTe/As6kwYc8k7TVz0nDYePiOT
 gwbwO9cumNugB9t61NWC2/yaUF6VZjMfO4g0eCJVXFoPpHhjU/Llb5RoYUNOZpK7KLEhSj
 AFSSk/fsRwDOUrs80Z1Y78iW3yaJhxVJq50iom6RYOP+PL/pBRKzEQoZdc9stg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=YdKyLSou
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add tree runtime test
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



On 31/05/2025 16:07, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/10209445587
> ---
>   DEVELOPERS                                 |  1 +
>   support/testing/tests/package/test_tree.py | 54 ++++++++++++++++++++++
>   2 files changed, 55 insertions(+)
>   create mode 100644 support/testing/tests/package/test_tree.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d471b9ab6f..a7bb3bd834 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2031,6 +2031,7 @@ F:	support/testing/tests/package/test_tesseract_ocr.py
>   F:	support/testing/tests/package/test_thttpd.py
>   F:	support/testing/tests/package/test_trace_cmd.py
>   F:	support/testing/tests/package/test_trace_cmd/
> +F:	support/testing/tests/package/test_tree.py
>   F:	support/testing/tests/package/test_unbound.py
>   F:	support/testing/tests/package/test_unbound/
>   F:	support/testing/tests/package/test_usbip.py
> diff --git a/support/testing/tests/package/test_tree.py b/support/testing/tests/package/test_tree.py
> new file mode 100644
> index 0000000000..3865932642
> --- /dev/null
> +++ b/support/testing/tests/package/test_tree.py
> @@ -0,0 +1,54 @@
> +import json
> +import os
> +import xml.etree.ElementTree as ET
> +
> +import infra.basetest
> +
> +
> +class TestTree(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_TREE=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        self.assertRunOk("tree --version")
> +
> +        # Simple invocations on a path.
> +        self.assertRunOk("tree /usr")
> +        self.assertRunOk("tree -d /usr")
> +        self.assertRunOk("tree -dx /")
> +
> +        # Check we see the /usr/bin/tree file in the output.
> +        out, ret = self.emulator.run("tree -f /usr")
> +        self.assertEqual(ret, 0)
> +        self.assertIn("/usr/bin/tree", "\n".join(out))
> +
> +        # Check we can parse the JSON output and the summary report.
> +        out, ret = self.emulator.run("tree -J /usr")
> +        self.assertEqual(ret, 0)
> +        json_str = "\n".join(out)
> +        json_data = json.loads(json_str)
> +        # Report is the last element.
> +        json_report = json_data[-1]
> +        self.assertEqual(json_report["type"], "report")
> +        self.assertGreater(json_report["directories"], 0)
> +        self.assertGreater(json_report["files"], 0)
> +
> +        # Check we can parse the XML output and the summary report.
> +        out, ret = self.emulator.run("tree -X /usr")
> +        self.assertEqual(ret, 0)
> +        xml_str = "\n".join(out)
> +        xml_root = ET.fromstring(xml_str)
> +        self.assertEqual(xml_root.tag, "tree")
> +        xml_report = xml_root.find("report")
> +        self.assertGreater(int(xml_report.find("directories").text), 0)
> +        self.assertGreater(int(xml_report.find("files").text), 0)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
