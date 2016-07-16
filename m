From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 15:57:27 +0200
Subject: [Buildroot] [PATCH 2/4] libcap-ng: Allow host compilation.
In-Reply-To: <1468518424-11785-2-git-send-email-Aduskett@gmail.com>
References: <1468518424-11785-1-git-send-email-Aduskett@gmail.com>
 <1468518424-11785-2-git-send-email-Aduskett@gmail.com>
Message-ID: <20160716155727.04d3fe81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 13:47:02 -0400, Adam Duskett wrote:
> Audit may require libcap-ng as  a dependency, this allows
> libcap-ng to compile as a host package.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libcap-ng/libcap-ng.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Following my comments on PATCH 1/4, not sure if this patch is still
needed. If it is still needed, then this patch must appear *before* it
is used.

Imagine I apply only PATCH 1/4, but not PATCH 2/4: PATCH 1/4 might lead
to host-libcap-ng being used, but this package doesn't exist.

Please make sure that the *order* of the patches in your series is
correct.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
