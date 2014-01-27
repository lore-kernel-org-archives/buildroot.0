From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 22:48:46 +0100
Subject: [Buildroot] [PATCH 1/2] packages infra: add function to get a
 Kconfig option
In-Reply-To: <b68b4ce8c5017701344c6f32a993de7d3e26802b.1390744549.git.yann.morin.1998@free.fr>
References: <cover.1390744549.git.yann.morin.1998@free.fr>
 <b68b4ce8c5017701344c6f32a993de7d3e26802b.1390744549.git.yann.morin.1998@free.fr>
Message-ID: <52E6D43E.306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/01/14 14:56, Yann E. MORIN wrote:
> +# Note: we do not indent this, since we want to avoid any leading
> +# space or tabs when calling this function
> +define KCONFIG_GET_OPT
> +$(shell sed -e "/\\<$(1)\\>=\\(.*\\)$$/!d; s//\\1/" $(2))
> +endef

  There's no need to define this with 'define', you can do with a normal 
assignment, like we do for the UPPERCASE macro.

KCONFIG_GET_OPT = $(shell sed -e ...)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
