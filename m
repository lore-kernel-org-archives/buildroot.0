From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Sep 2009 09:06:12 +0200
Subject: [Buildroot] [PATCH 1/5] Remove the "project" feature
In-Reply-To: <a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue\,
	8 Sep 2009 00\:09\:49 +0200")
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<a57f463ae7b50d932282ded660a431251e1de379.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ljkp5317.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> The "project" feature was designed to allow to several projects
 Thomas> to be built inside the same Buildroot source tree and allowing
 Thomas> the toolchain and non-configurable packages to be shared
 Thomas> between the different projects on the same architecture. While
 Thomas> being interesting in theory, this feature adds a level of
 Thomas> complexity to Buildroot, both from an user perspective and from
 Thomas> a developer perspective, while one of the main Buildroot
 Thomas> strengh is to be simple. Moreover, this feature is only
 Thomas> seldomly used by our users.

I agree, I also don't like the complexity it added.

 Thomas>     - Don't make world depends on target-host-info. This target was
 Thomas>       defined by project/project.mk to customize /etc/issue,
 Thomas>       /etc/hostname and create /etc/br-version depending on the
 Thomas>       project definitions. We can of course imagine re-adding such a
 Thomas>       feature later.

Stuff like /etc/br-version is handy atleast. I think it would be nice to
keep all 3, as it is part of the current Kconfig interface, it makes it
easy to do minimal customization when you use the generic rootfs
skeleton and it adds only little complexity.

 Thomas>  * package/Makefile.autotools.in

 Thomas>     - Replace PROJECT_BUILD_DIR by BUILD_DIR for the location of the
 Thomas>       configure cache

 Thomas>     - Move the INSTALL_TARGET and HOOK_POST_INSTALL stamps to the same
 Thomas>       directory as the other stamps (i.e, in the package directory).

Yeah!

 Thomas>  * target/u-boot/Makefile.in

 Thomas>     - Replace PROJECT_BUILD_DIR by BUILD_DIR

 Thomas>     - Remove $(PROJECT) from the U-Boot target binary name

 Thomas>     - Remove the insertion in the configuration of the project name as
 Thomas>       the hostname

 Thomas>     - The u-boot-autoscript target now generates
 Thomas>       $(U_BOOT_AUTOSCRIPT).img instead of
 Thomas>       $(U_BOOT_AUTOSCRIPT).$(PROJECT)

The u-boot config stuff is imho way too overengineered, and could use
some cleanup/simplification.

-- 
Bye, Peter Korsgaard
