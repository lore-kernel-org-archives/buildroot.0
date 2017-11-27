From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 21:33:52 +0100
Subject: [Buildroot] [PATCH] google-breakpad: take into account host
 architecture dependencies
In-Reply-To: <20171126144019.11989-1-thomas.petazzoni@free-electrons.com>
References: <20171126144019.11989-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171127213352.1e342926@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Nov 2017 15:40:19 +0100, Thomas Petazzoni wrote:
> Building the target google-breakpad requires building the host variant
> of google-breakpad. Just like the target google-breakpad only supports
> a limited number of architectures, it is the same for the host
> google-breakpad.
> 
> We therefore introduce a
> BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS option that is used
> where necessary to prevent the user from choosing Google Breakpad when
> building on unsupported host platforms.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/c7c04483508f9e4d629efa54571afeb1feaa5f73/
>   (build on a powerpc64le machine)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in                              | 1 +
>  package/Config.in.host                 | 1 +
>  package/google-breakpad/Config.in      | 2 ++
>  package/google-breakpad/Config.in.host | 8 ++++++++
>  4 files changed, 12 insertions(+)
>  create mode 100644 package/google-breakpad/Config.in.host

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
