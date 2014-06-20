From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 20 Jun 2014 10:20:22 +0200
Subject: [Buildroot] [RFC] FIT image support
In-Reply-To: <020ED860-5D2B-4035-8799-5B8189C66BDC@web.de>
References: <020ED860-5D2B-4035-8799-5B8189C66BDC@web.de>
Message-ID: <CAGm1_kvET0AiTk1uXsHD--jB6oOA7-CSWbZau4u67Tgot3sDnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 20, 2014 at 10:15 AM, Heiko Abraham <abrahamh@web.de> wrote:
> Hi Yegor,
>
> On Thu, 19 Jun 2014 17:38:16 +0200, Yegor Yefremov wrote:
>> What would be the best approach to support FIT images, i.e. kernel
>> image + DTB + initramfs in one file?
>
> FIT-Images can be complex. See uboot documentation. You need your your own *.its file
> (match requirements like sign, hash, configs). Note that your uboot config must enable
> the required features, like CONFIG_FIT_SIGNATURE, CONFIG_RSA, ...
>
> My approach is:
> - add own patch for uboot to enable FIT-image support for target
> - create your own *.its file  (with sections for kernel, dtb and ramdisk)
> - use the buildroot post-script to create the FIT-image (using uboot-mkimage)

My plan was to add an option, just like for DTB, where I can refernce
my own its file. The purpose is to omit the creation of own post-build
script. U-Boot configuration and *.its content (complexity doesn't
matter in this case) is in user responsibility, I don't know, if BR
can help here.

Yegor
