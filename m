From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:05:07 +0200
Subject: [Buildroot] [PATCHv2] package/systemd: fix build with old
 toolchains
In-Reply-To: <1472549377-22268-1-git-send-email-yann.morin.1998@free.fr>
References: <1472549377-22268-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160918160507.5268d167@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Aug 2016 11:29:37 +0200, Yann E. MORIN wrote:
> Toolchains using glibc-2.18 or older do not define O_TMPFILE, which
> causes build failures on some archs.
> 
> systemd has a definition for O_TMPFILE if it is missing, but only
> defines it for i386 or x86_64. Furthermore, the header defining it is
> not included everywhere O_TMPFILE is used.
> 
> Fix that with three patches backported from upstream:
>   - include the needed header where it is needed (he!),
>   - define O_TMPFILE for all archs, according to linux-4.8rc3,
>   - no longer guard against undefined O_TMPFILE in fileio.
> 
> Upstream merge commit:
>     https://github.com/systemd/systemd/commit/4a13100c6a5a0a4b793e90bd43d21c3696c42d46
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v1 -> v2:
>   - backport patches as upstreamed
> ---
>  ...-export-raw-needs-missing.h-for-O_TMPFILE.patch | 30 +++++++++++
>  ...h-add-missing-definitions-for-__O_TMPFILE.patch | 62 +++++++++++++++++++++
>  ...basic-fileio-we-always-have-O_TMPFILE-now.patch | 63 ++++++++++++++++++++++
>  3 files changed, 155 insertions(+)
>  create mode 100644 package/systemd/0004-importd-export-raw-needs-missing.h-for-O_TMPFILE.patch
>  create mode 100644 package/systemd/0005-missing.h-add-missing-definitions-for-__O_TMPFILE.patch
>  create mode 100644 package/systemd/0006-basic-fileio-we-always-have-O_TMPFILE-now.patch

I've applied, after adding the autobuild failure reference, and
re-adding your SoB lines from the patches (they were here in the
previous iteration).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
