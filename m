From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jun 2015 16:29:37 +0200
Subject: [Buildroot] [PATCH] package/libpthsem: correctly handle --{en,
 dis}able-debug arguments on configure
In-Reply-To: <1426798923-13980-2-git-send-email-steven@uplinklabs.net>
References: <1426798923-13980-1-git-send-email-steven@uplinklabs.net>
 <1426798923-13980-2-git-send-email-steven@uplinklabs.net>
Message-ID: <20150605162937.40e218c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Thu, 19 Mar 2015 14:02:03 -0700, Steven Noonan wrote:
> The pthsem package was incorrectly handling --{en,dis}able-debug. If either of
> the two were provided, it always assumed that meant that debugging should be
> enabled, which resulted in *extremely* noisy debug logging (e.g. this can be
> observed by generating a GPG keypair).
> 
> This patch makes pthsem handle the argument correctly.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  .../0002-fix-configure-disable-debug.patch         | 54 ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 package/libpthsem/0002-fix-configure-disable-debug.patch

We are no longer passing --enable-debug / --disable-debug to packages,
so I believe this patch is no longer necessary. I've marked it as
"Rejected" in our patch tracking system. If you think it is still
needed, to do hesitate to switch it back to the "New" state (or ask us
to do so if you don't have a patchwork account).

For reference, the URL of the patch in patchwork is:

	http://patchwork.ozlabs.org/patch/452271/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
