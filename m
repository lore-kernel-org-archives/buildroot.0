From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:12:33 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: fix build on old toolchains
 (sa_family_t)
In-Reply-To: <1420216745-24218-1-git-send-email-luca@lucaceresoli.net>
References: <1420216745-24218-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20150102191233.1bf32420@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Fri,  2 Jan 2015 17:39:04 +0100, Luca Ceresoli wrote:
> Fixes error such as:
>   .../sysroot/usr/include/linux/netlink.h:31:2: error: unknown type name 'sa_family_t'
>   .../sysroot/usr/include/linux/netlink.h:31:2: error: expected specifier-qualifier-list before 'sa_family_t'
> 
> And autobuild failures:
>   http://autobuild.buildroot.net/results/d92/d92e7f2af0e64bc40f7b5c9ea081471de98bf8e8/
>   http://autobuild.buildroot.net/results/e97/e97e980a2f1e0ff4138a6dc03d86ad3ff0973e4a/
>   http://autobuild.buildroot.net/results/ca3/ca32c4de8b645c96cedb80b6270a792e9601ad84/
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

But if it's actually the toolchain that is broken, should we instead
have a patch against the toolchain headers? There are other packages
that had similar problems with these toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
