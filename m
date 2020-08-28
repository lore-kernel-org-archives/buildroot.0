From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 22:38:42 +0200
Subject: [Buildroot] Unable to bake in an initramfs filesystem into
 kernel image
In-Reply-To: <313ae7e3-1817-e633-acc3-6d7097f99ffc@mind.be> (Arnout
 Vandecappelle's message of "Fri, 28 Aug 2020 09:28:33 +0200")
References: <CAG+zT3rM=eaW6oykBgiVdPd4fnZF=efbgBok6Q8WCy2QQ2EnDw@mail.gmail.com>
 <313ae7e3-1817-e633-acc3-6d7097f99ffc@mind.be>
Message-ID: <87sgc6ld4d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> so not sure what is going on here. Do I need to pass in a kernel command
 >> line to make sure the kernel reads the initramfs from the one baked in?

 >  Nope, it should automatically do that. However, it is possible that the
 > embedded initramfs is ignored if your bootloader provides one, so make sure the
 > initramfs argument of uboot's boot command is not set.


 >  I've taken a quick look at the history since 2016.10 and I didn't find anything
 > that would fix such an issue.

 >  That said, we don't have a runtime test of this feature, so it might even be
 > broken...

FYI, I've just tested the initramfs support on current master (on an ARM
platform) and it works as expected.

-- 
Bye, Peter Korsgaard
