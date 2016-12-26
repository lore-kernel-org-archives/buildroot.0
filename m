From: Yu-Ting, Kao <jackzzjack@gmail.com>
Date: Mon, 26 Dec 2016 17:07:08 +0800
Subject: [Buildroot] Autobuild reproduction and generation
In-Reply-To: <20161226092127.1c4a40d1@free-electrons.com>
References: <CADZ=QZ=SU7XthdVfaAQpeY7LKJcsOME1zOusWvZAEjs0OpRfZw@mail.gmail.com>
 <20161226092127.1c4a40d1@free-electrons.com>
Message-ID: <CADZ=QZnpVmC_hKqSMFehhdO_m9pZsK0OBcfVd4hXsbvjV==A1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for your reply.

I follow these steps at below:

1. wget command to get br-reproduce-build.
2. prepare a clean buildroot from git repo.
3. modify br-reproduce-build script. At line 6:

       BASE_GIT="${BASE_GIT:-/[MY_CLEAN_BUILDROOT_DIR_PATH]}"

4. Find the issue id that I want to reproduce. For example, "
http://autobuild.buildroot.org/results/358/358e2f02f42e08fe362ecd46e636c0048e77c21f/
<http://autobuild.buildroot.org/results/1d5/1d530863f727a097330be6bce29fe00e148bb587/>"'s
issue id is 358/358e2f02f42e08fe362ecd46e636c0048e77c21f

5. run "./br-reproduce-build 358/358e2f02f42e08fe362ecd46e636c0048e77c21f/"
6. The error log is (Cannot reach to the core of issue)

-------------------------------------------------------------------------------------------------------------------
2016-12-26 16:52:22 (997 KB/s) -
?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/build/.br-i386-pentium4-full-2016.11-236-ge309abf.tar.bz2.UewivN/output?
saved [44346526/44346526]

WARNING: no hash file for br-i386-pentium4-full-2016.11-236-ge309abf.tar.bz2
>>> toolchain-external-custom  Extracting
bzcat
/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/buildroot/dl/br-i386-pentium4-full-2016.11-236-ge309abf.tar.bz2
| tar --strip-components=1 -C
/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/build/toolchain-external-custom
--exclude='usr/lib/locale/*'   -xf -
rm -rf
/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/host/opt/ext-toolchain
mkdir -p
/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/host/opt/ext-toolchain
mv
/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/build/toolchain-external-custom/*
/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/host/opt/ext-toolchain/
>>> toolchain-external-custom  Patching
>>> toolchain-external-custom  Configuring
Cannot execute cross-compiler
'/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/host/opt/ext-toolchain/bin/i686-linux-gcc.br_real'
make[1]: ***
[/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f/output/build/toolchain-external-custom/.stamp_configured]
Error 1
make: *** [_all] Error 2


7. Sometimes may show

----------------------------------------------------------------------------------------------------

--2016-12-26 16:59:07--
http://autobuild.buildroot.org/results/358/358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid
Resolving autobuild.buildroot.org (autobuild.buildroot.org)... 94.23.254.152
Connecting to autobuild.buildroot.org
(autobuild.buildroot.org)|94.23.254.152|:80...
connected.
HTTP request sent, awaiting response... 200 OK
Length: 40 [text/plain]
Saving to:
?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid?

100%[=========================================================================>]
40          --.-K/s   in 0s

2016-12-26 16:59:08 (1.59 MB/s) -
?/home/kao23/disk_2/358e2f02f42e08fe362ecd46e636c0048e77c21f//gitid? saved
[40/40]

fatal: destination path 'buildroot' already exists and is not an empty
directory.
Cannot clone Buildroot Git repository


Thanks !

2016-12-26 16:21 GMT+08:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Mon, 26 Dec 2016 16:15:19 +0800, Yu-Ting Kao wrote:
>
> > I want to contribute some patches for buildroot, and I found autobuild
> > <http://autobuild.buildroot.org/>system
> > ?that can find bugs at commit early stage.?
> >
> > 1. How can I run this random build script and send it to autobuild
> system ?
>
> The script that runs on the autobuilder build machines is available in
> the Git repository at https://git.buildroot.org/buildroot-test/, in
> scripts/autobuild-run.
>
> In order to submit your build results to autobuild.b.o, you need an
> account, which I can create. But before that, you should run the script
> standalone for a day or two, look at the generated build results to see
> if there isn't anything obviously wrong (i.e not a real build failure,
> but a build failure due to your installation).
>
> > 2. How can I reproduce the issue which are posted at autobuild system ?
> >     All I know is that, copy the config file and build code manually. The
> > br-reproduce-build script seems not work normally.
>
> I use the br-reproduce-build script and it works fine for me. Could you
> be more specific about the issues you've encountered?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161226/86d88479/attachment.html>
