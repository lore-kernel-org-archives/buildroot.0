From: Divick Kishore <divick.kishore@gmail.com>
Date: Sun, 9 Jan 2011 17:57:44 +0530
Subject: [Buildroot] Linux kernel boot stops after NFS mount
In-Reply-To: <20110109101957.4359476c@surf>
References: <AANLkTikz=zS_a315fwc=F+iUL=j2P43bTi8CeJPuoHG3@mail.gmail.com>
	<4D286E5A.1010209@sensortherm.de>
	<AANLkTingWO1X3b7dgBqh5FVM7q9oxAtyaOHP-J0WnpS-@mail.gmail.com>
	<20110108190821.59d08d47@surf>
	<AANLkTikt7LVDGtr9LD2-eQodYYJyvUPWN7ow=METPXW7@mail.gmail.com>
	<20110109101957.4359476c@surf>
Message-ID: <AANLkTi=viPrv-zO3YJKSj1yE8L9pBvvS_1T05rv_jhDi@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Yep, your kernel needs to support EABI. Buildroot ensure that it is the
> case when Buildroot is in charge of building the kernel, but when the
> kernel is built separatly, there's nothing Buildroot can do, except
> relying on the user knowledge.

Yeah you are right. Since I was just using the same config for kernel
provided by my h/w vendor for an older kernel which had EABI disabled,
I just overlooked it.

> You have enabled BR2_PACKAGE_SYSVINIT, so the init being used is the
> traditional SysV init, and not Busybox init. And our default inittab
> only works well with Busybox init (which is the standard setup for a
> Buildroot system).

Hmmm. I removed this and now I don't get those error messages.

> So, two solutions :
>
> ?1) Unless you have strong reasons not to use Busybox init, I would
> ? ?recommend using it by disabling BR2_PACKAGE_SYSVINIT.
>
> ?2) If you really need to use SysV init, then you should use the Git
> ? ?version of Buildroot, or at least merge
> ? ?http://git.buildroot.net/buildroot/commit/?id=7e2bf63080cc0011c84ee46ee2aba161569154c5
> ? ?into your Buildroot version. This commit adds an inittab that works
> ? ?well with SysV init.

Busybox init is good enough for me. I unknowingly selected sysVinit.


Thank you all for you help,
Regards,
DivKis
