From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Dec 2016 10:16:59 +0100
Subject: [Buildroot] Autobuild reproduction and generation
In-Reply-To: <CADZ=QZnpVmC_hKqSMFehhdO_m9pZsK0OBcfVd4hXsbvjV==A1g@mail.gmail.com>
References: <CADZ=QZ=SU7XthdVfaAQpeY7LKJcsOME1zOusWvZAEjs0OpRfZw@mail.gmail.com>
 <20161226092127.1c4a40d1@free-electrons.com>
 <CADZ=QZnpVmC_hKqSMFehhdO_m9pZsK0OBcfVd4hXsbvjV==A1g@mail.gmail.com>
Message-ID: <20161226101659.57238bc6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Dec 2016 17:07:08 +0800, Yu-Ting, Kao wrote:

> 2016-12-26 16:52:22 (997 KB/s) -
> ?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/build/.br-i386-pentium4-full-2016.11-236-ge309abf.tar.bz2.UewivN/output?
> saved [44346526/44346526]
> 
> WARNING: no hash file for br-i386-pentium4-full-2016.11-236-ge309abf.tar.bz2
> >>> toolchain-external-custom  Extracting  
> bzcat
> /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/buildroot/dl/br-i386-pentium4-full-2016.11-236-ge309abf.tar.bz2
> | tar --strip-components=1 -C
> /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/build/toolchain-external-custom
> --exclude='usr/lib/locale/*'   -xf -
> rm -rf
> /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/host/opt/ext-toolchain
> mkdir -p
> /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/host/opt/ext-toolchain
> mv
> /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/build/toolchain-external-custom/*
> /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/host/opt/ext-toolchain/
> >>> toolchain-external-custom  Patching
> >>> toolchain-external-custom  Configuring  
> Cannot execute cross-compiler
> '/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/host/opt/ext-toolchain/bin/i686-linux-gcc.br_real'
> make[1]: ***
> [/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/build/toolchain-external-custom/.stamp_configured]
> Error 1
> make: *** [_all] Error 2

This one is because for some reason the pre-built toolchain doesn't
work for you. Please
run ./output/host/opt/ext-toolchain/bin/i686-linux-gcc manually to see
what is the error message.

> 7. Sometimes may show
> 
> ----------------------------------------------------------------------------------------------------
> 
> --2016-12-26 16:59:07--
> http://autobuild.buildroot.org/results/358/358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid
> Resolving autobuild.buildroot.org (autobuild.buildroot.org)... 94.23.254.152
> Connecting to autobuild.buildroot.org
> (autobuild.buildroot.org)|94.23.254.152|:80...
> connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 40 [text/plain]
> Saving to:
> ?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid?
> 
> 100%[=========================================================================>]  
> 40          --.-K/s   in 0s
> 
> 2016-12-26 16:59:08 (1.59 MB/s) -
> ?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid? saved
> [40/40]
> 
> fatal: destination path 'buildroot' already exists and is not an empty
> directory.
> Cannot clone Buildroot Git repository

You have already tried to build this same build id, so Buildroot has
already been cloned. The script is not prepared for that, it assumes
you build only once a given build id. If you want to build it two time,
you are supposed to
remove /home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/
between the two builds.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
