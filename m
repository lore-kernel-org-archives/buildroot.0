From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 21:03:22 +0100
Subject: [Buildroot] [PATCH 07/16] busybox: move udhcp script from
 skeleton to package
In-Reply-To: <87ei9mk1q2.fsf@macbook.be.48ers.dk>
References: <1291888514-31385-1-git-send-email-llandwerlin@gmail.com>
	<1291888514-31385-8-git-send-email-llandwerlin@gmail.com>
	<87ei9mk1q2.fsf@macbook.be.48ers.dk>
Message-ID: <20101213210322.4d218d38@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Dec 2010 00:31:17 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:

> We have a number of (somewhat) different default.script files in the
> skeletons:
>  find -name default.script|xargs md5sum|sort 
> 07e9a6d08f1cb076af6f54f1f69b76e2  ./Atmel/atngw100/target_skeleton/usr/share/udhcpc/default.script
> 07e9a6d08f1cb076af6f54f1f69b76e2  ./Atmel/atstk1005/target_skeleton/usr/share/udhcpc/default.script
> 07e9a6d08f1cb076af6f54f1f69b76e2  ./Atmel/atstk100x/target_skeleton/usr/share/udhcpc/default.script
> 0869726c3fdd7a10f9ea5b368a9474a0  ./Atmel/root/target_skeleton/usr/share/udhcpc/default.script
> 33cc63bd3d159030a849105e719d0592  ./KwikByte/kb9202/target_skeleton/usr/share/udhcpc/default.script
> f5b6d601ced4aad0e6de650234200381  ./valka/target_skeleton/usr/share/udhcpc/default.script
> 
> So I prefer to only install if the skeleton hasn't defined a custom one
> like we do elsewhere.

FWIW, my boards-cleanup branch gets rid of all those redundant
skeletons.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
