From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 22:28:56 +0200
Subject: [Buildroot] [PATCH 5/8 RFC] docs/manual: documents the
 golang-package infrastructure
In-Reply-To: <1454369465-4804-6-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
 <1454369465-4804-6-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <20160601222856.73ec3be2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  2 Feb 2016 00:31:02 +0100, Ludovic Guegan wrote:
> +01: ################################################################################
> +02: #
> +03: # foo-bar
> +04: #
> +05: ################################################################################
> +06:
> +07: FOO_LICENSE = MIT
> +08: FOO_VERSION = release_1.0
> +09: FOO_SITE = $(call github,foo,bar,$(FOO_VERSION))
> +10: FOO_EXTRACT_DIR = $(@D)/src/github.com/foo/bar

Shouldn't this be just where the symlink should be created in the Go
workspace ?

FOO_WORKSPACE_LOCATION or something like that?

> +11:
> +12: FOO_DEPS += $(call fetch-golang-package, github.com/other/package, \
> +13: 		1f22c0103821b9390939b6776727195525381532)

As said in my review of patch 4/8, it is not good when one package
fetches another. github.com/other/package should be another package.

> +14:
> +16: FOO_BUILD_PACKAGES = github.com/foo/bar/cmd/foo

Couldn't this be expressed in terms of FOO_WORKSPACE_LOCATION, like:

FOO_BUILD_PACKAGES = $(FOO_WORKSPACE_LOCATION)/cmd/foo

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
