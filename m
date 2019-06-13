From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Jun 2019 13:26:47 +0200
Subject: [Buildroot] [PATCH 1/2] lmbench: mark scripts/build as bash
 script
In-Reply-To: <20190612233934.14805-2-mmayer@broadcom.com>
References: <20190612233934.14805-1-mmayer@broadcom.com>
 <20190612233934.14805-2-mmayer@broadcom.com>
Message-ID: <20190613132647.61a5571b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jun 2019 16:39:33 -0700
Markus Mayer <mmayer@broadcom.com> wrote:

> While bash supports the "+=" operator for environment variables,
> /bin/sh does not. scripts/build is making use of "+=" but declares
> itself to be a /bin/sh script. This leads to errors of the form
>     ../scripts/build: 21: ../scripts/build: LDLIBS+= -lm: not found
> and doesn't change the contents of LDLIBS as was the intention.
> 
> Therefore, we change the interpreter to /bin/bash, which makes things
> work as intended.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/lmbench/0001-build_use_bash.patch | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 package/lmbench/0001-build_use_bash.patch
> 
> diff --git a/package/lmbench/0001-build_use_bash.patch b/package/lmbench/0001-build_use_bash.patch
> new file mode 100644
> index 000000000000..c68ed2ef7ac4
> --- /dev/null
> +++ b/package/lmbench/0001-build_use_bash.patch

We need all patches to have a description + Signed-off-by line.
Ideally, they should be generated using git format-patch, but since
there is apparently no upstream git repo for lmbench, that is not a
requirement.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
