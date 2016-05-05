From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 15:56:45 +0200
Subject: [Buildroot] [PATCH v3] barebox: add an option to embed
 environment image
In-Reply-To: <1462360499-29955-1-git-send-email-yegorslists@googlemail.com>
References: <1462360499-29955-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160505155645.53ec9414@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 May 2016 13:14:59 +0200, yegorslists at googlemail.com wrote:

> +config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV_PATH
> +	string "Embedded environment path"
> +	help

We already have an option BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH, which if
I understand correctly, generates a Barebox environment image (but not
built into the Barebox binary itself).

Wouldn't it make more sense to simply add a boolean option that says
whether the Barebox environment should be built-in or not? Something
like:

	(board/foo/bar/barebox.env) Environment path
	[*] Embed the environment in the image

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
