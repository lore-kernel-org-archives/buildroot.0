From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:19:32 +0100
Subject: [Buildroot] [PATCH 1/2] package/linux-tools: add support for
 installing init system files
In-Reply-To: <4637e6aca8a761c9d863c58635cd691f274a9432.1578081397.git.yann.morin.1998@free.fr>
References: <cover.1578081397.git.yann.morin.1998@free.fr>
 <4637e6aca8a761c9d863c58635cd691f274a9432.1578081397.git.yann.morin.1998@free.fr>
Message-ID: <20200104161932.4a2d82e4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jan 2020 20:57:04 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> From: Pascal de Bruijn <p.debruijn@unilogic.nl>
> 
> Some linux tools (e.g. the Microsoft HyperV convenience utilities) will
> install programs tostart at boot time, so they need to be able to
> install init files (systemd units, sysv init script, or openrc units).
> 
> Unlike the other commands, we are redefining the real _INSTALL_INIT_*
> macros, rather than use hooks, to let the infra call those at the right
> moment.
> 
> We must be careful about the openrc support, though: if two tools are
> enabled, one which provides sysv scripts but no openrc config, and the
> other which provides openrc config, and we are using openrc as init
> system, then we want to use the sysv scripts from the former as well as
> the openrc config of the latter. Thus we need to duplicate a bit the
> openrc logic here.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> [yann.morin.1998 at free.fr:
>   - define macros, not hooks
>   - introduce support for openrc too
>   - expand commit log
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/linux-tools/linux-tools.mk | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
