From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:58:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/go-bootstrap: bump version to
 1.4.3
In-Reply-To: <20161016095854.3646-1-bernd.kuhls@t-online.de>
References: <20161016095854.3646-1-bernd.kuhls@t-online.de>
Message-ID: <20161016125812.6778ae41@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Oct 2016 11:58:54 +0200, Bernd Kuhls wrote:
> This bump includes
> https://go.googlesource.com/go/+/a527bdbda39c48fa772d8d54eb6b849f240442c1
> 
> which fixes a gcc6-related compile error
> 
> cmd/6c
> /home/buildroot/br2/output/build/host-go-bootstrap-1.4.2/src/cmd/6c/txt.c: In function 'gmove':
> /home/buildroot/br2/output/build/host-go-bootstrap-1.4.2/src/cmd/6c/txt.c:995:28: error: left shift of negative value [-Werror=shift-negative-value]
>      f->vconst |= (vlong)~0 << 32;
>                             ^~
> /home/buildroot/br2/output/build/host-go-bootstrap-1.4.2/src/cmd/6c/txt.c:1045:28: error: left shift of negative value [-Werror=shift-negative-value]
>      f->vconst |= (vlong)~0 << 32;
>                             ^~
> cc1: all warnings being treated as errors
> 
> not yet caught by autobuilders using this defconfig:
> 
> http://autobuild.buildroot.net/results/394/394e22be0ef986463e97b3040dad8f978262732c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/go-bootstrap/go-bootstrap.hash | 2 +-
>  package/go-bootstrap/go-bootstrap.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
