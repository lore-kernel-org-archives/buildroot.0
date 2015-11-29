From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 09:28:11 +0100
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <CANu7NGvmMFc9xADTq_ES7h=13LcnLH5yYJO9KV+8mSYSB-VVtg@mail.gmail.com>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
 <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
 <20151128192022.6bc8d7fd@free-electrons.com>
 <CANu7NGvmMFc9xADTq_ES7h=13LcnLH5yYJO9KV+8mSYSB-VVtg@mail.gmail.com>
Message-ID: <20151129092811.0d05dabd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Nov 2015 18:42:37 -0200, Sergio Prado wrote:
> Instead of making each package that needs 'sys/queue.h' select this
> package, it would be better to select this package automatically when a
> musl toolchain is used. That way, we won't need to change any package.
> 
> It is possible to do that?

Well, we could probably put this logic in the toolchain virtual
package, since it is the common point between the internal toolchain
and external toolchain backends (and we need sys/queue.h in both cases).

However, I am not sure if I wouldn't prefer packages that need
sys/queue.h to have an explicit dependency on the package installing
sys/queue.h. Since such package would itself have no dependency, it
would be just a matter of adding "select BR2_PACKAGE_SYS_QUEUE" in
Config.in and adding "sys-queue" in <pkg>_DEPENDENCIES.

Peter, Arnout, Yann, your opinion?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
