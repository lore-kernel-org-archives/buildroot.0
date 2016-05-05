From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 May 2016 08:15:15 +0200
Subject: [Buildroot] [PATCH v8] core/pkg-kconfig: Use olddefconfig when
	available
In-Reply-To: <1462178199-21742-1-git-send-email-romain.izard.pro@gmail.com>
 (Romain Izard's message of "Mon, 2 May 2016 10:36:39 +0200")
References: <1462178199-21742-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <87pot1ni8c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Izard <romain.izard.pro@gmail.com> writes:

 > Using 'yes "" | make oldconfig' to regenerate a .config file from an
 > existing defconfig does not work reliably in all cases. Specifically, it
 > does not work well with tristate choice entries.

 > The correct way to do it is to use 'make olddefconfig', but this target
 > is not supported in projects that use an old version of kconfig. As
 > most projects do not use tristate entries, there is no need for them to
 > upgrade.

 > 'oldnoconfig' is an alias for 'olddefconfig', but it also is the only
 > name for this target between Linux versions 2.6.36 and 3.6.

 > Check which targets are supported by the current project, and use the
 > appropriate method to regenerate the .config file.

 > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Changelog:
 > v1: New patch
 > v2: Use oldnoconfig instead of olddefconfig
 >     Fix silent mode
 >     Change the pattern in both places where it is used
 >     Use a macro to avoid redundancy
 > v3: Do not use $(call ...)
 >     Use the $(2)_KCONFIG_MAKE variable
 > v4: No change
 > v5: Detect available methods and use the most recent one
 > v6: Remove colon from matched rule names
 > v7: Shell-based conditons, does not work with backticks
 > v8: Return to v6, with more comments

Committed, thanks everyone!

-- 
Bye, Peter Korsgaard
