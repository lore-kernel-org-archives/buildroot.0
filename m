From: mathew.benson <mathew.benson@gmail.com>
Date: Thu, 24 Dec 2015 18:41:20 -0600
Subject: [Buildroot] Newbie boot and fs mount question
Message-ID: <xhil9lfqrw7lfuimhph55cv6.1451004080389@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Got it working. ?Thanks.


Sent via the Samsung Galaxy S? 6, an AT&T 4G LTE smartphone-------- Original message --------From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com> Date: 12/24/2015  1:30 AM  (GMT-06:00) To: Mathew Benson <mathew.benson@gmail.com> Cc: buildroot at busybox.net Subject: Re: [Buildroot] Newbie boot and fs mount question 
Dear Mathew Benson,

On Wed, 23 Dec 2015 19:04:05 -0600, Mathew Benson wrote:

> I have a possible dumb question.? I enabled initrd to be linked into
> the kernel, thinking boot time might be faster.? I enabled the
> "remount filesystem" option, thinking that would remount it from the
> hard drive rather than the linked in rootfs.? Is that an incorrect
> assumption?

Yes, it is an incorrect assumption. In Buildroot, if you enable
"initial RAM filesystem linked into linux kernel", then the entire
root filesystem lives in RAM, and we never switch to another on-storage
filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151224/62d7089c/attachment.html>
