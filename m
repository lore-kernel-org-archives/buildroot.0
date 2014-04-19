From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 19:00:56 +0200
Subject: [Buildroot] [PATCH 1/1] apr: add missing comment about needed
 dynamic library support
In-Reply-To: <1397860214-30560-1-git-send-email-zinosat@tiscali.it>
References: <1397860214-30560-1-git-send-email-zinosat@tiscali.it>
Message-ID: <20140419190056.1bd35326@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Davide Viti,

On Sat, 19 Apr 2014 00:30:14 +0200, Davide Viti wrote:
> From: Davide Viti <d.viti@infosolution.it>
> 
> Signed-off-by: Davide Viti <d.viti@infosolution.it>
> ---
>  package/apr/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks, but I had to fix something:

> diff --git a/package/apr/Config.in b/package/apr/Config.in
> index e06d254..73a4482 100644
> --- a/package/apr/Config.in
> +++ b/package/apr/Config.in
> @@ -9,3 +9,7 @@ config BR2_PACKAGE_APR
>  	  consistent interface to underlying platform-specific implementations
>  
>  	  http://apr.apache.org/
> +
> +comment "apr needs a toolchain w/ dynamic library"
> +	depends on !BR2_USE_MMU

This should have been "depends on BR2_USE_MMU". The apr package is only
available on architectures having an MMU. So there's no point in
displaying the comment if we're on an MMU-less platform.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
