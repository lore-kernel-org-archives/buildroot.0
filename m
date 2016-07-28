From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jul 2016 23:34:06 +0200
Subject: [Buildroot] [PATCH v3] kmsxx: new package
In-Reply-To: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
References: <20160728193825.9199-1-maxime.ripard@free-electrons.com>
Message-ID: <20160728233406.30c9f31d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jul 2016 21:38:25 +0200, Maxime Ripard wrote:
> KMS++ is a suite of library and test tools to interact with KMS drivers in
> the linux kernel.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

I've applied, after doing numerous updates:

    [Thomas:
     - rename prompt to kms++, suggested by Yann E. Morin
     - fixup the thread dependency comment
     - remove the mention of the python wrapper in the Config.in help
       text, since they are not installed
     - fix the Config.in comment to mention the C++ and gcc >= 4.8
       dependencies
     - use = instead of += when appropriate
     - use a loop to install the test programs
     - use a loop to install the libraries
     - add installation to staging as well, both the libraries and header
       files
     - add missing dependency on host-pkgconf
     - add hash file.]

Also, it would be nice to tell upstream that CMake can not only build
stuff, but also install stuff. It is a bit silly to be using a
well-known build system, but not use it to provide proper install
targets.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
