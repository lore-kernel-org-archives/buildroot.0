From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 11:16:34 +0100
Subject: [Buildroot] [PATCH 3/3] Add perf tools support: this is the
 kernel patch to be applied to the kernel for kernel compile to go through;
 it basically adds a typedef.
In-Reply-To: <CAPDLWs-2Jdyj5F_XaVyGW3kciq2Qmpz0ivbgBAvacXeNZSWy2w@mail.gmail.com>
References: <CAPDLWs99Xx5ncxuCuFErsGzOnbs1br3VDcCFZooozWrHU+B=SQ@mail.gmail.com>
 <50E54257.8050201@googlemail.com>
 <CAPDLWs-2Jdyj5F_XaVyGW3kciq2Qmpz0ivbgBAvacXeNZSWy2w@mail.gmail.com>
Message-ID: <20130103111634.1338bb49@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Kaiwan Billimoria,

On Thu, 3 Jan 2013 15:37:09 +0530, Kaiwan Billimoria wrote:

> Also, AFAIK, the Sub line has the phrase [PATCH n/3]; where n is 0, 1,
> 2 & 3, thus subject is unique (this is how git generated them). If
> this is not sufficient, pl let me know..

This is not sufficient. Everything between [...] is ignored when the
patch is applied. Each of your patches should have a different commit
message.

That said, there is no reason for those 3 patches to be separate. If
you apply patch 1 alone, you have a config option that does nothing. If
you apply patches 1 and 2, then things break because it will try to
apply perf.patch which does not exist.

So basically, you should merge all your patches.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
