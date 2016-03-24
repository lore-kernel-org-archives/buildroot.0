From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:51:28 +0100
Subject: [Buildroot] [PATCH] gdk-pixbuf: create loader cache at build
 time
In-Reply-To: <1458767869-14680-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458767869-14680-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160324225128.1c7531df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Mar 2016 18:17:49 -0300, Gustavo Zacarias wrote:
> Create the gdk pixbuf loaders cache file at build time rather than run
> time, since the root filesytem can be read-only.
> We also didn't cater for systemd-based systems, so this solves two
> issues at once.
> 
> The only side-effect is that we must now pull host-gdk-pixbuf into
> target gdk-pixbuf dependencies, but generally users will have gdk-pixbuf
> selected if they use libgtk2/3 which already pull in host-gdk-pixbuf.
> 
> And remove initscript correspondingly.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gdk-pixbuf/S26gdk-pixbuf | 19 -------------------
>  package/gdk-pixbuf/gdk-pixbuf.mk | 22 +++++++++++++++-------
>  2 files changed, 15 insertions(+), 26 deletions(-)
>  delete mode 100644 package/gdk-pixbuf/S26gdk-pixbuf

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
