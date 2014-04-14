From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 20:54:12 +0200
Subject: [Buildroot] [PATCH] vlc: select libvorbis when opus is also
 selected
In-Reply-To: <1397485207-63709-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1397485207-63709-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20140414205412.2e344a73@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 14 Apr 2014 15:20:07 +0100, Vicente Olivert Riera wrote:
> If BR2_PACKAGE_OPUS is selected then vlc will be built with support for
> opus passing "--enable-opus" option to the configure script. But when
> the configure script checks for the opus library it also checks for the
> ogg library at the same time, so if only opus has been installed and not
> ogg, then it will fail with an error message like this one:
> 
> checking for OPUS... no
> configure: error: Library ogg opus needed for opus was not found
> 
> Fixes:
>    http://autobuild.buildroot.net/results/4da/4da8e7cfb35c351e5d623835118512248d331d16/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/vlc/Config.in |    1 +
>  package/vlc/vlc.mk    |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
