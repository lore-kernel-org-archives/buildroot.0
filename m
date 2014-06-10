From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 12:23:10 +0200
Subject: [Buildroot] Some files to be copied to root file systems such
 as openvpn keys, conf
In-Reply-To: <CAHXCMM+8D+waazrj2S6sU=T5y=3JjGD6A_=veV-zk548_uO-Dg@mail.gmail.com>
References: <CAMm5YqqvikddPNUdaj9t6pPFJXqcmQkDR3qFHfi8Uot1wVHgPg@mail.gmail.com>
 <CAHXCMMJsvZUPqtFwtKC=ZgSiNmwJ0A3_MYn=Fn0hbgi9iiz8Zg@mail.gmail.com>
 <CAMm5YqotyZ9y6c3vFXME+rh860RiB1X0RUFE=10k40yrzbM+fg@mail.gmail.com>
 <CAMm5YqpZ1dV02==G=ZHEc3NUFD5UHGrUq7yTEzLQODQh1YfetQ@mail.gmail.com>
 <CAHXCMM+8D+waazrj2S6sU=T5y=3JjGD6A_=veV-zk548_uO-Dg@mail.gmail.com>
Message-ID: <20140610122310.0c3caa20@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Tue, 10 Jun 2014 12:06:44 +0200, Samuel Martin wrote:

> AFAIK, there is no way to set permissions on files outside a package's
> *.mk files :-(

Huh? I guess you should have a look at the BR2_ROOTFS_DEVICE_TABLE
option then. It is precisely meant to allow that: set file permissions.

I know the name of the option is not really appropriate (we kept it as
is for backward compatibility reasons), but the prompt and description
are pretty clear:

config BR2_ROOTFS_DEVICE_TABLE
        string "Path to the permission tables"
        default "system/device_table.txt"
        help
          Specify a space-separated list of permission table locations,
          that will be passed to the makedevs utility to assign
          correct owners and permissions on various files in the
          target filesystem.

          See package/makedevs/README for details on the usage and
          syntax of these files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
