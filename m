From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:54:08 +0100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <20180106152833.10111-1-yann.morin.1998@free.fr>
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
Message-ID: <20180112225408.4a91ca0b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Jan 2018 16:28:33 +0100, Yann E. MORIN wrote:
> Currently, our jobs on the gitlab-ci infra are running as root, which is
> problematic for two reasons:
> 
>   - this is not the usual way Buildroot is built;
>   - it may miss issues where running as non-root is problematic.
> 
> So, complement our Dockerfile with directives to add a new user and run
> everything as that user, as demonstrated by this build job:
>     https://gitlab.com/ymorin/buildroot-ci/-/jobs/46929562
> 
> Additional, enforce an UTF-8 locale while running.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/docker/Dockerfile | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks. Could you update the official Buildroot
Docker image, so that the Gitlab CI testing benefits from this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
