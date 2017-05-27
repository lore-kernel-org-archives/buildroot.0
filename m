From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:14:56 +0200
Subject: [Buildroot] [PATCH 1/1] keepalived: Allow the package to be
 selected only if linux-headers >= 3.4
In-Reply-To: <1495889267-7358-1-git-send-email-apalos@gmail.com>
References: <1495889267-7358-1-git-send-email-apalos@gmail.com>
Message-ID: <20170527171456.08fa6d4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 15:47:47 +0300, Ilias Apalodimas wrote:
> Hello everyone,
> 
> This patch fixes build issues of keepalived reported here:
> http://autobuild.buildroot.net/results/770d8fd2f3bacbdbe233da1b4d6e64e20a84d5a5
> http://autobuild.buildroot.net/results/1adb710b915427f681eae37452a0942833ce533e
> http://autobuild.buildroot.net/results/70b31547e51ec7213372d2ef07bec34c5df77560
> 
> These builds are all using an external toolchain and linux-3.2 headers.
> Keepalived includes linux_ip_set.h when ipset package is enabled,
> which conflicts with linux xt_set.h header(prior to 3.4).
> 
> As Yann Morin suggested we are making keepalived depending on the kernel-headers
> version.
> 
> Regards
> Ilias
> 
> Signed-off-by: Ilias Apalodimas <apalos@gmail.com>
> ---
>  package/keepalived/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied to master, after fixing the commit log and Config.in comment as
suggested by Yann. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
