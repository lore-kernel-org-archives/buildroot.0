From: Anmol Sarma <unmole.in@gmail.com>
Date: Thu, 2 Jan 2014 16:58:32 +0530
Subject: [Buildroot] Generating Buildroot compatible kernel tarball from
	Git
In-Reply-To: <CAP0ktjJR9UYxM2RuHUgTMWYu7vx2+V-yN31uhScLT53oZAYt4g@mail.gmail.com>
References: <CAP0ktjJR9UYxM2RuHUgTMWYu7vx2+V-yN31uhScLT53oZAYt4g@mail.gmail.com>
Message-ID: <CAP0ktjKKsvyH2GB_c=SJ4zKNwa+xOOYRo9KdhycFtNX=crVtVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to modify the default configuration for BeagleBone to use a
custom tarball instead of a Git tree. I generated a tarball using:

git archive bb | bzip2 > linux-3.8.13.tar.bz2

and modified the defconfig to use the custom tarball but the build fails at
'linux custom Configuring' stage with:
cp "board/beaglebone/linux-3.8.config"
/home/anmol/Code/buildroot-2013.11/output/build/linux-custom/arch/arm/configs/buildroot_defconfig
cp: cannot create regular file
?/home/anmol/Code/buildroot-2013.11/output/build/linux-custom/arch/arm/configs/buildroot_defconfig?:
No such file or directory

I can manually build the kernel by extracting the tarball. I
tried exporting a tarball from the vanilla kennel tree and Buildroot failed
with the same result. What am I doing wrong here?

P.S. Uploaded custom tarball here:
https://www.dropbox.com/s/34wrav0nm24gp27/linux-3.8.13.tar.bz2



On Thu, Jan 2, 2014 at 4:51 PM, Anmol Sarma <unmole.in@gmail.com> wrote:

> I am trying to modify the default configuration for beaglebone to use a
> custom tarball instead of a Git tree. I generated a tarball using:
>
> git archive bb | bzip2 > linux-3.8.13.tar.bz2
> --
> Anmol Sarma
>
>


-- 
Anmol Sarma
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140102/6a564434/attachment.html>
