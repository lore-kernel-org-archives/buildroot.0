From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Mon, 22 Jan 2018 12:35:44 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] iputils: fix ping and
 traceroute6 executable permissions
In-Reply-To: <20180121210851.59E7983DF0@busybox.osuosl.org>
References: <20180121210851.59E7983DF0@busybox.osuosl.org>
Message-ID: <CABhNV22x8R=FGaKDLTThfvF1GDHv8ZZFNPHiHjUtNvZB6W17bA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This is nice to have.
But what about clockdiff?

In my tests it did not work on buildroot, but it is not suid root in
Ubuntu, and it works without root there.
I'm not sure if anyone uses that program at all - I certainly have not.

regards,
Eianr J?n

On 21 January 2018 at 21:17, Peter Korsgaard <peter@korsgaard.com> wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=371d7e8495a46d800c4c7322c5c1d09612ed181c
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x
>
> The iputils executables are installed without the setuid bit set,
> which prevents some programs from working.
>
> This patch adds a permission table to fix the permissions of the ping
> and traceroute6 executables.
>
> Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> (cherry picked from commit b0e2d00289eeb1a7201ba49e5cedfd3175f92140)
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/iputils/iputils.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index b20cd12..13e3389 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -69,4 +69,9 @@ define IPUTILS_INSTALL_TARGET_CMDS
>         $(INSTALL) -D -m 755 $(@D)/traceroute6 $(TARGET_DIR)/bin/traceroute6
>  endef
>
> +define IPUTILS_PERMISSIONS
> +       /bin/ping        f 4755 0 0 - - - - -
> +       /bin/traceroute6 f 4755 0 0 - - - - -
> +endef
> +
>  $(eval $(generic-package))
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
