From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 23:03:03 +0200
Subject: [Buildroot] [PATCH 2 of 6 v2] manual: add documentation for
 kconfig-package
In-Reply-To: <7e76c27202ece126eb36.1406750283@localhost>
References: <patchbomb.1406750281@localhost>
 <7e76c27202ece126eb36.1406750283@localhost>
Message-ID: <20140731210303.GK3960@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-30 21:58 +0200, Thomas De Schampheleire spake thusly:
> This patch adds documentation for the new kconfig-package infrastructure to
> the manual.
> 
> Note that due to the simplicity of the infrastructure, the documentation
> is not split in a 'tutorial' and a 'reference', like for the other
> infrastructures. Instead, the usage is described in one section.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> v2: update after move to a real infrastructure
> 
>  docs/manual/adding-packages-kconfig.txt |  56 +++++++++++++++++++++++++++++
>  docs/manual/adding-packages.txt         |   2 +
>  2 files changed, 58 insertions(+), 0 deletions(-)
> 
> diff -r 83a2e5f2641a -r 7e76c27202ec docs/manual/adding-packages-kconfig.txt
> --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
> +++ b/docs/manual/adding-packages-kconfig.txt	Thu Jul 24 20:54:50 2014 +0200
> @@ -0,0 +1,56 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +=== Infrastructure for packages using kconfig for configuration files
> +
> +A popular way for a software package to handle user-specified
> +configuration is +kconfig+. Among others, it is used by the Linux
> +kernel, Busybox, and Buildroot itself. The presence of a .config file
> +and a +menuconfig+ target are two well-known symptoms of kconfig being
> +used.
> +
> +Buildroot features an infrastructure for packages that use kconfig for
> +configuration. This infrastructure provides the necessary make logic to

... for their configuration ...
... the necessary logic...

> +expose the package +menuconfig+ target as +foo-menuconfig+ in Buildroot,

... the package's +menuconfig+ ...

> +and to handle the copying and copy-back of the configuration file in a

... the copying back and forth of ...

> +correct way.
> +
> +The +kconfig-package+ infrastructure is based on the +generic-package+
> +infrastructure. All variables supported by +generic-package+ are
> +available in +kconfig-package+ as well. See
> +xref:generic-package-reference[] for more details.
> +
> +In order to use the +kconfig-package+ infrastructure for a Buildroot
> +package, the minimally required lines in the .mk file in addition to

... in the +.mk+ file, in addition to ...

> +the variables required by the +generic-package+ infrastructure, are:
> +
> +------------------------------
> +FOO_KCONFIG_FILE = reference-to-source-configuration-file
> +
> +$(eval $(kconfig-package))
> +------------------------------
> +
> +This snippet will create following make targets:

The snippet creates the following ...

> +* +foo-menuconfig+, which calls the package's +menuconfig+ target
> +
> +* +foo-update-config+, which copies back the configuration to the source
> +  configuration file.
> +
> +and will ensure that the source configuration file is copied to the build

... and ensures that ...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
