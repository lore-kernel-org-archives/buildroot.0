From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 14:37:49 +0100
Subject: [Buildroot] [PATCH] tpm-tools: fix build failures caused by
	-Werror
In-Reply-To: <1451309456-27538-1-git-send-email-nrubinstein@aldebaran.com>
References: <1451309456-27538-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20151228143749.61f69d04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No?,

On Mon, 28 Dec 2015 14:30:56 +0100, No? Rubinstein wrote:
> Change-Id: I1797d19039938e750c92bb89d05b2f05c10668ad

We don't need a Change-Id. We need a Signed-off-by line as well as a
reference to the autobuilder failure that you are fixing. And also a
short explanation on how you're fixing the failure (backport an
upstream patch, etc.).


> diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
> index 20df489..9e4d66a 100644
> --- a/package/tpm-tools/tpm-tools.mk
> +++ b/package/tpm-tools/tpm-tools.mk
> @@ -11,6 +11,7 @@ TPM_TOOLS_STRIP_COMPONENTS = 2
>  TPM_TOOLS_LICENSE = Common Public License Version 1.0
>  TPM_TOOLS_LICENSE_FILES = LICENSE
>  TPM_TOOLS_DEPENDENCIES = trousers openssl
> +TPM_TOOLS_AUTORECONF = yes

Please add a comment:

# We're patching configure.in

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
