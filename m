From: Luca Ceresoli <lucaceresoli77@gmail.com>
Date: Tue, 7 Feb 2017 16:18:08 +0100
Subject: [Buildroot] [PATCH 1/4] support/scripts: add script to test a
 package
In-Reply-To: <d1a206971ebad3baa346e54205fb4f198d979aa7.1486475561.git.yann.morin.1998@free.fr>
References: <cover.1486475561.git.yann.morin.1998@free.fr>
 <d1a206971ebad3baa346e54205fb4f198d979aa7.1486475561.git.yann.morin.1998@free.fr>
Message-ID: <cefdf04c-ff06-5ee7-86ce-97fa36c09000@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/02/2017 14:52, Yann E. MORIN wrote:
> This script helps in testing that a pacakge builds fine on a wide range
> of architectures and toolchains: BE/LE, 32/64-bit, musl/glibc/uclibc...
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [yann.morin.1998 at free.fr:
>  - completely rewrite the script from Thomas, with help from Luca
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Just two very minor nits about wording. For the rest the diff from the
version I already reviewed is very limited anyway.

[...]

> +help() {
> +    cat <<_EOF_
> +test-pkg: test-build a package against various toolchains and architectures
> +
> +The supplied config snippet is appended to each toolchain config, the
> +resulting configuration is checked that it still contains all options

"is checked that it still contains" seems wrong to me.
I'd reword it as "is checked to ensure it still contains".

> +specified in the snippet; if any is missing, the build is skipped, on the
> +assumption that the package under test requires a toolchain or architecture
> +feature that is missing.
> +
> +The list of toolchains is retrieved from Buildroot autobuilders, available

from Buildroot autobuilders -> from the Buildroot autobuilders

With these fixed:
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
