From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 9 Feb 2007 20:29:54 +0100
Subject: [Buildroot] [PATCH] at45-split (2/3)1
References: <Zbq64Q2XcDDN.vTjBx34D@mailout.dof.se>
	<20070209165804.GR12488@aon.at>
Message-ID: <00a001c74c80$b6b664c0$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>
>>Thanks and sorry for the delay.
>>
>>PS: I'm aware of your Board support builddir patch, that i didn't look
>>at yet, are there any other pending patches i managed to miss?
>>

There is actually one more.
The "local" patch.

Eric NAK'ed this patch, due to "duplication" with "package/customize"
so I reworked the patch by removing "package/customize"
and putting the functionality into the "local" directory.

For maintenance reasons, I find it important that this stuff is in at the 
top level.
The "local" directory is a place holder for the users
packages/ which he/she never plans to submit to
the mainstream, and it is just a pain to have it
inside the package directory.

Once the patch is there, you can download the latest version
and then copy your own local directory into the buildroot tree.
This will replace the contencts of the "local" directory
and you do not have to patch toplevel Makefile or Config.in.
(A symbolic link from "local" to an out of tree directory will also do)

If you read the comments from everyone but Eric,
I think you find that everyone else is positive to the patch.
I have had several off-line mails from people that support the idea.


The patch will also update the /etc/hostname
from the BR2_BOARDNAME in the BSP patch.
(Maybe it shodul change name to BR2_HOSTNAME?)
and allow the developer to provide his/her own welcome banner.


Best Regards
Ulf Samuelsson
