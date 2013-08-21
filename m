From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Aug 2013 20:47:55 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: Add Sourcery
 CodeBench for Nios-II
In-Reply-To: <CAAEAJfBVeUKtYDwHF5=QXN6NVtPQm0c_u60qRDFbs7cUKKrbeg@mail.gmail.com>
References: <1376999946-3314-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376999946-3314-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <52145B05.4080405@mind.be>
 <CAAEAJfBVeUKtYDwHF5=QXN6NVtPQm0c_u60qRDFbs7cUKKrbeg@mail.gmail.com>
Message-ID: <20130821204755.36f88b01@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garc?a,

On Wed, 21 Aug 2013 10:32:25 -0300, Ezequiel Garc?a wrote:

> Yes, I was aware of that. I tried to find such information, but couldn't :-(
> 
> Any idea how do I get that information from the toolchain itself?

Usually, all the Sourcery CodeBench toolchain have a document in
share/doc/<tuple>/pdf/getting-started.pdf with many details about the
toolchain.

Otherwise:

 * nios-linux-gcc -v
 * nios-linux-gdb -v
 * find . -name 'ld-*.so' will identify which ld-2.xx.so, which will
   tell you the version of glibc

> >  Why do you want to support two patchlevels of the same base version?
> >
> 
> Not sure, actually. Just added all the options currently available.

Hum?

> Do you think is silly? Should I leave the latest one alone?

You can support multiple versions, but not multiple patchlevel of the
same version, because it's silly.

Since I know you know how kernel versions work, what you did is like
supporting 3.10.6 and 3.10.7: it's pointless, 3.10.7 is basically the
same as 3.10.6 with a few additional fixes. Of course, supporting both
3.9 and 3.10 might make sense.

Look at the other Sourcery Codebench toolchain entries in Buildroot. We
support multiple versions, but not multiple patchlevel of the same
version.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
