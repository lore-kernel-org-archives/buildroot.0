From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 6 Dec 2010 08:35:32 +0100
Subject: [Buildroot] [PATCH 09/55] Stop referencing the crazy
 target/device stuff
In-Reply-To: <47aba834b9147ad9a3ee0a32a08cd21763b0d4c8.1291582351.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<47aba834b9147ad9a3ee0a32a08cd21763b0d4c8.1291582351.git.thomas.petazzoni@free-electrons.com>
Message-ID: <AANLkTik7fEm_DTts5a=o-ooC2DOvTJyvhJc9f4ZA5qq4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Dec 5, 2010 at 9:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> We don't need Config.in and Makefile in target/device: defconfig files
> are sufficient to describe the specificities of a board (architecture,
> compilation flags, bootloader and kernel details, etc.).

How then would you add board-specific configuration options?
Suppose that for a certain board you can enable or disable a certain
feature. Previously, you'd add such an option in the board-specific
Config.in file, which was included via the manufacturer-specific
Config.in file, which was included from target/device/Config.in.
Now that all these are being removed, what's the strategy?

Related to this: previously some target/device/*/Config.in files added
configuration options called BR2_BOARD_NAME and BR2_BOARD_PATH. These
could be referenced from other configuration options, for example in
target/linux/Config.in.advanced, as the default Linux configuration
file. Is this mechanism still supported, or is there an alternative?

Thanks,
Thomas
