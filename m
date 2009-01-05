From: Quick X <quickx@hotmail.com>
Date: Mon, 5 Jan 2009 15:11:31 -0800
Subject: [Buildroot] Buildroot Not Using Saved Config for Linux
Message-ID: <BAY124-W25B0802FB150D5566BD194D2E10@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I can't get buildroot to use the "local\MYPROJECT\linux-2.6.24.3.config" file no matter what.  It always uses the "project_build_arm/at91sam9261ek/linux-2.6.24.3/.config" file, or creates a new one if it doesn't exsist.
 
Steps I do to test:
make linux26-menuconfig
make saveconfig
make linux26-menuconfig (EDIT SOMETHING ELSE)
make BOARD=MYPROJECT
 
The (EDIT SOMETHING ELSE) changes are used, not the config that was saved.  Even if I delete the "project_build_arm/at91sam9261ek/linux-2.6.24.3/.config" it just creates a new one, asking questions during the build process, instead of using the one located in the local directory.  Same result if I delete everything and grab a new buildroot with svn, and then copy the "local" directory to it and issue the following:
make menuconfig
make BOARD=MYPROJECT
 
 
I'm using a Kubuntu 8.10 machine.  The "MYPROJECT.config" defines the ".//local/at91sam9261ek/linux-2.6.24.3.config" as the linux config after a "make saveconfig".  AKA: BR2_PACKAGE_LINUX_KCONFIG=".//local/at91sam9261ek/linux-2.6.24.3.config"
 
I'm unsure if this matters but the "BR2_PACKAGE_LINUX_KCONFIG" is usally defined in the middle of the .config file and after a "make saveconfig" it's defined at the very botton of the .config file.  I've tired using: BR2_PACKAGE_LINUX_KCONFIG="./local/at91sam9261ek/linux-2.6.24.3.config" (AKA changing the ".//" to "./") and it doesn't fix the problem.
 
Small thing since it's easy to issue a "cp local\MYPROJECT\linux-2.6.24.3.config project_build_arm\MYPROJECT\linux-2.6.24.3\.config" command before building if I think it's needed, which builds fine.  Am I using the "make saveconfig" & "make BOARD=MYPROJECT" incorrectly?
_________________________________________________________________
Keep in touch and up to date with friends and family. Make the connection now.
http://www.microsoft.com/windows/windowslive/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090105/6c75c81d/attachment.htm 
