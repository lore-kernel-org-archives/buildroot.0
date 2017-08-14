From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:09:53 +0200
Subject: [Buildroot] [PATCH] Revert "syslinux: drop patch 0003,
 not needed after gnu-efi update"
In-Reply-To: <20170813232835.18414-1-arnout@mind.be>
References: <20170813232835.18414-1-arnout@mind.be>
Message-ID: <20170814220953.45dcf706@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Aug 2017 01:28:35 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> It turns out that this patch is still needed, since with some versions
> of binutils the error still occurs.
> 
> Partially fixes: https://gitlab.com/arnout/buildroot/-/jobs/28979377
> 
> This reverts commit 644c024edeb7e20bd96ce4426aeca2cbcd74d9b9.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Beno?t Allard <benoit.allard@greenbone.net>
> ---
> The failing ts5x00_defconfig also requires a kernel bump

The problem with this is that you are going to run into the problem I
reported at:
http://lists.busybox.net/pipermail/buildroot/2017-July/195927.html, i.e
the --no-dynamic-linker option doesn't exist in old binutils versions,
and will therefore cause a build failure.

BTW Arnout, you should not expect any feedback from Beno?t, he has left
his previous employer, and explicitly removed himself from the syslinux
developer:
https://git.buildroot.org/buildroot/commit/DEVELOPERS?id=74a1e8f9f220c8fb95abe1de67ee5441b7c449e7.
He will most likely not even receive your e-mail.

Therefore, we are on our own to figure out this one :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
