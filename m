Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11CFC83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 21:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C2BB60B45;
	Sat, 26 Aug 2023 21:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C2BB60B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sYasVBga4b52; Sat, 26 Aug 2023 21:51:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE2460B01;
	Sat, 26 Aug 2023 21:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE2460B01
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 713881BF283
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 21:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D1BF60B01
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 21:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D1BF60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cPbgKjaJYTv for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 21:51:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B84FA60ABE
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 21:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B84FA60ABE
Received: by mail.gandi.net (Postfix) with ESMTPSA id A611460003;
 Sat, 26 Aug 2023 21:51:18 +0000 (UTC)
Date: Sat, 26 Aug 2023 23:51:17 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230826235117.0d0ebbb9@windsurf>
In-Reply-To: <20220926204505.1870869-1-james.hilliard1@gmail.com>
References: <20220926204505.1870869-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693086678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtixcwRrzAA7fDWUg4uwODoCAqzmhrnonWKn3kOHHL4=;
 b=M7tvZJFwj0m38JzmDtI7+ZcB2vtJLAXw7vmhmLJbGVVXallvp12yR6///k7+FLcyp5MmFm
 zUL9DA/QDbpKwvpPROPA/yCjrGb7cEmdbUeXOgADG1k2SFq1m04p4g9afwya9fTzjL4AS+
 kRr1YV7l8DOZ9Eo3k/KkFF+PlLOiNccIEYmsAqk21LNAN7LQalWPaSOfwbBRsEfMtmlHuG
 Ni8kVskA1zgPaMd/mEG44CK9EIJYCYizdjwyxUVRcepFRcdSu/qAlLUgngInud2dFVVNNO
 Rmtf2/QjXsaPdbt2stAIX73Aznr9T8F7QnJq82XAohXlkXyXBI0No/ZvYcNA3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M7tvZJFw
Subject: Re: [Buildroot] [PATCH 1/1] utils/update-rust: add new util for
 updating rust/rust-bin
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Mon, 26 Sep 2022 14:45:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Manually updating the rust package is tedious and slow as we have to
> update and validate hashes for all supported rust-bin arch specific
> toolchains.
> 
> To simplify this process add a python script which will update and
> validate hashes and signatures for the new desired rust version.
> 
> This script is additionally capable of resuming an update if
> interrupted which may be useful on slower network connections
> as validating gpg signatures requires fully downloading each rust
> toolchain distribution file.
> 
> This script has no external dependencies other than the optional
> python-gnupg library which is needed for gpg signature validation.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sorry for the long delay in getting back to you on this. Some comments
below.

> diff --git a/utils/update-rust b/utils/update-rust
> new file mode 100755
> index 0000000000..2aad3fffa3
> --- /dev/null
> +++ b/utils/update-rust
> @@ -0,0 +1,226 @@
> +#!/usr/bin/env python3
> +"""
> +
> +Utility for updating rust
> +
> +"""
> +import argparse
> +import errno
> +import urllib.request
> +import tempfile
> +import shutil
> +import io
> +import os
> +import hashlib
> +from pathlib import Path
> +from os import fdopen
> +
> +try:
> +    # Requires the python-gnupg library
> +    from gnupg import GPG
> +except ImportError:
> +    print("Unable to verify signatures, python-gnupg required")
> +    GPG = None

I don't like the fact that GnuPG is optional. Indeed, in the .hash
file, we indicate that the tarballs have been verified against their
signature. This script updates the hash file, keeping those comments
that the hashes have been verified against the GnuPG signature... but
in fact if one doesn't have python-gnupg installed, it's not the case.


> +def update_hash_file_entry(hash_file, old_version, new_version):
> +    tmpfd, tmpfpath = tempfile.mkstemp()
> +    updated = False
> +    with fdopen(tmpfd, "w") as new_file:
> +        with hash_file.open("r") as old_file:

This function looks extremely complicated. I would suggest to try one
of those approaches:

- Entirely regenerate the hash file

- Use regexps to modify the hashes + version

Another nit:

+                        if (
+                            len(words) == 4
+                            and words[0] == "#"
+                            and words[1] == "Verified"
+                            and words[2] == "using"
+                        ):

It is quite uncommon in Python to use parenthesis around conditions.

> +def update_mk_file(mk_file, old_version, new_version):
> +    tmpfd, tmpfpath = tempfile.mkstemp()
> +    updated = False
> +    with fdopen(tmpfd, "w") as new_file:
> +        with mk_file.open() as old_file:
> +            version_var = mk_file.stem.upper().replace("-", "_") + "_VERSION"
> +            for line in old_file.readlines():
> +                words = line.split()
> +                if (
> +                    len(words) != 0
> +                    and words[0] == version_var
> +                    and words[1] == "="
> +                    and words[2] == old_version
> +                ):
> +                    updated = True
> +                    new_file.write(line.replace(old_version, new_version))
> +                else:
> +                    new_file.write(line)

Same: use a regexp to modify the version.

Could you rework your script based on those suggestions?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
