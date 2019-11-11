From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Nov 2019 16:29:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: hybrid cgroupfs
 hierarchy for docker compatibility
In-Reply-To: <20191111083348.3964650-1-christian@paral.in>
References: <20191111083348.3964650-1-christian@paral.in>
Message-ID: <20191111162944.5529d1b2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Nov 2019 00:33:48 -0800
Christian Stewart <christian@paral.in> wrote:

> Docker fails to start with "Devices cgroup isn't mounted" as of systemd 243.
> According to the systemd documentation:
> 
>   systemd now defaults to the "unified" cgroup hierarchy setup during
>   build-time, i.e. -Ddefault-hierarchy=unified is now the build-time default.
>   Previously, -Ddefault-hierarchy=hybrid was the default. [...] Downstream
>   production distributions might want to continue to use
>   -Ddefault-hierarchy=hybrid (or even =legacy) for their builds as unfortunately
>   the popular container managers have not caught up with the kernel API changes.
> 
> Changing this option to "hybrid" or "legacy" fixes the Docker startup.
> 
> Reference: https://github.com/opencontainers/runc/issues/654
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/systemd/systemd.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. It would be nice to have some runtime tests
around Docker, to verify that it is still working properly at runtime,
so that we can catch this kind of issues.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
