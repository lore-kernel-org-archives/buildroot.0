From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 15:56:12 +0200
Subject: [Buildroot] [PATCH v7 2/3] util-linux: expand selection of
 libraries and utilities
In-Reply-To: <1468113369-16118-4-git-send-email-casantos@datacom.ind.br>
References: <20160708205217.GB3757@free.fr>
 <1468113369-16118-1-git-send-email-casantos@datacom.ind.br>
 <1468113369-16118-4-git-send-email-casantos@datacom.ind.br>
Message-ID: <20161016155612.05e4238d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Jul 2016 22:16:08 -0300, Carlos Santos wrote:
> - Add option to control installation of libfdisk
> - Add libfdisk license to the comment in util-linux.mk
> - List all utilities provided by the basic set and document that
>   linux32, linux64, uname26, i386 and x86_64 are symlinks to setarch
> - Add options to install cal, ipcrm, ipcs, logger, lslogin and pg
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/util-linux/Config.in     | 51 ++++++++++++++++++++++++++++++++++++++++
>  package/util-linux/util-linux.mk |  9 ++++++-
>  2 files changed, 59 insertions(+), 1 deletion(-)

Applied to master, with the following changes:

    [Thomas: add missing dependency of the new lslogins option on
    libsmartcols, and therefore !MMU.]

Also, I added a patch that adjusts the way the license string is
formatted, to match with what we do in the rest of Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
