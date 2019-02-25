From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 22:11:51 +0100
Subject: [Buildroot] [PATCH] package/flatbuffers: do not install to
 target
In-Reply-To: <20190225001610.3786-1-mika.blanc@gmail.com>
References: <20190225001610.3786-1-mika.blanc@gmail.com>
Message-ID: <20190225221151.0c773ee8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Feb 2019 01:16:11 +0100
Micha?l Blanc <mika.blanc@gmail.com> wrote:

> Since flatbuffers does not have a shared library and flatc is only useful
> for compiling schemas of other projects, there is no point in installing
> flatbuffers in the target directory.
> 
> Signed-off-by: Micha?l Blanc <mika.blanc@gmail.com>

I see a shared library on the target:

??? usr
    ??? bin
    ??? ??? flatc
    ??? lib
    ??? ??? libflatbuffers.so -> libflatbuffers.so.1
    ??? ??? libflatbuffers.so.1 -> libflatbuffers.so.1.9.0
    ??? ??? libflatbuffers.so.1.9.0

so it doesn't quite match with what your commit log says. Are you sure
you were not building with BR2_STATIC_LIBS=y ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
