From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Dec 2010 20:43:39 +0100
Subject: [Buildroot] [PATCH 09/55] Stop referencing the crazy
 target/device stuff
In-Reply-To: <AANLkTik7fEm_DTts5a=o-ooC2DOvTJyvhJc9f4ZA5qq4@mail.gmail.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<47aba834b9147ad9a3ee0a32a08cd21763b0d4c8.1291582351.git.thomas.petazzoni@free-electrons.com>
	<AANLkTik7fEm_DTts5a=o-ooC2DOvTJyvhJc9f4ZA5qq4@mail.gmail.com>
Message-ID: <20101206204339.44533180@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 6 Dec 2010 08:35:32 +0100
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:

> How then would you add board-specific configuration options?
> Suppose that for a certain board you can enable or disable a certain
> feature. Previously, you'd add such an option in the board-specific
> Config.in file, which was included via the manufacturer-specific
> Config.in file, which was included from target/device/Config.in.
> Now that all these are being removed, what's the strategy?

Could you give examples of what these options would be ? I think it
would depend on which options we're talking about, I don't have a
generic answer to this question.

At least in the existing target/device/*/Config.in files, there were no
such options.

> Related to this: previously some target/device/*/Config.in files added
> configuration options called BR2_BOARD_NAME and BR2_BOARD_PATH. These
> could be referenced from other configuration options, for example in
> target/linux/Config.in.advanced, as the default Linux configuration
> file. Is this mechanism still supported, or is there an alternative?

target/linux/Config.in.advanced does not exist anymore.

In the U-Boot or Linux configuration, if you need to reference
something in the board-specific directory, just use
"board/<vendor>/<boardname>/something". For example, in the mini2440
defconfig:

BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/mini2440/linux-2.6.32.2.config"

Regards!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
