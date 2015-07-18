From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 11:16:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: disable for PowerPC
 CS toolchains
In-Reply-To: <1437086706-20437-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437086706-20437-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150718111610.55f5a57b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Fri, 17 Jul 2015 00:45:06 +0200, J?rg Krause wrote:
> Those toolchains use gcc <= 4.5, which is too old as they are missing to
> construct an empty std::shared_ptr with a nullptr (0) as an argument. This
> is only introduced with gcc-4.6.
> 
> Fixes:
> http://autobuild.buildroot.net/results/faf/faf1b071c0a5bd8395d79abf2e6a32169ad7f136
> http://autobuild.buildroot.net/results/247/247b3f1ac3d3a9712e9410eef298fce8d885f92c
> http://autobuild.buildroot.net/results/de6/de601c4d4dd7922895892d78d3a37902fb98c7be
> http://autobuild.buildroot.net/results/a4d/a4d7bf9863c134f59d285616b9c1f78201bd1a3e
> 
> and many more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/upmpdcli/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

I've applied since it's the way we have been handling this so far.
However, during the hackaton, we discussed this a little bit, and we
believe we probably need to add some hidden Config.in options like
"BR2_PACKAGE_GCC_AT_LEAST_4_5", "BR2_PACKAGE_GCC_AT_LEAST_4_8", so that
packages can depend on these options more easily.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
