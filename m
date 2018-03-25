From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 22:44:07 +0200
Subject: [Buildroot] [PATCH v3 3/3] setools: update to add sedta and
 seinfoflow
In-Reply-To: <1521578383-56128-3-git-send-email-jared.bents@rockwellcollins.com>
References: <1521578383-56128-1-git-send-email-jared.bents@rockwellcollins.com>
 <1521578383-56128-3-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <20180325224407.75fe7c26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Mar 2018 15:39:43 -0500, Jared Bents wrote:

> diff --git a/package/setools/Config.in b/package/setools/Config.in
> index ae0c45f..32a9315 100644
> --- a/package/setools/Config.in
> +++ b/package/setools/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_SETOOLS
>  	depends on BR2_USE_MMU
>  	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
>  	select BR2_PACKAGE_PYTHON_ENUM34 if !BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_NETWORKX

I've added a # runtime comment here to explain that this is only a
runtime dependency, and applied to master.

However, I'm wondering if it wouldn't have made sense to add a
sub-option for this. We generally try to avoid having too many
dependencies in Buildroot packages, and this commit adds a new
dependency that isn't strictly necessary, as long as you don't need
those two tools. I'm not saying we /must/ add such a sub-option, I'm
just asking.

I've applied nonetheless, because this can be improved later on if
needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
