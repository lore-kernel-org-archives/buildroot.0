From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 22:44:35 +0100
Subject: [Buildroot] [PATCH] qemu: Change CPU in qemu command for aarch64
In-Reply-To: <20190124165309.2001-1-gerome.burlats@smile.fr> (Gerome Burlats's
 message of "Thu, 24 Jan 2019 17:53:09 +0100")
References: <20190124165309.2001-1-gerome.burlats@smile.fr>
Message-ID: <87ef8xn5bw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gerome" == Gerome Burlats <gerome.burlats@smile.fr> writes:

 > This commit changes to "cortex-a53" the CPU model in the qemu command
 > for aarch64 (since it is the default one for this architecture).

 > Signed-off-by: Gerome Burlats <gerome.burlats@smile.fr>
 > Cc: Romain Naour <romain.naour@smile.fr>
 > ---

 > cortex-a53 is the default cpu for aarch64, but some defconfigs, for
 > example raspberrypi3_64_defconfig, still have "BR2_cortex_a53=y"
 > (maybe at one point, this cpu was not the default).
 > Should this line stay in the defconfig for info, even if it is not used ?
 > If we generate the defconfig with "make savedefconfig", BR2_cortex_a53=y is indeed not added in the file.

Correct. We typically do add for clarity and robustness against changes
of the default value.

It is correct that savedefconfig will strip such redundant entries, but
as you can see from the comments, qemu_aarch64_virt_defconfig is edited
by hand.

Committed after extending the commit message and adding an explicit
BR2_cortex_a53=y to the defconfig, thanks.

-- 
Bye, Peter Korsgaard
