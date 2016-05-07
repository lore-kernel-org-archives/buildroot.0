From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Sat, 7 May 2016 11:04:24 +0200
Subject: [Buildroot] host-mtools 4.0.18 fails to install to host directory
Message-ID: <572DAF98.6070002@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Buildroot 2016.05-git-01197-gda433d6-dirty and .config attached, 
host-mtools fails to install to the host directory:

> >>> host-mtools 4.0.18 Installing to host directory
> PATH="/home/tech/dev/buildroot/output/host/bin:/home/tech/dev/buildroot/output/host/sbin:/home/tech/dev/buildroot/output/host/usr/bin:/home/tech/dev/buildroot/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" 
> PKG_CONFIG="/home/tech/dev/buildroot/output/host/usr/bin/pkg-config" 
> PKG_CONFIG_SYSROOT_DIR="/" 
> PKG_CONFIG_LIBDIR="/home/tech/dev/buildroot/output/host/usr/lib/pkgconfig" 
> /usr/bin/make -j1 install -C 
> /home/tech/dev/buildroot/output/build/host-mtools-4.0.18/
> make[1]: ingresso nella directory 
> "/home/tech/dev/buildroot/output/build/host-mtools-4.0.18"
>
> [...]
>
> ./mkinstalldirs /home/tech/dev/buildroot/output/host/usr/share/info
> if test -f mtools.info; then \
>   for i in mtools.info*; do \
>     /usr/bin/install -c -m 644 $i 
> /home/tech/dev/buildroot/output/host/usr/share/info/$i; \
>   done; \
> else \
>   for i in ./mtools.info*; do \
>     /usr/bin/install -c -m 644 $i 
> /home/tech/dev/buildroot/output/host/usr/share/info/`echo $i | sed 
> 's|^./||'`; \
>   done; \
> fi; \
> if [ -n "/usr/bin/install-info" ] ; then \
>     /usr/bin/install-info 
> --info-dir=/home/tech/dev/buildroot/output/host/usr/share/info 
> /home/tech/dev/buildroot/output/host/usr/share/info/mtools.info; \
> fi
> install-info: /home/tech/dev/buildroot/output/host/usr/share/info/dir: 
> file vuoto
> Makefile:222: set di istruzioni per l'obiettivo "install-info" non 
> riuscito
> make[1]: *** [install-info] Errore 1
> make[1]: uscita dalla directory 
> "/home/tech/dev/buildroot/output/build/host-mtools-4.0.18"
> package/pkg-generic.mk:205: set di istruzioni per l'obiettivo 
> "/home/tech/dev/buildroot/output/build/host-mtools-4.0.18/.stamp_host_installed" 
> non riuscito
> make: *** 
> [/home/tech/dev/buildroot/output/build/host-mtools-4.0.18/.stamp_host_installed] 
> Errore 2


In English:

> install-info: /home/tech/dev/buildroot/output/host/usr/share/info/dir: 
> file vuoto

means:

file empty.
In fact /home/tech/dev/buildroot/output/host/usr/share/info/dir has 0 
byte length.





-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 94390 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160507/814f84b9/attachment.wsdl>
