From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Mar 2016 09:42:23 +0100
Subject: [Buildroot] Autobuilder update
In-Reply-To: <E1aeFbm-0004jE-Q7@fli4l.lan.fli4l>
References: <20160310234742.3df6dff2@free-electrons.com>
 <E1aeFbm-0004jE-Q7@fli4l.lan.fli4l>
Message-ID: <20160311094223.6b433df0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Mar 2016 06:27:30 +0100, Bernd Kuhls wrote:

> do we have a config for a buildroot x86 toolchain which lacks
> BR2_X86_CPU_HAS_MMX? An empty defconfig file would be enough imho, the one
> you get when you call "make menuconfig" in a fresh git checkout without
> selecting anything and save this config, like: 
> 
> bernd at buildroot:~/buildroot/buildroot$ make menuconfig
> (select nothing, just save the config)
> bernd at buildroot:~/buildroot/buildroot$ make savedefconfig
> BR2_DEFCONFIG=test cat test
> bernd at buildroot:~/buildroot/buildroot$ cat test
> bernd at buildroot:~/buildroot/buildroot$ 
> 
> I think such a config would be useful because lots of media packages
> contain mmx specific code. 

By default we use i586, right? So what you suggest is an i586 defconfig?

Now we have two options:

 - Use an internal toolchain configuration, which means that the
   toolchain is rebuilt everytime, and when we want on our side to
   reproduce the build failures, we also have to rebuild the toolchain.

 - Use a pre-built external toolchain.

I'm leaning twoards the second option. What do you think?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
