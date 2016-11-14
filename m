From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Nov 2016 22:34:31 +0100
Subject: [Buildroot] [PATCHv2] dtv-scan-tables: rename file to have only
 ASCII characters
In-Reply-To: <1479158436-4361-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1479158436-4361-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161114223431.47aa1c73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Nov 2016 22:20:36 +0100, Thomas Petazzoni wrote:
> Since the bump of dtv-scan-tables to version
> ceb11833b35f05813b1f0397a60e0f3b99430aab in commit
> b1c8794d8ac0eb3895d13ae91d8e912ec469a105, one file contains non-ASCII
> characters, which causes encoding issues tvheadend. Since no other
> file in the dtv-scan-tables code base contains files with non-ASCII
> characters (despite having files named after cities in various
> countries that definitely do have non-ASCII characters), we rename
> this file so that it is named with only ASCII characters.
> 
> This fixes the build of tvheadend, which was failing when the host
> Python interpreter was python3, due to a file name encoding issue.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1ae8bee297edb089535a2fb6ec724ebf7976888d/
>   (tvheadend)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>  - use a post-patch hook instead of doing the rename at the end of the
>    installation step
> ---
>  package/dtv-scan-tables/dtv-scan-tables.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied to master, thanks. Thanks Yann for reviewing the patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
