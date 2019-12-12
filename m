From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Dec 2019 22:39:00 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/pango: needs libfribidi
In-Reply-To: <20191212223448.7e1dc8ba@windsurf.home>
References: <20191209205224.2762-1-ps.report@gmx.net>
 <20191209205224.2762-2-ps.report@gmx.net>
 <20191212223448.7e1dc8ba@windsurf.home>
Message-ID: <20191212223900.08123555@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 12 Dec 2019 22:34:48 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon,  9 Dec 2019 21:52:24 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > Fixes:
> >   http://autobuild.buildroot.net/results/f16fda910da23dfe5f8ac1cb51f9dbcec444b516
> >
> >   subprocess.CalledProcessError: Command '['git', 'clone', 'https://github.com/fribidi/fribidi.git', 'fribidi']' returned non-zero exit status 128.
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> This commit title really was too short, especially we like to
> understand since when this problem is occurring. So I've added the
> following paragraph:
>
>     Since commit 5cce413eb11ac75f5c48ed351896c5d1c33961d5 ("package/pango:
>     bump to version 1.44.6"), pango needs libfribidi. Through the Meson
>     subprojects mechanism, it tries to download it by itself if not
>     available. But in Buildroot, we definitely want to use the separate
>     libfribidi package, so let's add it as a dependency of pango.

+2

>
> A side question is: is here a way to tell Meson to never ever download
> subprojects by itself, and instead bail out loudly ?

Will investigate...

>
> I've applied with the improved commit log. Thanks!

Thanks.

Regards,
Peter

>
> Thomas
