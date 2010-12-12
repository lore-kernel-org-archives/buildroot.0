From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Dec 2010 00:31:17 +0100
Subject: [Buildroot] [PATCH 07/16] busybox: move udhcp script from
	skeleton to package
In-Reply-To: <1291888514-31385-8-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Thu, 9 Dec 2010 10:55:05 +0100")
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
	<1291888514-31385-8-git-send-email-llandwerlin@gmail.com>
Message-ID: <87ei9mk1q2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Since udhcpc is part of busybox, it seems logical to move the udhcpc
 llandwerlin> script from skeleton to busybox.

We have a number of (somewhat) different default.script files in the
skeletons:
 find -name default.script|xargs md5sum|sort 
07e9a6d08f1cb076af6f54f1f69b76e2  ./Atmel/atngw100/target_skeleton/usr/share/udhcpc/default.script
07e9a6d08f1cb076af6f54f1f69b76e2  ./Atmel/atstk1005/target_skeleton/usr/share/udhcpc/default.script
07e9a6d08f1cb076af6f54f1f69b76e2  ./Atmel/atstk100x/target_skeleton/usr/share/udhcpc/default.script
0869726c3fdd7a10f9ea5b368a9474a0  ./Atmel/root/target_skeleton/usr/share/udhcpc/default.script
33cc63bd3d159030a849105e719d0592  ./KwikByte/kb9202/target_skeleton/usr/share/udhcpc/default.script
f5b6d601ced4aad0e6de650234200381  ./valka/target_skeleton/usr/share/udhcpc/default.script

So I prefer to only install if the skeleton hasn't defined a custom one
like we do elsewhere.

-- 
Bye, Peter Korsgaard
