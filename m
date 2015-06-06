From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Jun 2015 13:54:11 +0200
Subject: [Buildroot] [PATCH 1/1] savedefconfig: Remove BR2_DEFCONFIG
	from saved defconfig file
In-Reply-To: <1433405793-26785-1-git-send-email-Herve.CODINA@celad.com> (Herve
 Codina's message of "Thu, 4 Jun 2015 10:16:33 +0200")
References: <1433405793-26785-1-git-send-email-Herve.CODINA@celad.com>
Message-ID: <871thpm4rg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Herve" == Herve Codina <Herve.CODINA@celad.com> writes:

 > BR2_DEFCONFIG should not be present in saved defconfig file.
 > The use case is:
 > make qemu_arm_versatile
 > make savedefconfig BR2_DEFCONFIG=my_custom_defconfig

 > BR2_DEFCONFIG is set in my_custom_defconfig with an absolute path
 > to qemu_arm_versatile (value present in .config) and set in
 > my_custom_defconfig as it is different from default mentionned in
 > config.in (default is BR2_DEFCONFIG from environnement).

 > On savedefconfig recipe, simply remove BR2_DEFCONFIG from generated file

 > Signed-off-by: Herve Codina <Herve.CODINA@celad.com>

Committed with the issues pointed out by Arnout fixed, thanks.

-- 
Bye, Peter Korsgaard
