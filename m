From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 12:21:21 +0200
Subject: [Buildroot] Some files to be copied to root file systems such
 as openvpn keys, conf
In-Reply-To: <CAMm5YqpZ1dV02==G=ZHEc3NUFD5UHGrUq7yTEzLQODQh1YfetQ@mail.gmail.com>
References: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
 <CAHXCMMJsvZUPqtFwtKC=ZgSiNmwJ0A3_MYn=Fn0hbgi9iiz8Zg@mail.gmail.com>
 <CAMm5YqotyZ9y6c3vFXME+rh860RiB1X0RUFE=10k40yrzbM+fg@mail.gmail.com>
 <CAMm5YqpZ1dV02==G=ZHEc3NUFD5UHGrUq7yTEzLQODQh1YfetQ@mail.gmail.com>
Message-ID: <20140610122121.27bfb286@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Jun 2014 11:53:36 +0200, cem akpolat wrote:

> The way that you explained is quite logical, however, I want to ask at that
> point what is the main reason behind the creation of the "Root Overlay",
> because for all packages and files , it is clearly seen that your defined
> method will work. for instance I can easily create a package called
> "toBeInstalledToRootFs" and then put all of them under this folder along
> with an appropriate Makefile.

The reason for having the "rootfs overlay" feature was simply to
factorize what a lot of people were doing in their post-build script:
copy a entire overlay of files to $(TARGET_DIR). Just like the
post-build script, it may not address *all* use-cases, but it certainly
address a good number of use cases.

I believe you can continue to use the rootfs overlay mechanism to copy
your files, and set use a custom permission table to adjust their
permission when the root filesystem image is created. It's probably
better than creating a complete package just for your files.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
