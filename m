From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 11:55:25 +0200
Subject: [Buildroot] [PATCH 29/30] toolchain/toolchain-external: move
 external toolchain definition into a separate file
In-Reply-To: <1477255711-28603-30-git-send-email-romain.naour@gmail.com>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
 <1477255711-28603-30-git-send-email-romain.naour@gmail.com>
Message-ID: <20161025115525.242b1153@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 22:48:30 +0200, Romain Naour wrote:
> Use pkg-toolchain-external-download.mk to define all *_SITE, *_SOURCE,
> *_ACTUAL_SOURCE_TARBALL and custom hooks for all external toolchains.
> 
> This allow to keep the minimal subset of functions and definition in
> toolchain-external.mk in order to introduce the new toolchain infra.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

This specific commit looks a bit useless, because you're essentially
removing entirely the pkg-toolchain-external-download.mk file in PATCH
30/30.

Indeed, this patch does:

.../pkg-toolchain-external-download.mk             | 186 +++++++++++++++++++++

And PATCH 30/30 does:

 .../pkg-toolchain-external-download.mk             | 186 ----

So you could just as well remove PATCH 29/30.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
