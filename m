From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 08:55:47 +0100
Subject: [Buildroot] [PATCH] toolchain/helpers: make sure we bail out
 when kernel headers check fails
In-Reply-To: <20191113214114.GB26360@scaer> (Yann E. MORIN's message of "Wed, 
 13 Nov 2019 22:41:14 +0100")
References: <20191112202118.56136-1-thomas.petazzoni@bootlin.com>
 <20191113214114.GB26360@scaer>
Message-ID: <87d0dopaf0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > On 2019-11-12 21:21 +0100, Thomas Petazzoni spake thusly:
 >> In commit 6136765b23abd9faba610dd54ed276a777811575 ("toolchain:
 >> generate check-headers program under $(BUILD_DIR)"), the
 >> check_kernel_headers_version function was simplified to not check the
 >> return value of the check-kernel-headers.sh script, assuming that
 >> "make" does bail out on the first failing command.
 >> 
 >> However, check_kernel_headers_version when used in $(2)_CONFIGURE_CMDS
 >> from pkg-toolchain-external.mk, is called in a sequence of commands,
 >> where the return value of each command is not checked. Therefore, a
 >> failure of check-kernel-headers.sh no longer aborts the build.
 >> 
 >> Since all other macros are using this principle of calling "exit 1",
 >> we revert back to the same for check_kernel_headers_version, as it was
 >> done prior to 6136765b23abd9faba610dd54ed276a777811575.
 >> 
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> Cc: Carlos Santos <unixmania@gmail.com>

 > Applied to master, thanks.

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
