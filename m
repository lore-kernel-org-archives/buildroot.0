From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Oct 2010 14:13:30 +0000 (UTC)
Subject: [Buildroot] [Bug 2551] [PATCH] native toolchain in the target
	filesystem fails
In-Reply-To: <bug-2551-163@https.bugs.busybox.net/>
References: <bug-2551-163@https.bugs.busybox.net/>
Message-ID: <20101015141330.422808CA99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2551

--- Comment #1 from Clement Foucher <foucher@unice.fr>  ---
Same problem with arch=powerpc and gcc version=4.3.5. Log:

[...]
make[6]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target/ld
?
make[5]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target/ld
?
make[4]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target/ld
?
make[3]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target/ld
?
make[6]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target/binutils
?
make[5]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target/binutils
?
make[4]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target/binutils
?
make[3]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target/binutils
?
make[2]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target
?
make[1]: quittant le r?pertoire ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/binutils-2.20.1-target
?
rm -rf
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/target/share/locale
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/staging/usr/bin/powerpc-unknown-linux-uclibc-strip
--remove-section=.comment --remove-section=.note
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/target/usr/powerpc-unknown-linux-uclibc/bin/*
> /dev/null 2>&1
make:
[/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/target/usr/bin/ld]
Erreur 1 (ignor?e)
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/staging/usr/bin/powerpc-unknown-linux-uclibc-strip
--remove-section=.comment --remove-section=.note
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/target/usr/bin/* >
/dev/null 2>&1
make:
[/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/target/usr/bin/ld]
Erreur 1 (ignor?e)
mkdir -p
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/toolchain/gcc-4.3.5-final
touch
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/gcc-4.3.5-target/.prepared
touch: impossible de faire un touch ?
/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/gcc-4.3.5-target/.prepared
?: Aucun fichier ou dossier de ce type
make: ***
[/home/foucher/Bureau/12-3/common/buildroot-2010.08/output/build/gcc-4.3.5-target/.prepared]
Erreur 1

Trying the patch now, this seems to solve the problem, but since there is
another problem after, I'm unable to test the software.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
