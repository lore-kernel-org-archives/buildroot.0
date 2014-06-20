From: Heiko Abraham <abrahamh@web.de>
Date: Fri, 20 Jun 2014 10:15:23 +0200
Subject: [Buildroot] [RFC] FIT image support
Message-ID: <020ED860-5D2B-4035-8799-5B8189C66BDC@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Thu, 19 Jun 2014 17:38:16 +0200, Yegor Yefremov wrote:
> What would be the best approach to support FIT images, i.e. kernel
> image + DTB + initramfs in one file?

FIT-Images can be complex. See uboot documentation. You need your your own *.its file 
(match requirements like sign, hash, configs). Note that your uboot config must enable 
the required features, like CONFIG_FIT_SIGNATURE, CONFIG_RSA, ...

My approach is:
- add own patch for uboot to enable FIT-image support for target
- create your own *.its file  (with sections for kernel, dtb and ramdisk)
- use the buildroot post-script to create the FIT-image (using uboot-mkimage) 

Heiko
