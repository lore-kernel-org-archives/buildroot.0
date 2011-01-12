From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jan 2011 16:00:50 -0300
Subject: [Buildroot] [PATCH v3] udev: bump version to 164,
 add optional support for all extras, depend on host-gperf
In-Reply-To: <25c844f9547462b4cc5b7a27a80562c4df29ddc5.1293377040.git.smiley73@users.sourceforge.net>
References: <25c844f9547462b4cc5b7a27a80562c4df29ddc5.1293377040.git.smiley73@users.sourceforge.net>
Message-ID: <4D2DFA62.4070000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/26/10 12:24, heiko at zuerker.org wrote:

> From: Heiko Zuerker <smiley73@users.sourceforge.net>
> 
> 
> Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
> ---
>  package/udev/Config.in            |   39 ++---------
>  package/udev/libvolume_id.la.tmpl |   35 ----------
>  package/udev/udev.mk              |  132 +++---------------------------------
>  3 files changed, 18 insertions(+), 188 deletions(-)
>  delete mode 100644 package/udev/libvolume_id.la.tmpl

Did some quick testing and found a couple of things:

1) You're not installing the initscript.
Might be good that you do so, though it needs some work to get it
rolling for the new version.

2) uclibc-0.9.31 lacks some support for new features needed.
I've just submitted patches to the list to address this.
I don't know if we want to do this for uclibc-0.9.30 too.
0.9.32/snapshot doesn't need them.

Other than that it works, though i just tested without extras.
