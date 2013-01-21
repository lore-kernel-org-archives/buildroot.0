From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 21 Jan 2013 06:38:46 +0100
Subject: [Buildroot] [RFC v1 01/14] Add a new "src" directory in the
	output directory
In-Reply-To: <1358713538-4364-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358713538-4364-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1663985.KsIK240cT1@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 20 January 2013 21:25:25 Thomas Petazzoni wrote:
> This new directory will be used to extract the source directory of the
> different packages, as part of the out of tree support.
> 
> Note that we need to explicitly re-add write permissions on the
> contents of this directory, because write permissions are removed from
> the source code of packages in order to ensure that the packages are
> not incorrectly modifying their source directory during an out of tree
> build. We also re-add write permissions to the build directory since
> some packages copy files from their source directory to the build
> directory, causing rm to fail due to lack of permissions.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile |    8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 6f8ed0e..15ce4e4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -260,6 +260,7 @@ GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
>  STAMP_DIR:=$(BASE_DIR)/stamps
> 
>  BINARIES_DIR:=$(BASE_DIR)/images
> +SRC_DIR:=$(BASE_DIR)/src

IMHO, $(SRC_DIR) should be in $(TOPDIR) to be shared between different 
configurations. In add $(SRC_DIR) have to customizable in case I would like to 
clearly separate two projects.

I think, my workspace would look like this:
  br/srcs-projet1
  br/srcs-projet2
  br/output-project1-configA
  br/output-project1-configB
  br/output-project2-configA
  br/output-project2-configB

Finally SRC_DIR should be handled like DL_DIR.

-- 
J?r?me Pouiller
