From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 12:27:59 +0100
Subject: [Buildroot] [PATCH] package/xenomai: bfin remove inline keyword
In-Reply-To: <1479252138-15368-1-git-send-email-romain.naour@gmail.com>
References: <1479252138-15368-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161116122759.65c5f1c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Nov 2016 00:22:18 +0100, Romain Naour wrote:
> Xenomai user space tools fail to build for bfin target since it's
> provide it's own pthread_atfork(), shm_open() and shm_unlink()
> definition using the inline keyword and weak attribute.
> 
> With gcc 5+ the weak attribute is discarded by the inline keyword,
> so each symbol are global and are redefined several time while
> linking.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0c2/0c2e5eb4edd4f9427f61d3c9b67a12a7a0e24140
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../xenomai/0001-bfin-remove-inline-keyword.patch  | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/xenomai/0001-bfin-remove-inline-keyword.patch

I've added a reference to the upstream commit in the patch description
(would have been nice if you had added it yourself), and applied to
master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
