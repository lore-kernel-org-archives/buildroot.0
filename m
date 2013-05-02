From: Peter Faasse <p.faase1@chello.nl>
Date: Thu, 02 May 2013 09:00:49 +0200
Subject: [Buildroot] Smallish rootfs for wm8505 netbook
In-Reply-To: <82bbf577-2fa7-4161-aa47-e18b223fc7be@CO9EHSMHS011.ehs.local>
References: <82bbf577-2fa7-4161-aa47-e18b223fc7be@CO9EHSMHS011.ehs.local>
Message-ID: <3759295.eBGGfacrkH@nc10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

With varying degrees of success, i've been building buildroot based rootfs-s, 
toolchains and kernel images. All part of a hacking project with a few wm8505 
(armv5) based netbooks.

I'm attempting to use buildroot to build a rootfs & kernel that i can use to 
do some native development on the machines. The first set of bugs where no 
doubt caused by my own incompetence and learning curve, but there are one or 
two issues that i think are relevent for a wider audience.

For reference, the target architecture is arm926t; Host is a Slackware-13.37 
x86_64 machine; I'been using both the 2013.02 release of buildroot and the 
git-version as extracted yesterday. I let buildroot itself generate the 
toolchain (no croostool-ng etc..). I did manage to generate a few working 
toolchains, kernel uImages and rootfs.tar images, and i'm in the process of 
generating a fully satisfactory set of target files. But:

1) If i enable c++ support the toolchain, the build of the rootfs will fail 
because of a lack of UCLIBC_HAS_FENV (fenv.h not found). This can easily be 
remedied using make uclibc-menuconfig after configuring buildroot ('Target 
Architecture Features and Options'-->'Enable C99 Floating-point environment'), 
but i think it would make sense if that option is -if possible- automatically 
enabled by activating this uclibc option when c++ support is enabled in 
buildroot itself. 

2) I do include the obsolete 'toolchain on the target'. The resulting gcc on-
target is by default not usable because glibc.so (a linker script it seems) is 
not copied to the on-target directory. This can be remedied by adding *.so to 
the support/scripts/copy.sh, but i'm not quite sure if that has any side-
effects. 

All-in-all i'm having lots of fun with buildroot... :-)

greetings,

Peter Faasse
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130502/ff2ac27c/attachment.asc>
