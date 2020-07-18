From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jul 2020 21:19:44 +0000
Subject: [Buildroot] [Bug 13091] New: SYSTEMD build failed - no udevadm /
 systemctl
Message-ID: <bug-13091-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13091

            Bug ID: 13091
           Summary: SYSTEMD build failed - no udevadm / systemctl
           Product: buildroot
           Version: 2020.02.3
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ymarkman at marvell.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Buildroot 2020.02.3 in INIT-SYSTEMD configuration failed
(BusyBox and SYSV are ok) 

>>>   Finalizing target directory
./output/host/bin/udevadm hwdb --update --root ./output/target
/bin/bash: ./output/host/bin/udevadm: No such file or directory
/bin/bash: ./output/host/bin/systemctl: No such file or directory

-------------------------------------------------------------------
>>>   Finalizing target directory
grep -qsE '^/bin/bash$' ./output/target/etc/shells || echo "/bin/bash" >>
./output/target/etc/shells
if grep -q CONFIG_ASH=y ./output/build/busybox-1.31.1/.config; then grep -qsE
'^/bin/ash$' ./output/target/etc/shells || echo "/bin/ash" >>
./output/target/etc/shells; fi
if grep -q CONFIG_HUSH=y ./output/build/busybox-1.31.1/.config; then grep -qsE
'^/bin/hush$' ./output/target/etc/shells || echo "/bin/hush" >>
./output/target/etc/shells; fi
PYTHONPATH="./output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/python3.8/"
cd ./output/target && ./output/host/bin/python3.8
/home/ymarkman/devel/distributions/buildroot/velox.canon/buildroot/support/scripts/pycompile.py
usr/lib/python3.8
find ./output/target/usr/lib/python3.8 -name '*.opt-1.pyc' -print0 -o -name
'*.opt-2.pyc' -print0 | xargs -0 --no-run-if-empty rm -f
mkdir -p ./output/target/etc
echo "router" > ./output/target/etc/hostname
/usr/bin/sed -i -e '$a \127.0.1.1\trouter' -e '/^127.0.1.1/d'
./output/target/etc/hosts
/usr/bin/sed -i -e s,^root:[^:]*:,root:"`./output/host/bin/mkpasswd -m
"sha-256" "6windos"`":, ./output/target/etc/shadow
grep -qsE '^/bin/sh$' ./output/target/etc/shells || echo "/bin/sh" >>
./output/target/etc/shells
ln -sf bash ./output/target/bin/sh
/usr/bin/sed -i -e '/^root:/s,[^/]*$,bash,' ./output/target/etc/passwd
./output/host/bin/udevadm hwdb --update --root ./output/target
/bin/bash: ./output/host/bin/udevadm: No such file or directory

-- 
You are receiving this mail because:
You are on the CC list for the bug.
