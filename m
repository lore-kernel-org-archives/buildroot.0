From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Sep 2013 09:28:11 +0200
Subject: [Buildroot] Am I using hardware floating? (CodeBench)
In-Reply-To: <20130922151840.GA2804@zuhnb712>
References: <20130921152445.GA9629@zuhnb712> <20130922103729.10b54416@skate>
 <20130922151840.GA2804@zuhnb712>
Message-ID: <20130923092811.0ac82091@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Sun, 22 Sep 2013 23:18:40 +0800, Woody Wu wrote:

> Okay, understand.  For software floating, I know there are two ways,
> one is to generating an interrupt every time a floating instruction is
> executed, which is very slow. And, another way is let the compiler to
> convert all floating calculation to a function call which implemented
> in a floating library, this method is a little faster than the
> former. My compiler is CodeBench from BR, does it have this feature
> and has it already enabled?  Thank you very much.

Yes, the Sourcery CodeBench toolchain for ARM uses soft-float for its
ARMv5 multilib variant, which gets used if you select the arm926
processor type in Buildroot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
