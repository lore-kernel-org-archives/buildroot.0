From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 18 Oct 2019 11:55:58 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/libopenssl: set no-asm with generic architectures
In-Reply-To: <20191017165559.9662-1-fontaine.fabrice@gmail.com>
References: <20191017165559.9662-1-fontaine.fabrice@gmail.com>
Message-ID: <20191018115558.37438b41@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 17 Oct 2019 18:55:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +# no-asm is needed with generic architectures such as linux-generic32, see
> +# https://github.com/openssl/openssl/issues/9839
> +LIBOPENSSL_TARGET_ARCH = gcc no-asm
> +LIBOPENSSL_TARGET_ARCH = linux-generic32 no-asm

You assign two times the same variable ? Seems like the first
assignment here is a bit useless, no ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
