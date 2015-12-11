From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2015 16:28:50 +0100
Subject: [Buildroot] [RFC] Relocatable host tools
In-Reply-To: <CAAXf6LX2uJ7p+SzdZq2LKL0JsHXB0PzO_1Lx5tTjcBfDq-7wZg@mail.gmail.com>
References: <CAAXf6LX2uJ7p+SzdZq2LKL0JsHXB0PzO_1Lx5tTjcBfDq-7wZg@mail.gmail.com>
Message-ID: <20151211162850.327b9e71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, 11 Dec 2015 15:11:27 +0100, Thomas De Schampheleire wrote:

> I believe this is one step closer to having a relocatable host SDK for
> Buildroot. While I'm not claiming (nor have I tested) a completely
> relocatable host SDK, by changing the RPATH from an absolute path to
> '$ORIGIN/../lib'.
> 
> '$ORIGIN' here is a literal string encoded in the ELF binary and
> replaced at runtime by the location of the binary. So, a binary
> originally created in /home/foo/buildroot/output/host/usr/bin and run
> from there will expect its libraries in
> /home/foo/buildroot/output/host/usr/lib, but the same binary copied
> and run from /tmp/hostsdk/bin will expect its libraries in
> /tmp/hostsdk/lib.

Have you seen:

  http://patchwork.ozlabs.org/patch/494781/
  http://patchwork.ozlabs.org/patch/494782/
  http://patchwork.ozlabs.org/patch/494783/
  http://patchwork.ozlabs.org/patch/494784/
  http://patchwork.ozlabs.org/patch/494785/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
