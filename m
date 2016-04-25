From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 23:17:17 +0200
Subject: [Buildroot] [PATCH 0/5] Align library locations in target and
 staging
In-Reply-To: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160425231717.7a85e856@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2016 20:20:21 +0100, Thomas De Schampheleire wrote:

> Thomas De Schampheleire (5):
>   toolchain-external: blackfin: install FDPIC libraries also to staging
>   toolchain-external: remove unused calculation of ARCH_SUBDIR
>   toolchain-external: extract installation of gdbserver to separate
>     define
>   toolchain-external: align library locations in target and staging dir
>   toolchain-external: unify LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS

The entire series is applied. I've also applied two additional cleanups
(see below). Thanks a lot for your work on this series. Not only it
makes the thing more functional, but it also makes the code simpler.
Definitely very good.

Thanks to Arnout and Romain for reviewing those not-so-simple changes!

commit ed2a15b79136db815e034aa9e5aa0635e91222ec
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Mon Apr 25 22:53:11 2016 +0200

    toolchain-external: remove useless shell continuations
    
    When a message with MESSAGE, we can print it as the first command of
    the command sequence, and in this case, we don't need to use a shell
    continuation.
    
    In one case, the call to MESSAGE is moved a few lines up in the
    sequence of commands.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

commit 12584c2c701fab1478da547dc85b69c3377e6d25
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Mon Apr 25 22:12:43 2016 +0200

    toolchain-external: rename Blackfin related special variables
    
    As suggested by Arnout, this commit renames:
    
     - TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC to
       TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
    
     - TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT to
       TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
    
    Which makes it clear that those variables are installing libraries to
    the target, and make their naming more consistent with the naming of
    other variables in the file.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
