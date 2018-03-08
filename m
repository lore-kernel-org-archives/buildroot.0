From: =?utf-8?Q?Sh=C3=A9rab?= <Sebastien.Hinderer@ens-lyon.org>
Date: Thu, 8 Mar 2018 14:01:35 +0100
Subject: [Buildroot] Unable to build Buildroot
Message-ID: <20180308130135.GA1675@pema>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I am not able to build Buildroot any longer, although it used to work
and I can't remember of any change on the machine used tobuild.

Here is what happens just before the failure:

making all in debugfs
	MK_CMDS debug_cmds.c
	CC debugfs.c
	CC util.c
	CC ncheck.c
	CC icheck.c
	CC lsdel.c
	CC ls.c
	CC set_fields.c
	CC dump.c
	CC logdump.c
	CC htree.c
	CC unused.c
	CC e2freefrag.o
	CC filefrag.c
	MK_CMDS extent_cmds.c
	CC extent_inode.c
	CC zap.c
	CC create_inode.o
./../misc/create_inode.c: In function ?set_inode_xattr?:
./../misc/create_inode.c:140:9: warning: implicit declaration of function ?llistxattr?; did you mean ?lstat64?? [-Wimplicit-function-declaration]
  size = llistxattr(filename, NULL, 0);
         ^~~~~~~~~~
         lstat64
./../misc/create_inode.c:176:16: warning: implicit declaration of function ?lgetxattr?; did you mean ?getdate_r?? [-Wimplicit-function-declaration]
   value_size = lgetxattr(filename, name, NULL, 0);
                ^~~~~~~~~
                getdate_r
./../misc/create_inode.c: At top level:
./../misc/create_inode.c:399:18: error: conflicting types for ?copy_file_range?
 static errcode_t copy_file_range(ext2_filsys fs, int fd, ext2_file_t e2_file,
                  ^~~~~~~~~~~~~~~
In file included from ./../misc/create_inode.c:19:0:
/usr/include/unistd.h:1110:9: note: previous declaration of ?copy_file_range? was here
 ssize_t copy_file_range (int __infd, __off64_t *__pinoff,
         ^~~~~~~~~~~~~~~
Makefile:422?: la recette pour la cible ??create_inode.o?? a ?chou?e
make[5]: *** [create_inode.o] Erreur 1
make[5]: *** Attente des t?ches non termin?es....
Makefile:404?: la recette pour la cible ??all-progs-recursive?? a ?chou?e
make[4]: *** [all-progs-recursive] Erreur 1
Makefile:339?: la recette pour la cible ??all?? a ?chou?e
make[3]: *** [all] Erreur 2
package/pkg-generic.mk:247?: la recette pour la cible ??/home/shindere/src/brlpi/brlpi0w/build/host-e2fsprogs-1.43.7/.stamp_built?? a ?chou?e
make[2]: *** [/home/shindere/src/brlpi/brlpi0w/build/host-e2fsprogs-1.43.7/.stamp_built] Erreur 2
Makefile:16?: la recette pour la cible ??_all?? a ?chou?e
make[1]: *** [_all] Erreur 2
make[1]?: on quitte le r?pertoire ??/home/shindere/src/brlpi/brlpi0w??
Makefile:4?: la recette pour la cible ??brlpi0w/images/sdcard.img?? a ?chou?e
make: *** [brlpi0w/images/sdcard.img] Erreur 2

Can somebody see what could be wrong, please?

Many thanksin advance,

Sh?rab.
