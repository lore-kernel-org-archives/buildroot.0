From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 07:27:56 +0100
Subject: [Buildroot] Support for Atmel SAMA5D4 EK
In-Reply-To: <2FB1B3AE3B157348A234DA96A19CAB72DC300418@DVRMBX01.corp.atmel.com>
References: <2FB1B3AE3B157348A234DA96A19CAB72DC300418@DVRMBX01.corp.atmel.com>
Message-ID: <20150313072756.1a28cd2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Mar 2015 21:47:25 +0000, Gurumani, Swapna wrote:

> I made modifications to sama5d3_defconfig to support atmel's sama5d4-EK Evaluation kit.
> Here is a link to Atmel's buildroot github where youc an find sama5d3_defconfig:
> https://github.com/linux4sam/buildroot-at91
> 
> Please find attached the defconfig file for sama5d4.
> I am trying to follow instructions provided her to create a patch:
> http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot
> 
> But this won't create a patch. Please let me know how to provide a patch. Basically when I type "git format-patch -M -n -s -o outgoing origin/master", nothing happens.

Because you didn't do a git commit.

Also, your file is a full .config file, while defconfig have to be
minimal configuration files.

So basically, you have do:

  1/ make savedefconfig
  2/ mv defconfig configs/sama5d4ek_defconfig
  3/ git add configs/sama5d4ek_defconfig
  4/ git commit -s
  5/ git format-patch ...

Note that my colleague Alexandre Belloni has anyway planned to do a
refresh of all the Atmel defconfig in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
