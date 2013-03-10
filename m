From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 22:32:01 +0100
Subject: [Buildroot] [PATCH v2 7/8] gptfdisk: add support for building
	and install cgdisk
In-Reply-To: <1362689131-1479-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Mar 2013 21:45:29 +0100")
References: <1362689131-1479-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362689131-1479-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874ngjx7ou.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In addition to the command-line tool gdisk and the interactive tool
 Thomas> sgdisk, gptfdisk also provides a ncurses based tool, cgdisk. This
 Thomas> commit adds support for building and installing this tool.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/gptfdisk/Config.in   |    8 ++++++++
 Thomas>  package/gptfdisk/gptfdisk.mk |    4 ++++
 Thomas>  2 files changed, 12 insertions(+)

 Thomas> diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
 Thomas> index 0d7e358..1cdd8eb 100644
 Thomas> --- a/package/gptfdisk/Config.in
 Thomas> +++ b/package/gptfdisk/Config.in
 Thomas> @@ -31,5 +31,13 @@ config BR2_PACKAGE_GPTFDISK_SGDISK
 Thomas>  	  /usr/sbin/sgdisk which is named after the traditional MBR based
 Thomas>  	  sfdisk tool albeit with an entirely different option syntax.
 
 Thomas> +config BR2_PACKAGE_GPTFDISK_CGDISK
 Thomas> +	bool "ncurses cgdisk"
 Thomas> +	depends on BR2_PACKAGE_GPTFDISK
 Thomas> +	select BR2_PACKAGE_NCURSES
 Thomas> +	help
 Thomas> +	  Install the ncurses-based GUID partition table (GPT)
 Thomas> +	  manipulator /usr/sbin/cgdisk.

You forgot to update the select-gdisk-if-nothing-else-is-enabled logic,
so I've fixed that and committed, thanks.

-- 
Bye, Peter Korsgaard
