From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 28 Oct 2011 11:41:49 +0200
Subject: [Buildroot] [PATCH] /etc/profile: read in /etc/profile.d/*.sh
	files
In-Reply-To: <2973c12cb594abeecc60.1318932277@devws108>
References: <2973c12cb594abeecc60.1318932277@devws108>
Message-ID: <CAAXf6LV=srEPTxjfSpMKtaU79RmhueRFRRwg+NXmQVgVD1ETug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 19, 2011 at 9:36 AM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> For custom projects, it is more maintainable to add custom profile settings in a
> separate file, than directly in /etc/profile.
>
> This patch modifies /etc/profile to read in *.sh files from /etc/profile.d/, a
> technique commonly used in Linux distributions.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> ?fs/skeleton/etc/profile | ?7 +++++++
> ?1 files changed, 7 insertions(+), 0 deletions(-)
>
> diff --git a/fs/skeleton/etc/profile b/fs/skeleton/etc/profile
> --- a/fs/skeleton/etc/profile
> +++ b/fs/skeleton/etc/profile
> @@ -46,3 +46,10 @@ if [ "$PS1" ]; then
> ? ? alias calc='calc -Cd '
> ? ? alias bc='calc -Cd '
> ?fi;
> +
> +# Source configuration files from /etc/profile.d
> +for i in /etc/profile.d/*.sh ; do
> + ? ?if [ -r "$i" ]; then
> + ? ? ? ?. $i
> + ? ?fi
> +done
>
>
>

bump
