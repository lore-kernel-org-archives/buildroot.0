From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:06:07 +0200
Subject: [Buildroot] [PATCH 1/2] libgtk3: build gtk-encode-symbolic-svg
 for host variant
In-Reply-To: <1461236443-16177-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461236443-16177-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160421220607.227a0aa9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Apr 2016 08:00:42 -0300, Gustavo Zacarias wrote:
> It's required to create the symbolic icons (RGBA/transparent) which some
> apps like to use, like connman-gtk.
> The added patch avoids the need for a full host-libgtk3 build which would
> require host-libepoxy, host-mesa3d and a ton other deps.
> And pull in host-librsvg so that we have the rsvg gdk-pixbuf loader
> (plugin), otherwise scalable (svg) icons will error when trying to be
> processed, like those provided by adwaita-icon-theme.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...k-dependency-from-gtk-encode-symbolic-svg.patch | 105 +++++++++++++++++++++
>  package/libgtk3/libgtk3.mk                         |  12 ++-
>  2 files changed, 115 insertions(+), 2 deletions(-)
>  create mode 100644 package/libgtk3/0004-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
