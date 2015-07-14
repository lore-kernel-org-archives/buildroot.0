From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 14 Jul 2015 21:20:22 +0200
Subject: [Buildroot] [PATCH v4 3/3] toolchain: disable internal for
 blackfin
In-Reply-To: <1436886664-3206-4-git-send-email-guido@vanguardiasur.com.ar>
References: <1435340002-20396-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
 <1436886664-3206-4-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150714192022.GE7858@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guido,
Guido Mart?nez wrote,

> The internal toolchain won't work with Cortex-M3, mostly because of the
> fact that some packages (notably: uclibc and glibc) fall back to regular
> ARM instructions in some situations, and Cortex-M3 has no support for
> those kind of instructions.
> 
> So, just disable it for now and rely on the external toolchain.

uClibc-ng compiles fine for Cortex-M3 when you use thumb, flat
binaries and disable ld.so. 
I am still in the progress of running the code on Freescale Kinetis
K70 from Emcraft. But I am optimistic.
(context functions must be disabled)

best regards
 Waldemar 
