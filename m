From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:32:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tools: security bump to
 version 4.3.2
In-Reply-To: <20210621202218.706458-1-fontaine.fabrice@gmail.com>
References: <20210621202218.706458-1-fontaine.fabrice@gmail.com>
Message-ID: <20210703223250.1c0c1239@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Jun 2021 22:22:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Fix CVE-2021-3565: A flaw was found in tpm2-tools in versions before
>   5.1.1 and before 4.3.2. tpm2_import used a fixed AES key for the inner
>   wrapper, potentially allowing a MITM attacker to unwrap the inner
>   portion and reveal the key being imported. The highest threat from
>   this vulnerability is to data confidentiality.
> - LICENSE moved in doc directory since
>   https://github.com/tpm2-software/tpm2-tools/commit/23aa5dca660f596b2ad89542d5100bd4ef0c871a
>   and hash updated due to the following line added with
>   https://github.com/tpm2-software/tpm2-tools/commit/305011b2a7d091740fa01dbfbd27a48a76f670f7
>   Copyright 2019      Fraunhofer SIT sponsored by Infineon Technologies AG
> - libuuid and wchar (for mbstate_t) are mandatory since version 4.2 and
>   https://github.com/tpm2-software/tpm2-tools/commit/eca77c1419617a8e2d6d8008bac716878b0c27ca
> 
> https://github.com/tpm2-software/tpm2-tools/blob/4.3.2/doc/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/tpm2-tools/Config.in       | 7 +++++--
>  package/tpm2-tools/tpm2-tools.hash | 4 ++--
>  package/tpm2-tools/tpm2-tools.mk   | 6 +++---
>  3 files changed, 10 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
