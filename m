From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 15:57:26 +0200
Subject: [Buildroot] [PATCH v5] dtc: add host build
In-Reply-To: <1427140478-31535-1-git-send-email-ps.report@gmx.net>
References: <1427140478-31535-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150714155726.6beef843@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon, 23 Mar 2015 20:54:38 +0100, Peter Seiderer wrote:
> - add dtc host build support
> 
> - install linux kernel package provided dtc only in case package
>   host dtc is not selected (suggested by Matthew Weber (see [1])
>   to avoid double installation of host dtc).
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-January/117121.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> Changes v4 -> v5:
>   - added Reviewed-by/Tested-by
>   - squashed with 'linux: install dtc only in case package host dtc is not
>     selected' and fixed variable parenthesis (as suggested by Yann E. MORIN)
>     and reworded commit message

We still don't really understand the motivation for doing this package.
The kernel already has its own copy of dtc, which it builds when
needed. And your commit log does not explain *why* we would want a host
version of dtc as a package.

For now, we'll mark this patch as Rejected in patchwork. If you don't
agree, please resend an updated version with a much more descriptive
commit log which explains the use cases and motivation for having a
host dtc package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
