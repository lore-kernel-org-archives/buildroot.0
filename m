From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Mar 2018 05:34:39 +0000
Subject: [Buildroot] [Bug 10831] New: qemu_x86_64_defconfig build fails with
 "Incorrect selection of kernel headers: expected 4.11.x, got 4.15.x"
Message-ID: <bug-10831-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10831

            Bug ID: 10831
           Summary: qemu_x86_64_defconfig build fails with "Incorrect
                    selection of kernel headers: expected 4.11.x, got
                    4.15.x"
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ciro.santilli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Ubuntu 17.10 master:

git checkout 7df3014d84ff4b4d588e2857ee62a4bc0b3707d8
make qemu_x86_64_defconfig
make BR2_JLEVEL=6

Outcome:

>>> linux-headers 4.15 Building                     
>>> linux-headers 4.15 Installing to staging directory                                                   
(cd /home/ciro/bak/git/buildroot/output/build/linux-headers-4.15;
PATH="/home/ciro/bak/git/buildroot/output/host/bin:/home/ciro/bak/git/buildroot/output/host/sbin:./node_modules/.bin:/usr/local/heroku/bin:/home/
ciro/android-sdk/platform-tools:/home/ciro/android-sdk/tools:/home/ciro/android-studio//bin:/home/ciro/android-sdk/ndk-bundle:/home/ciro/android-sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux
-x86_64/bin:/home/ciro/bak/git/devbin:/home/ciro/bin:/usr/local/texlive/2013/bin/x86_64-linux:/home/ciro/.rvm/gems/ruby-2.4.1/bin:/home/ciro/.rvm/gems/ruby-2.4.1 at global/bin:/home/ciro/.rvm/rubies/ruby-2.4.1/bin:
./node_modules/.bin:/usr/local/heroku/bin:/home/ciro/android-sdk/platform-tools:/home/ciro/android-sdk/tools:/home/ciro/android-studio//bin:/home/ciro/android-sdk/ndk-bundle:/home/ciro/android-sdk/ndk-bundle/too
lchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:/home/ciro/bak/git/devbin:/home/ciro/bin:/usr/local/texlive/2013/bin/x86_64-linux:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/gam
es:/usr/local/games:/usr/bin:/snap/bin:/home/ciro/bak/git/latex:/home/ciro/.rvm/bin:/home/ciro/anaconda2/bin:/home/ciro/.cabal/bin:/bin:/home/ciro/.go/bin:/home/ciro/.local/bin/:/home/ciro/bak/git/runlinux:/usr/
bin:/home/ciro/bak/git/latex:/home/ciro/.rvm/bin:/home/ciro/anaconda2/bin:/home/ciro/.cabal/bin:/bin:/home/ciro/.go/bin:/home/ciro/.local/bin/:/home/ciro/bak/git/runlinux"
/usr/bin/make -j6 ARCH=x86_64 HOSTCC="/
usr/bin/gcc" HOSTCFLAGS="" HOSTCXX="/usr/bin/g++"
INSTALL_HDR_PATH=/home/ciro/bak/git/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr
headers_install)
  CHK     include/generated/uapi/linux/version.h    
  INSTALL include/misc (1 file)
[...]
  INSTALL include/asm (63 files)
if ! support/scripts/check-kernel-headers.sh 
/home/ciro/bak/git/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot 
4.11; then exit 1; fi                                                           
Incorrect selection of kernel headers: expected 4.11.x, got 4.15.x              
package/pkg-generic.mk:286: recipe for target
'/home/ciro/bak/git/buildroot/output/build/linux-headers-4.15/.stamp_staging_installed'
failed                                                                       
make[1]: ***
[/home/ciro/bak/git/buildroot/output/build/linux-headers-4.15/.stamp_staging_installed]
Error 1                                                                         
Makefile:79: recipe for target '_all' failed                                    
make: *** [_all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
