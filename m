From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Jan 2013 23:15:49 +0100
Subject: [Buildroot] [PATCHv2] barebox: Allow to build an environment
	image
In-Reply-To: <1359403834-1052-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 28 Jan 2013 21:10:34 +0100")
References: <1359403834-1052-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87obg9dkdm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
 Maxime> ---
 Maxime>  boot/barebox/Config.in  |   19 +++++++++++++++++++
 Maxime>  boot/barebox/barebox.mk |   14 ++++++++++++++
 Maxime>  2 files changed, 33 insertions(+)

Committed with some minor help text changes (see below) - Thanks.

 Maxime> +config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
 Maxime> +	string "Environment path"
 Maxime> +	depends on BR2_TARGET_BAREBOX_CUSTOM_ENV
 Maxime> +	help
 Maxime> +	  Path to the folder containing the custom barebox

We normally call them directories in Buildroot.

 Maxime> +	  environment. Depending on your setup, it will probably be

+ based on

 Maxime> +	  either the content of the defaultenv or defaultenv-2 folders

s/folders/directories/

 Maxime> +	  in the barebox source code plus the additions needed. The
 Maxime> +	  output will be an image at the barebox devfs format, stored

s/at the/in the/

 Maxime> +	  in the images directory, with the same name than the folder

s/folder/directory name/

-- 
Bye, Peter Korsgaard
