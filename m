From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 20:32:18 +0100
Subject: [Buildroot] [PATCH 3/4] toolchain: allow for stupid toolchains
In-Reply-To: <1421951608-31233-4-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1421951608-31233-4-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20150125203218.1f5f504a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Thu, 22 Jan 2015 15:33:27 -0300, Ezequiel Garcia wrote:
> From: Guido Mart?nez <guido@vanguardiasur.com.ar>
> 
> check_arm_abi builds a test C file to check that the toolchain is
> working correctly, with the output redirected to /dev/null.
> 
> However, some toolchains (OSELAS 2013.12.2, for instance) foolishly
> append ".gdb" to the output filename for an intermediate file, causing
> an attempt to write to /dev/null.gdb, which obviously fails.
> 
> Fix this by adding an option to skip this check, so it can be selected
> in the OSELAS toolchain.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Instead of skipping the check, can we fix the check instead? Like
outputting to a temporary file, and removing it afterward, or something
like that?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
