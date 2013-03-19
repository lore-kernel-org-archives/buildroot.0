From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Mar 2013 20:56:55 +0100
Subject: [Buildroot] [PATCH v3] rework patch model
In-Reply-To: <1363598027-25900-1-git-send-email-spdawson@gmail.com>
References: <1363598027-25900-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130319205655.0e163354@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Mon, 18 Mar 2013 09:13:47 +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> At the Buildroot Developers Meeting (4-5 February 2013, in Brussels) a change
> to the patch logic was discussed. See 
> 
> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
> 
> for details. In summary:
> 
> * For patches stored in the package directory, if
>   package/<pkg>/<version>/ does exist, apply package/<pkg>/<version>/*.patch,
>   otherwise, apply package/<pkg>/*.patch
> * For patches stored in the global patches directory, if
>   $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply
>   $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply
>   $(GLOBAL_PATCH_DIR)/<pkg>/*.patch
> 
> This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
> the generic package infrastructure to implement the new patch logic.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

One minor nit below, but doesn't prevent from committing the patch IMO.
Peter can probably fix that up when committing.

> +It is sometimes useful to apply 'extra' patches to packages - over and
> +above those provided in Buildroot. This might be used to support custom
> +features in a project, for example, or when working on a new architecture.
> +
> +The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
> +used to specify a directory containing global package patches.
> +
> +For a specific version <packageversion> of a specific package <packagename>,
> +patches are applied as follows.
> +
> +First, the default Buildroot patch set for the package is applied.
> +
> +If the directory $(BR2_GLOBAL_PATCH_DIR)/<packagename>/<packageversion>

Should be +$(BR2_GLOBAL_PATCH_DIR)/<packagename>/<packageversion>+

> +exists, then all *.patch files in the directory will be applied.

Should be +*.patch+.

So really, it's nitpicking :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
