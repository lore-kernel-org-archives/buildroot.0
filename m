From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 22:33:43 +0200
Subject: [Buildroot] [git commit] infra: indent the Config.in source-ing of
	packages
Message-ID: <20140611204044.939BC9CFC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef41e597927fa049b02cae877a2fbaca248349e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes sure that a patch adding a package shows in which menu the
package is added.

Before this commit, the patch has something like this:
> diff --git a/package/Config.in b/package/Config.in
> index 7800f23..433312e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -864,6 +864,7 @@ source "package/googlefontdirectory/Config.in"
>  source "package/haveged/Config.in"
>  source "package/mcrypt/Config.in"
>  source "package/mobile-broadband-provider-info/Config.in"
> +source "package/mypackage/Config.in"
>  source "package/shared-mime-info/Config.in"
>  source "package/snowball-init/Config.in"
>  source "package/sound-theme-borealis/Config.in"

[> added to avoid git-am recognizing this as the patch]

After this commit, the function marker shows in which menu the new
package was added:
> diff --git a/package/Config.in b/package/Config.in
> index b1111c8..7e6e1a4 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -864,6 +864,7 @@ menu "Miscellaneous"
>  	source "package/haveged/Config.in"
>  	source "package/mcrypt/Config.in"
>  	source "package/mobile-broadband-provider-info/Config.in"
> +	source "package/mypackage/Config.in"
>  	source "package/shared-mime-info/Config.in"
>  	source "package/snowball-init/Config.in"
>  	source "package/sound-theme-borealis/Config.in"

To keep things consistent, this is done for Config.in.host there, even
though we don't have sub-menus there at the moment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in      | 1876 ++++++++++++++++++++++++------------------------
 package/Config.in.host |   36 +-
 2 files changed, 956 insertions(+), 956 deletions(-)

Patch is too large, so refusing to show it
