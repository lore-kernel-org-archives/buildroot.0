From: Ilya Kuzmich <ilya.kuzmich@gmail.com>
Date: Mon, 3 Apr 2017 18:25:20 +0300
Subject: [Buildroot] [PATCH 1/1] toolchain-external: improve musl
 external check
In-Reply-To: <20170326214104.68285bca@free-electrons.com>
References: <1489989370-22377-1-git-send-email-ilya.kuzmich@gmail.com>
 <20170326214104.68285bca@free-electrons.com>
Message-ID: <20170403152520.GF4311@uxa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Turns out this is not an end to the story.

TOOLCHAIN_EXTERNAL_MUSL_LD_LINK @ pkg-toolchain-external.mk assumes that
there is a /lib/libc.so. This is not a case for ct-ng musl toolchain.
Ct-ng does this: sysroot/lib/ld-musl-armhf.so.1 -> ../usr/lib/libc.so

How do i fix this?
I've poked around pkg-toolchain-external.mk, but to no avail.

On 26/03, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 20 Mar 2017 08:56:10 +0300, Ilya Kuzmich wrote:
> > Test whether musl used or not: compile minimal C program and check if
> > interpreter contains /lib/ld-musl.
> > 
> > Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
> > ---
> >  toolchain/helpers.mk                                   | 13 +++++++++----
> >  toolchain/toolchain-external/pkg-toolchain-external.mk |  4 +++-
> >  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> Applied to master, thanks. However, I had to make a preliminary fix
> because TOOLCHAIN_EXTERNAL_READELF had a wrong value when Buildroot
> external toolchains were used.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
