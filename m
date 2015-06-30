From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 16:48:14 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1
In-Reply-To: <1313674444.2327407.1435171914537.JavaMail.zimbra@datacom.ind.br>
References: <1434995939-8236-1-git-send-email-george.redivo@datacom.ind.br>
 <CANQCQpYy-kuZLfMjO0YrX8Kfa25eLUa09U-NUyOSQjxE0vq5WA@mail.gmail.com>
 <1313674444.2327407.1435171914537.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20150630164814.3d7c2bdc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear George Redivo,

On Wed, 24 Jun 2015 15:51:54 -0300 (BRT), George Redivo wrote:

> I looked to the ola's Config.in file and there is no powerpc dependency declared in there. 
> So I'm not sure if it's valid to try to make a build to powerpc arch including this package. Is it? 

I think Peter added || BR2_powerpc in ola/Config.in. The ola package
itself does not have any architecture dependency, it only has such
dependencies because it selects protobuf. So if protobuf now supports
PowerPC, then it should also be possible to build Ola.

And anyway, the error reported by Peter occurred during the build of
protobuf itself, so Ola is not relevant here.

> Anyway, I tried to reproduce the reported error by adding those flags in my .config file. 
> In addition, I removed BR2_powerpc_8548=y, that was declared. 
> 
> I ran make olddefconfig and the .config changed. 
> The BR2_PACKAGE_OLA flag simply dropped out from the .config file. 
> 
> May you send me your entire .config after running make olddefconfig please? 

Just do:

$ cat > .config <<EOF
BR2_powerpc=y
BR2_powerpc_603e=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_OLA=y
EOF

and then:

$ make olddefconfig
$ make

As explained by Peter.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
