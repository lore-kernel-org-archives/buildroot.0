From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Tue, 02 Dec 2014 12:00:50 +0100
Subject: [Buildroot] [PATCHv2 1/4] toolchain-external: split target
	installation from staging installation
In-Reply-To: <1417470100-32657-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417470100-32657-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417470100-32657-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5888091.zWNFtSVGpv@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 01 December 2014 22:41:37 Thomas Petazzoni wrote:
> Currently, all the installation work of the toolchain-external package
> is done during the install-staging step. However, in order to be able
> to properly collect the size added by each package to the target
> filesystem, we need to make sure that toolchain-external installs its
> files to $(TARGET_DIR) during the install-target step.
Great, this also fix:

   rm -r target build/*/.stamp_target_installed && make

Tested-by: J?r?me Pouiller <jezz@sysmic.org>

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 36 +++++++++++++++++-----
>  1 file changed, 29 insertions(+), 7 deletions(-)

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
