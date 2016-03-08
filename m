From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2016 00:01:14 +0100
Subject: [Buildroot] [PATCH] hostapd: fix musl issues
In-Reply-To: <1457473254-30014-1-git-send-email-joerg.krause@embedded.rocks>
References: <1457473254-30014-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160309000114.778d95e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue,  8 Mar 2016 22:40:54 +0100, J?rg Krause wrote:
> Add two patches to fix build issues with the musl libc.
> 
> The first patch "0003-vlan-fix-musl-build-error" fixes the undefined __caddr_t
> build error. __caddr_t is a legacy BSD type and should be avoided in modern
> implementations.
> 
> The second patch "0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header"
> fixes a typical musl libc header conflict with the Linux kernel header. We avoid
> including the conflicting Linux header file by defining the needed macros
> directly in the needing hostapd source file.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c26/c265cfada20621a631e9d118b9633df80b0e4864/
> http://autobuild.buildroot.net/results/658/658c5e2fe6e3a4ad74ca47c926426e95eac0b9ec/
> http://autobuild.buildroot.net/results/578/5787805b3e1487c4f85c3a367ed88e8730078b8e/
> http://autobuild.buildroot.net/results/42d/42d8be008dcb07e9ec26ce10c797deb43ed86568/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../hostapd/0003-vlan-fix-musl-build-error.patch   | 60 ++++++++++++++++++++++
>  ...sl-libc-conflict-with-Linux-kernel-header.patch | 60 ++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
>  create mode 100644 package/hostapd/0003-vlan-fix-musl-build-error.patch
>  create mode 100644 package/hostapd/0004-vlan-fix-musl-libc-conflict-with-Linux-kernel-header.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
