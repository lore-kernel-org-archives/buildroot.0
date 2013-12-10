From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 10 Dec 2013 16:55:37 -0500
Subject: [Buildroot] Knowing whether the target is multicore
Message-ID: <CA+-urNRh5WARfiTZXAiULdXmxTErbdJSGWTnRHjiTr_uEyEoeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From what I can tell, the answer is no, but I was wondering if there
was any way of knowing in a package's .mk file whether the target is
single or multicore.

The reason that I'm asking is that I'm currently working with the
Erlang package. The Erlang configure script can be told whether to
build a VM that supports multi-core or not. By default, it builds VMs
for both cases. This works, but takes quite a bit longer to compile
and adds to the target image size. I'd like to be able to set this
appropriately, and it seems like this would be better accomplished
using an arch-specific BR2_ variable rather than something in the
Erlang package's Config.in.

Thanks,
Frank
