From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:02:51 +0200
Subject: [Buildroot] [PATCH 3/4] package/libgtk3: needs
 OpenGL-EGL/wayland
In-Reply-To: <79d8684056813c9a4db9baf746b6772e5c604724.1471968455.git.yann.morin.1998@free.fr>
References: <cover.1471968455.git.yann.morin.1998@free.fr>
 <79d8684056813c9a4db9baf746b6772e5c604724.1471968455.git.yann.morin.1998@free.fr>
Message-ID: <20160823220251.0c60f6f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 18:26:34 +0200, Yann E. MORIN wrote:
> Currently, libgtk3 depends on either a full OpenGL stack, or on a
> OpenGL-EGL stack provided by mesa3d.
> 
> This is because, when using the wayland backend, libgtk3 needs an
> OpenGL-EGL stack tht provides the wayland extensions. So far, only
> mesa3d would provide those extensions.
> 
> But now, those extensions are trickling down to other implementations,
> like the Nvidia driver or other (even non-public) implementations.
> 
> Change the condition to be on the recently introduced libegl-wayland
> option.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libgtk3/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
