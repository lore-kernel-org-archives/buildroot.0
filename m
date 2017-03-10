From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 10:29:46 +0100
Subject: [Buildroot] [PATCH 1/2] netsniff-ng: fix build with kernel
 headers v4.10+
In-Reply-To: <65617ee3af4d36e520b84b77e643007e5c20e790.1489134655.git.baruch@tkos.co.il>
References: <65617ee3af4d36e520b84b77e643007e5c20e790.1489134655.git.baruch@tkos.co.il>
Message-ID: <20170310102946.66f1e321@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Mar 2017 10:30:54 +0200, Baruch Siach wrote:
> Add upstream patch removing use of GENL_ID_GENERATE that was dropped in kernel
> version 4.10.
> 
> Fixes:
> http://autobuild.buildroot.net/results/58d/58d7809cae739f728c58291f2111684d6c0578f3/
> http://autobuild.buildroot.net/results/65c/65ce9807116ca70908e0aabae59a36c7774dfa7a/
> http://autobuild.buildroot.net/results/64b/64b3f8af2ebc5a14ecbef72039ef527b5d71f12c/
> 
> Cc: Joris Lijssens <joris.lijssens@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/netsniff-ng/0001-netsniff-ng-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch

Both applied to master, thanks!

Peter: do we want to fix a build issue related to 4.10 kernel headers
in the LTS version? The LTS version did not have explicit support for
4.10 kernel headers, so I'm not sure it's really worth the effort.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
