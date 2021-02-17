From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 11:26:44 +0100
Subject: [Buildroot] [PATCH] package/uboot-tools: depend on u-boot when
 selected
In-Reply-To: <20210216142007.24983-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Tue, 16 Feb 2021 15:20:07 +0100")
References: <20210216142007.24983-1-patrickdepinguin@gmail.com>
Message-ID: <87h7mb3s7v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > The envimage creation logic only depended on u-boot when the user did not
 > specify a custom envimage source via
 > BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE . This assumes that a
 > user-provided envimage source is never coming from the u-boot source
 > tree.

 > But especially given the fact that the envimage creation logic used to be
 > part of the u-boot package, this is a realistic scenario: users may have
 > provided a value of BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE based on
 > $(UBOOT_DIR), e.g.:

 >     $(UBOOT_DIR)/board/foo-vendor/bar-board/env.txt

 > Therefore, always add the u-boot dependency if u-boot is selected, for
 > either case of custom or default envimage source.

 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
