From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Sep 2015 15:47:16 +0200
Subject: [Buildroot] [PATCHv2 1/1] board/wandboard: fix perl related
 linux compilation error
In-Reply-To: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
References: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
Message-ID: <20150922154716.0c3fec44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Sep 2015 10:45:21 +0800, imrehg at gmail.com wrote:
> From: Gergely Imreh <imrehg@gmail.com>
> 
> Replace the "timeconst" perl script with a bc script to fix an
> error due to syntax changes in perl which resulted in linux
> compilation error for the wandboard's 3.8 kernel. The patch is
> backported, kernels from 3.9 onward already have this change.
> 
> Signed-off-by: Gergely Imreh <imrehg@gmail.com>

The problem with this patch is that it fixes the problem specifically
for the wandboard_defconfig. Any other person building another kernel
version affected by the same problem will face the problem.

If the problem is serious, I don't really see another option than
having some logic in linux.mk to detect if the kernel is affected by
the problem, and replacing the perl script by a bc script.

Other ideas?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
