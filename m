From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Dec 2013 06:40:42 -0600
Subject: [Buildroot] [PATCHv6 3/5] core: allow external
 Config.in/makefile	code to be integrated
In-Reply-To: <1386198891-17968-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386198891-17968-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386198891-17968-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <OF2CAE743B.4F4DD943-ON86257C38.00458E79-86257C38.0045A490@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 12/04/2013 
05:14:49 PM:

> This commit allows the BR2_EXTERNAL directory to contain Config.in and
> Makefile code, which gets integrated into the Buildroot build logic:
> 
>  - Buildroot automatically includes the $BR2_EXTERNAL/Config.in in the
>    top-level configuration menu.
> 
>  - Buildroot automatically includes the BR2_EXTERNAL/external.mk in
>    the build logic, so it can for example be used to include other .mk
>    files that define package recipes.
> 
> This is typically intended to be used to create target packages in the
> BR2_EXTERNAL directory, but can also be used for bootloaders, host
> packages, or other custom make logic.
> 
> We also add a dummy Config.in file in support/dummy-external/ to
> ensure that the source "$BR2_EXTERNAL/Config.in" line will point to an
> existing file even when BR2_EXTERNAL is not used by the user.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Config.in                          | 2 ++
>  Makefile                           | 2 ++
>  support/dummy-external/Config.in   | 0
>  support/dummy-external/external.mk | 0
>  4 files changed, 4 insertions(+)
>  create mode 100644 support/dummy-external/Config.in
>  create mode 100644 support/dummy-external/external.mk

Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
