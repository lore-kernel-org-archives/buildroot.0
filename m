From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:16:52 +0100
Subject: [Buildroot] [PATCH] cryptsetup: remove hard dependency on
 libgcrypt
In-Reply-To: <1423074809-602-1-git-send-email-bos@je-eigen-domein.nl>
References: <1423074809-602-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150308221652.48dc8cc4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Wed,  4 Feb 2015 19:33:28 +0100, Floris Bos wrote:
> - Add support for the alternative OpenSSL and Linux kernel crypto backends.
> The latter does require that additional kernel modules (like algif_hash)
> are present and loaded before invoking cryptsetup, so is used as last choice.
> 
> - Removes CRYPTSETUP_AUTORECONF as it is redundant, and reconf does
> create a dependency on libgcrypt for the m4 macros used.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Thanks, applied. I've added an explicit --with-crypto_backend=gcrypt
for good measure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
