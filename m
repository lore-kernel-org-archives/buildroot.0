From: Daniele <daniele.email0@gmail.com>
Date: Thu, 16 Oct 2014 04:25:04 +0000 (UTC)
Subject: [Buildroot] Buildroot 2014.02 : make on raspberry pi failed
References: <CACfHD-gFTUe-ybERH4tHGHx7b8zpvDv2ULY2m2eZ-=0WmJHfdw@mail.gmail.com>
Message-ID: <loom.20141016T061551-319@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cyrille DERORY <cyrille.derory@...> writes:

> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> Hello,
> this my first days on buildroot and first post on this list.
> I have tried to build for the raspberry pi target with the following :
> 
> make raspberrypi_defconfig
> make
> I have an error :mkdir: impossible de cr?er le r?pertoire 
??/home/cderory/T?l?chargements/buildroot/buildroot-
2014.02/output/target/var/cache??: N'est pas un dossier
> 
> Makefile:507: recipe for target 'target-finalize' failed
> "cache"? is not a directory.
> ?I have checked on "var" directory :[cderory <at> EEE-PC-DERORY var]$ ls -
latotal 40
> 
> drwxr-xr-x? 3 cderory users 4096? 4 mars? 03:01 .drwxr-xr-x 17 cderory 
users 4096? 4 mars? 03:01 ..-rwxr-xr-x? 1 cderory users??? 6 27 f?vr. 21:51 
cachedrwxr-xr-x? 2 cderory users 4096? 4 mars? 03:01 lib-rwxr-xr-x? 1 
cderory users??? 6 27 f?vr. 21:51 lock
> 
> -rwxr-xr-x? 1 cderory users??? 6 27 f?vr. 21:51 log-rwxr-xr-x? 1 cderory 
users??? 6 27 f?vr. 21:51 pcmcia-rwxr-xr-x? 1 cderory users??? 6 27 f?vr. 
21:51 run-rwxr-xr-x? 1 cderory users??? 6 27 f?vr. 21:51 spool
> 
> -rwxr-xr-x? 1 cderory users??? 6 27 f?vr. 21:51 tmp
> As you can see, "cache" is a file, not a directory.
> Am I wrong ?
> Thanks for your help.
> 
> 
> 
> Cyrille DERORY
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at ...
> http://lists.busybox.net/mailman/listinfo/buildroot

Hello,
I've the same problem, have you a solution or some suggestion ?

I run make for a sama5d3 Cortex-A5 target, and I run a 'make clean;make' but 
I got the same error.

Note: all the wrong files (run,lock ..) have the content "../tmp", if I 
remove all those files the next run of make works.

Thanks
Daniele

mkdir /home/daniele/git/buildroot/output/target/usr/share/doc/sudo
mkdir /home/daniele/git/buildroot/output/target/var/run
mkdir: impossibile creare la directory 
"/home/daniele/git/buildroot/output/target/var/run": File gi? esistente
make[2]: *** [install-dirs] Error 1
make[2]: Leaving directory `/home/daniele/git/buildroot/output/build/sudo-
1.8.10p3/plugins/sudoers'
make[1]: *** [install] Error 2
make[1]: Leaving directory `/home/daniele/git/buildroot/output/build/sudo-
1.8.10p3'
make: *** [/home/daniele/git/buildroot/output/build/sudo-
1.8.10p3/.stamp_target_installed] Error 2
