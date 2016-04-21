From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:18:44 +0200
Subject: [Buildroot] [PATCH] package/opencv: define modules
 inter-dependencies
In-Reply-To: <1461102541-5987-2-git-send-email-s.martin49@gmail.com>
References: <1461102541-5987-1-git-send-email-s.martin49@gmail.com>
 <1461102541-5987-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20160421221844.128ad3c6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 23:49:01 +0200, Samuel Martin wrote:
> OpenCV allows to enable/disable the selection of modules (a.k.a.
> opencv libraries). These modules depend one on the others; these
> dependencies are already handled by the build-system (CMake).
> 
> However, the way we handled them in Buildroot was not really clean.
> For each opencv module, there is a kconfig option, but we forced the
> corresponding CMake config option without checking for the modules'
> dependencies.
> For further details about the issues this situation was causing, refer
> to this discussion [1].
> 
> This patch replicates the modules' dependency relations in the
> Config.in, so that the selection of the user will actually be built.
> This changes completes this work [2].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-April/159017.html
> [2] https://git.buildroot.org/buildroot/commit/?id=3bd5025038a9ecfb2c19a2450a68ae3b0888b440
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> ---
> This patch is an updated revival of http://patchwork.ozlabs.org/patch/488533/
> ---
>  package/opencv/Config.in | 42 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
