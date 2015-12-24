From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 11:12:25 +0100
Subject: [Buildroot] [PATCH] package/qt: disable Qt GUI module for CS
 NiosII toolchain
In-Reply-To: <CANLo3Jih8-QwatDhqeqYcy1G2_2ank2am2LbKWmERpVS1DNtqA@mail.gmail.com>
References: <1450911817-12589-1-git-send-email-romain.naour@gmail.com>
 <20151224083849.381556a9@free-electrons.com>
 <CANLo3JgDh9HBs82x_QoK-ZDTuhP=XTkYKvSMfj34tXRnaQgVyQ@mail.gmail.com>
 <20151224091911.5380637c@free-electrons.com>
 <CANLo3Jih8-QwatDhqeqYcy1G2_2ank2am2LbKWmERpVS1DNtqA@mail.gmail.com>
Message-ID: <20151224111225.24c62183@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 24 Dec 2015 09:36:57 +0100, Romain Naour wrote:

> I think this patch is ok as is because we black list Qt GUI only with the
> CS toolchain and there is nothing we can do to fix the issue.
> I will see latter if I found a Binutils patch for it, if not report the
> issue.

Well, since the problem also affects nios2 internal toolchains, I
believe the dependencies should be !BR2_nios2, of course unless you
find an existing binutils patch to fix the problem. But if you don't,
then we will have to exclude nios2 entirely.

To be honest, the likeliness of having people using Qt GUI on nios2 is
very small, if not zero. So we shouldn't care too much about this IMO.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
