From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 09:55:20 +0100
Subject: [Buildroot] [PATCH] package/llvm: set the path to llvm-config
In-Reply-To: <20190116213921.2280-1-romain.naour@smile.fr> (Romain Naour's
 message of "Wed, 16 Jan 2019 22:39:21 +0100")
References: <20190116213921.2280-1-romain.naour@smile.fr>
Message-ID: <87o98f8xzb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > While building llvm for the target (x86_64), the build failded due to
 > path poisoning (-I/usr/include/libxml2) while building NATIVE tools
 > (i.e for the host). The llvm package try to build a tool for the host
 > with the cross-compiler which doesn't work when the paranoid toolchain
 > wrapper (BR2_COMPILER_PARANOID_UNSAFE_PATH) is enabled.

 > We know that llvm (target) needs llvm-tablegen and llvm-config build by
 > host-llvm, but only LLVM_TABLEGEN is provided by llvm.mk. Adding
 > LLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config for llvm (target)
 > fixes the path poisoining issue since llvm doesn't build the NATIVE
 > variant.

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Cc: Valentin Korenblit <valentinkorenblit@gmail.com>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
