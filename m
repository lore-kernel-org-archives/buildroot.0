From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 12 Jul 2011 22:59:13 +0200
Subject: [Buildroot] how BR download the linux kernel now
In-Reply-To: <CAAa76NT59eY9Kbhej2vyk23GBP-ofu5FyApsnHpsgHvSLzZaNQ@mail.gmail.com>
References: <CAAa76NT59eY9Kbhej2vyk23GBP-ofu5FyApsnHpsgHvSLzZaNQ@mail.gmail.com>
Message-ID: <201107122259.14014.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Raymond, All,

On Tuesday 12 July 2011 22:26:49 raymond zhao wrote:
> I checked out the latest version of the buildroot, and noticed that
> the linux.mk was changed a lot. Thomas checked in a version with log
> message "linux: convert to the GENTARGETS infrastructure". And, from
> there, I am confused. How the BR download the linux kernel now? I
> mean, before this version, there are download, extraction and patch.
> But they are removed and there is only LINUX_DOWNLOAD_PATCHES in the
> new version. Where is the script for BR to download the kernel source
> code now?

In a word, it's automagic, now! :-)

In a hundred words, look at linux/linux.mk:

- on line 9-28, we set the two variables LINUX_SITE and LINUX_TARBALL
  depending on the user's options
- on line 180, we call GENTARGETS that generates all the reuired rules

- the variable LINUX_SITE tells where the kernel is to be get from
- the variable LINUX_TARBALL tells the tarball's file name
- the function GENTARGETS instantiates download+extract+build+install rules
  for the specified package

GENTARGETS is defined in package/Makefile.package.in
It's the basis for the generic package infrastructure. It's a bit complex,
but that Makefile is rather pretty well commented. Also, you can have a
look at the doc:
  http://buildroot.org/buildroot.html#add_packages
  http://buildroot.org/buildroot.html#generic-reference

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110712/75eb5552/attachment.html>
