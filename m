From: Ted Salazar <Ted.Salazar@maximintegrated.com>
Date: Thu, 28 May 2015 19:42:37 -0700
Subject: [Buildroot] installing custom library and hello world
Message-ID: <B03A893ADFE80748942D13AFAF28451924E723F110@ITSVLEX06.it.maxim-ic.internal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wow! Mainline BuildRoot is much easier than manually building the at91bootstrap, uboot and kernel as you guys said.



Thanks so much for all your past help and guiding me to mainline BuildRoot.



I only have four more tasks, listed below, to complete my part of this project. I will be reading documentation on how to do these last tasks. So far I have found the following documents related to these tasks. If you know of any other documentation I should be reading to accomplish this please let me know. I am using the ubifs.


http://buildroot.uclibc.org/downloads/manual/manual.html#adding-packages

 http://armbedded.eu/node/318



Open Tasks:

17.          Add custom IC SPI/I2C adaptation layer => TODO

18.          Install custom IC host library in userland leveraging the /dev/spiX device file to communicate => TODO

19.          Compile an example hello world program to run on the Terminal after EK Board boot up => TODO

20.          Compile a simple custom application to run on the Terminal after EK Board boot up => TODO





[cid:image001.png at 01D0997D.06775530]





Thank you,

Ted



-----Original Message-----
From: Alexandre Belloni [mailto:alexandre.belloni at free-electrons.com]
Sent: Wednesday, May 27, 2015 2:58 AM
To: Ted Salazar
Cc: buildroot at busybox.net
Subject: Re: [Buildroot] Newbie help, AT91sam9x25 patch Installation Questions



Hi,



On 26/05/2015 at 23:58:17 -0700, Ted Salazar wrote :

> To all you patch experts...Just curious why the BuildRoot manual checksout a branch to patch instead a tag? The newest branch is 2013.xx but the newest stable tag is 2015.02, which is what I want. Also, don't I need to add a patch command at the end of those two commands as well? Something like $ patch < hello.patch ?

>

> 21.3.1. Applying Patches from Patchwork The main use of Buildroot?s

> Patchwork website for a developer is for pulling in patches into their local git repository for testing purposes.

>

> When browsing patches in the patchwork management interface, an mbox link is provided at the top of the page. Copy this link address and run the following commands:

>

> $ git checkout -b <test-branch-name>

> $ wget -O - <mbox-url> | git am

>

> I hope to get your life saving patches installed tomorrow.

>



Use:



git clone git://git.buildroot.net/buildroot git checkout 2015.02 wget -O - http://patchwork.ozlabs.org/patch/473928/mbox/ | git am wget -O - http://patchwork.ozlabs.org/patch/473935/mbox/ | git am make at91sam9x5ek_defconfig make



Those are step by step instructions but like I already said, you should probably read more documentation or get a training.



--

Alexandre Belloni, Free Electrons

Embedded Linux, Kernel and Android engineering http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150528/6449d1ec/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.png
Type: image/png
Size: 52288 bytes
Desc: image001.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150528/6449d1ec/attachment-0001.png>
