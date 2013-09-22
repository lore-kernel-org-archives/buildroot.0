From: Woody Wu <narkewoody@gmail.com>
Date: Sun, 22 Sep 2013 23:18:40 +0800
Subject: [Buildroot] Am I using hardware floating? (CodeBench)
In-Reply-To: <20130922103729.10b54416@skate>
References: <20130921152445.GA9629@zuhnb712>
 <20130922103729.10b54416@skate>
Message-ID: <20130922151840.GA2804@zuhnb712>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 22, 2013 at 10:37:29AM +0200, Thomas Petazzoni wrote:
> Dear Woody Wu,
> 
> On Sat, 21 Sep 2013 23:24:45 +0800, Woody Wu wrote:
> 
> > The toolchain I selected is codebench from buildroot. CPU is ARM
> > s3c2416. I want to know what kind of floating method is used in my
> > system. Does this related to BR?
> 
> The S3C2416 is an ARM926, and it does not have a floating point unit,
> so your only solution is to use software floating point on this
> platform.
> 
> Thomas

Okay, understand.  For software floating, I know there are two ways, one
is to generating an interrupt every time a floating instruction is
executed, which is very slow. And, another way is let the compiler to
convert all floating calculation to a function call which implemented in
a floating library, this method is a little faster than the former. My
compiler is CodeBench from BR, does it have this feature and has it
already enabled?  Thank you very much.

> -- 
> Thomas Petazzoni, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
I can't go back to yesterday - because I was a different person then
