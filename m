From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Sat, 5 Mar 2011 15:56:30 +0100
Subject: [Buildroot]  hal does not compile
Message-ID: <20110305155630.1983964a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

In my journey to build a tiny Xorg system (i386), things go well but I
encounter problems with mouse under X (buttons work ok, but cursor
movement is wrong), so I thought about including HAL to
see if it could help.

But, Hal fails to build with the following :

probe-storage.c:46:26: error: libvolume_id.h: No such file or directory
probe-storage.c: In function 'main':
probe-storage.c:119: error: 'volume_id_log_fn' undeclared (first use in
this function) probe-storage.c:119: error: (Each undeclared identifier
is reported only once probe-storage.c:119: error: for each function it
appears in.) probe-storage.c:427: warning: implicit declaration of
function 'volume_id_open_fd' probe-storage.c:427: warning: nested
extern declaration of 'volume_id_open_fd' probe-storage.c:427: warning:
assignment makes pointer from integer without a cast
probe-storage.c:429: warning: implicit declaration of function
'volume_id_probe_all' probe-storage.c:429: warning: nested extern
declaration of 'volume_id_probe_all' probe-storage.c:434: error:
dereferencing pointer to incomplete type probe-storage.c:434: error:
'VOLUME_ID_FILESYSTEM' undeclared (first use in this function)
probe-storage.c:435: error: dereferencing pointer to incomplete type
probe-storage.c:435: error: 'VOLUME_ID_RAID' undeclared (first use in
this function) probe-storage.c:436: error: dereferencing pointer to
incomplete type probe-storage.c:436: error: 'VOLUME_ID_OTHER'
undeclared (first use in this function) probe-storage.c:437: error:
dereferencing pointer to incomplete type probe-storage.c:437: error:
'VOLUME_ID_CRYPTO' undeclared (first use in this function)
probe-storage.c:442: warning: implicit declaration of function
'volume_id_close' probe-storage.c:442: warning: nested extern
declaration of 'volume_id_close' make[6]: *** [probe-storage.o] Erreur
1 make[6]: *** Attente des t?ches non termin?es.... make[6]: quittant
le r?pertoire
? /home/fred/buildroot/output/build/hal-0.5.8/hald/linux/probing ?
make[5]: *** [all-recursive] Erreur 1 make[5]: quittant le r?pertoire
? /home/fred/buildroot/output/build/hal-0.5.8/hald/linux ? make[4]: ***
[all-recursive] Erreur 1 make[4]: quittant le r?pertoire
? /home/fred/buildroot/output/build/hal-0.5.8/hald ? make[3]: *** [all]
Erreur 2 make[3]: quittant le r?pertoire
? /home/fred/buildroot/output/build/hal-0.5.8/hald ? make[2]: ***
[all-recursive] Erreur 1 make[2]: quittant le r?pertoire
? /home/fred/buildroot/output/build/hal-0.5.8 ? make[1]: *** [all]
Erreur 2 make[1]: quittant le r?pertoire
? /home/fred/buildroot/output/build/hal-0.5.8 ? make: ***
[/home/fred/buildroot/output/build/hal-0.5.8/hald/hald] Erreur 2


Thanks for any help!
