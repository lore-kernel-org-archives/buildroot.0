From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 14:09:26 +0100
Subject: [Buildroot] [PATCH 00/10 v3] support/download: reproducible
 archives whatever tar version (branch yem/dl-git-tar-pax-2)
In-Reply-To: <cover.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <20201229140926.4482f6f9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 29 Dec 2020 12:01:15 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> This however changes the actual format of the generated archives,
> and they are different from the existing ones. So we also change the
> compression to avoid collision with existign archives on s.b.o, that
> need to be read by older Buildroot versions.

You're in fact no longer changing the compression, as instead you're
using a different tarball name.

I am wondering how this tarball suffix mechanism would be used in my
Go/Cargo vendoring series to avoid the need to version bump the
Cargo/Go packages in lock-step with the vendoring. Indeed, your series
is based on an extension per download backend, but in the case of the
vendoring, it happens regardless of the download backend, but rather
based on the package infrastructure.

How would we handle that ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
