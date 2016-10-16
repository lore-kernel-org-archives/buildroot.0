From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 15:55:38 +0200
Subject: [Buildroot] [PATCH v7 1/3] util-linux: clean up libraries and
 tools selections
In-Reply-To: <1468113369-16118-2-git-send-email-casantos@datacom.ind.br>
References: <20160708205217.GB3757@free.fr>
 <1468113369-16118-1-git-send-email-casantos@datacom.ind.br>
 <1468113369-16118-2-git-send-email-casantos@datacom.ind.br>
Message-ID: <20161016155538.41de2d46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jul 2016 22:16:06 -0300, Carlos Santos wrote:
> Fix several problems in the package recipe:
> 
> - Make 'bool "lib<foo>"' the first item in each block
> - Move the depends before the selects
> - Add missing dependencies on BR2_USE_MMU, for fork()
> - Put option names corresponding to package/utility/library names in
>   lowercase, others start with capital letter
> - Improve help for cramfs utilities and login utilities
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/util-linux/Config.in     | 67 ++++++++++++++++++++++++++--------------
>  package/util-linux/util-linux.mk |  2 --
>  2 files changed, 43 insertions(+), 26 deletions(-)

Applied to master, with the following changes:

    [Thomas:
     - remove capitalization of prompts, for consistency
     - add missing dependencies on libsmartcols, and therefore !MMU]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
