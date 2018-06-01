From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jun 2018 15:03:53 +0200
Subject: [Buildroot] [PATCH proposal/next 1/2] package/busybox: add host
 variant
In-Reply-To: <20180601125900.26400-2-chemobejk@gmail.com>
References: <c55c7a49-77e9-f174-5c90-c8baa950d7da@mind.be>
 <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601125900.26400-2-chemobejk@gmail.com>
Message-ID: <20180601150353.23e236a2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jun 2018 15:58:59 +0300, Stefan Becker wrote:
> Build stripped down version of busybox for the build host to provide
> "mkpasswd" for the build.
> 
> This is a replacement for host-mkpasswd.
> 
> Signed-off-by: Stefan Becker <chemobejk@gmail.com>
> ---
>  fs/common.mk                                  |  2 +-
>  package/Config.in.host                        |  2 +-
>  package/busybox/Config.in.host                |  2 ++
>  package/busybox/busybox.mk                    | 28 +++++++++++++++++++
>  .../skeleton-init-common.mk                   |  2 +-
>  5 files changed, 33 insertions(+), 3 deletions(-)

The addition of host-busybox should be split in a separate patch from
the patch changing to use host-busybox instead of host-mkpasswd.

Also, the commit log should explain the rationale for switching from
host-mkpasswd to host-busybox. I know it has been discussed on the
list, but a commit log is much easier to find in the Git history than
an e-mail discussion on the mailing list. So a summary of the
motivations for the change would be nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
