From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 23:46:18 +0200
Subject: [Buildroot] [PATCH 04/28] linux: use the defconfig mechanism
	after tuning the config
In-Reply-To: <505d71eb153b750e7af08640a90e2efec8cbcf39.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:53:55 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <505d71eb153b750e7af08640a90e2efec8cbcf39.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87pqllpxw5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Currently, the kernel configuration mechanism works as follows for
 Thomas> custom configuration files:

 Thomas>  * Copy the custom config file to buildroot_defconfig in the kernel
 Thomas>    tree
 Thomas>  * Run "make buildroot_defconfig"
 Thomas>  * Remove the buildroot_defconfig
 Thomas>  * Tune the .config depending on some Buildroot options (EABI, MDEV,
 Thomas>    etc.)
 Thomas>  * Run oldconfig

 Thomas> And for a defconfig-based configuration:

 Thomas>  * Run "make XXX_defconfig"
 Thomas>  * Tune the .config depending on some Buildroot options (EABI, MDEV,
 Thomas>    etc.)
 Thomas>  * Run oldconfig

 Thomas> The problem is that the tuning done on the .config file can lead to
 Thomas> have new options available for which no value has been set. Therefore,
 Thomas> the "oldconfig" at the end of the process will hang the build process,
 Thomas> waiting for the user to confirm what should be done.

Why don't we just call 'make silentoldconfig' instead?

-- 
Bye, Peter Korsgaard
