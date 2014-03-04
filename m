From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:38:43 +0100
Subject: [Buildroot] [PATCH] libnftnl: exclude for CS PPC toolchains
In-Reply-To: <1393898330-20409-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393898330-20409-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140304193843.0f42ccd0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon,  3 Mar 2014 22:58:50 -0300, Gustavo Zacarias wrote:
> The CS PPC 2011.3 and 2010.9 toolchains have a bad linux/socket.h header
> that doesn't define sa_family_t which is used by linux/netlink.h (and
> libnftnl).
> Patching external toolchain headers wouldn't be too nice and they seem
> to be the only CS toolchains affected.
> It's definitely NOT a kernel header version issue, the toolchain is
> based on 2.6.38 headers and vanilla 2.6.38 has the proper definitions in
> place. Fixes:
> http://autobuild.buildroot.net/results/1e2/1e2cac84f0faa9b8915a628260ef41765d86e174/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libnftnl/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Not nice to have conditions on specific toolchains, but since the
breakage is specific to them, I guess we don't have much choice.

Thanks, patch applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
