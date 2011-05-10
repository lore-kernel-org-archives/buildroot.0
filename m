From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2011 08:53:35 +0200
Subject: [Buildroot] [PATCH 3/3] Makefile.package.in: Fixing git
 download method
In-Reply-To: <1305008226-8906-4-git-send-email-a@awn.dk>
References: <1305008226-8906-1-git-send-email-a@awn.dk>
	<1305008226-8906-4-git-send-email-a@awn.dk>
Message-ID: <20110510085335.5c9be308@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2011 08:17:06 +0200
"Allan W. Nielsen" <a@awn.dk> wrote:

> Signed-off-by: Allan W. Nielsen <a@awn.dk>
> ---
>  package/Makefile.package.in |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> index 1e87256..6038a09 100644
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -109,7 +109,7 @@ define DOWNLOAD_GIT
>  	$(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
>  	pushd $($(PKG)_BASE_NAME) > /dev/null && \
>  	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
> -		gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
> +		gzip -c > ../$($(PKG)_SOURCE) && \

Could you provide a few details on how it "fixes" the Git download
method ? Actually, the existing implementation seems to do the right
thing: it stores the tarball into the $(DL_DIR) directory, which is
what we want. What problem did you encounter, and how does the ../
thing fixes it ?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
