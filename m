From: Wang, Baojun <wangbj@lzu.edu.cn>
Date: Thu, 1 Feb 2007 16:51:02 +0800
Subject: [Buildroot] buildroot svn version failed to build using (almost)
	defconfig(busybox 1.2.2.1)
Message-ID: <370380949.08379@eyou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,

buildroot failed to build on busybox 1.2.2.1:

cp -dpf /opt/build/buildroot/build_i686/staging_dir/lib/libstdc++.so* /opt/build/buildroot/build_i686/root/lib/
cp -f  
target/device/x86/i386/busybox.config /opt/build/buildroot/build_i686/busybox-1.2.2.1/.config
/opt/build/buildroot/toolchain_build_i686/bin/sed -i -e 
s,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX=\"/opt/build/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-\", 
\
        /opt/build/buildroot/build_i686/busybox-1.2.2.1/.config ;
/opt/build/buildroot/toolchain_build_i686/bin/sed -i -e 
s,^PREFIX=.*,CROSS_COMPILER_PREFIX=\"/opt/build/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-\", 
\
        /opt/build/buildroot/build_i686/busybox-1.2.2.1/.config ;
/opt/build/buildroot/toolchain_build_i686/bin/sed -i -e "s/^.*CONFIG_LFS.*/CONFIG_LFS=y/;" /opt/build/buildroot/build_i686/busybox-1.2.2.1/.config
yes "" | make -j1 
CC=/opt/build/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-gcc 
CROSS_COMPILE="/opt/build/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-" 
\
        
CROSS="/opt/build/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-" -C /opt/build/buildroot/build_i686/busybox-1.2.2.1 
oldconfig
make[1]: Entering directory `/opt/build/buildroot/build_i686/busybox-1.2.2.1'
#
# using defaults found in .config
#
.config:6: trying to assign nonexistent symbol CONFIG_HAVE_DOT_CONFIG
.config:16: trying to assign nonexistent symbol CONFIG_DESKTOP
.config:29: trying to assign nonexistent symbol CONFIG_FEATURE_SYSLOG
.config:32: trying to assign nonexistent symbol CONFIG_FEATURE_HAVE_RPC
.config:34: trying to assign nonexistent symbol 
CONFIG_FEATURE_EXEC_PREFER_APPLETS
.config:51: trying to assign nonexistent symbol CONFIG_WERROR
.config:55: trying to assign nonexistent symbol CONFIG_INCLUDE_SUSv2
.config:64: trying to assign nonexistent symbol CONFIG_PREFIX
.config:69: trying to assign nonexistent symbol CONFIG_PASSWORD_MINLEN
.config:71: trying to assign nonexistent symbol CONFIG_FEATURE_EDITING
.config:72: trying to assign nonexistent symbol 
CONFIG_FEATURE_EDITING_FANCY_KEYS
.config:73: trying to assign nonexistent symbol CONFIG_FEATURE_EDITING_VI
.config:74: trying to assign nonexistent symbol CONFIG_FEATURE_EDITING_HISTORY
.config:75: trying to assign nonexistent symbol 
CONFIG_FEATURE_EDITING_SAVEHISTORY
.config:76: trying to assign nonexistent symbol CONFIG_FEATURE_TAB_COMPLETION
.config:77: trying to assign nonexistent symbol 
CONFIG_FEATURE_USERNAME_COMPLETION
.config:78: trying to assign nonexistent symbol 
CONFIG_FEATURE_EDITING_FANCY_PROMPT
.config:225: trying to assign nonexistent symbol CONFIG_FEATURE_WC_LARGE
.config:261: trying to assign nonexistent symbol CONFIG_RESIZE
.config:262: trying to assign nonexistent symbol CONFIG_FEATURE_RESIZE_PRINT
.config:301: trying to assign nonexistent symbol CONFIG_FEATURE_ALLOW_EXEC
.config:353: trying to assign nonexistent symbol CONFIG_LOGIN_SCRIPTS
.config:356: trying to assign nonexistent symbol 
CONFIG_FEATURE_PASSWD_WEAK_CHECK
.config:358: trying to assign nonexistent symbol CONFIG_FEATURE_SU_SYSLOG
.config:359: trying to assign nonexistent symbol 
CONFIG_FEATURE_SU_CHECKS_SHELLS
.config:384: trying to assign nonexistent symbol 
CONFIG_FEATURE_MODPROBE_FANCY_ALIAS
.config:398: trying to assign nonexistent symbol CONFIG_FEATURE_DMESG_PRETTY
.config:405: trying to assign nonexistent symbol 
CONFIG_FDISK_SUPPORT_LARGE_DISKS
.config:433: trying to assign nonexistent symbol CONFIG_FEATURE_MOUNT_CIFS
.config:434: trying to assign nonexistent symbol CONFIG_FEATURE_MOUNT_FLAGS
.config:435: trying to assign nonexistent symbol CONFIG_FEATURE_MOUNT_FSTAB
.config:469: trying to assign nonexistent symbol CONFIG_FEATURE_LESS_MAXLINES
.config:487: trying to assign nonexistent symbol CONFIG_NMETER
.config:488: trying to assign nonexistent symbol CONFIG_RAIDAUTORUN
.config:489: trying to assign nonexistent symbol CONFIG_READAHEAD
.config:495: trying to assign nonexistent symbol CONFIG_FEATURE_TASKSET_FANCY
.config:503: trying to assign nonexistent symbol 
CONFIG_VERBOSE_RESOLUTION_ERRORS
.config:504: trying to assign nonexistent symbol CONFIG_ARP
.config:532: trying to assign nonexistent symbol 
CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN
.config:549: trying to assign nonexistent symbol CONFIG_FEATURE_IP_RULE
.config:555: trying to assign nonexistent symbol CONFIG_IPRULE
.config:561: trying to assign nonexistent symbol CONFIG_NC_SERVER
.config:562: trying to assign nonexistent symbol CONFIG_NC_EXTRA
.config:573: trying to assign nonexistent symbol 
CONFIG_FEATURE_TELNETD_STANDALONE
.config:584: trying to assign nonexistent symbol CONFIG_APP_DHCPRELAY
.config:603: trying to assign nonexistent symbol CONFIG_KILLALL5
.config:659: symbol value '' invalid for CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE
make[2]: *** [oldconfig] Error 1
make[1]: *** [oldconfig] Error 2
make[1]: Leaving directory `/opt/build/buildroot/build_i686/busybox-1.2.2.1'
make: *** [/opt/build/buildroot/build_i686/busybox-1.2.2.1/.configured] Error 
2

sounds like it's the target/device/x86/i386/busybox.config is wrong ...

-- 
Wang, Baojun                                        Lanzhou University
Distributed & Embedded System Lab              http://dslab.lzu.edu.cn
School of Information Science and Engeneering        wangbj at lzu.edu.cn
Tianshui South Road 222. Lanzhou 730000                     .P.R.China
Tel:+86-931-8912025                                Fax:+86-931-8912022
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070201/2e1cf601/attachment.pgp 
