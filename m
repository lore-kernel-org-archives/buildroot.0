From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Aug 2014 12:01:21 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/pkg-autotools: don't use
 config.site when cross-compiling
In-Reply-To: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
References: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAAXf6LW0Rz1DjHrMU2DqCeVGLSAYZnQD_LNfOxnSqLRAA=xnKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 22, 2014 at 11:12 AM, Romain Naour <romain.naour@openwide.fr> wrote:
> On fedora 20 64bits host, the file /usr/share/config.site contains
> a fix for installing libraries into /lib/lib64 on 64bits systems
> that redefine libdir in the generated Makefile
>
> For safety and avoid the bug #7262 [1], disable loading this file
> when running the configure script for the target and the host.
>
> Note: configure scripts generated with autoconf < 2.65 will source
> the /dev/null and print this line:
> "configure: loading site script /dev/null"
>
> [1]: https://bugs.busybox.net/show_bug.cgi?id=7262
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
