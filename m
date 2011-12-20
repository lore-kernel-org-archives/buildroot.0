From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 20 Dec 2011 08:33:38 +0100
Subject: [Buildroot] tutorial to extend buildroot?
In-Reply-To: <CAOrAeomixni4EZqKWV0p9bVfg9eOsQ+4LP4=CyK6POTsiga2iw@mail.gmail.com>
References: <CAOrAeomixni4EZqKWV0p9bVfg9eOsQ+4LP4=CyK6POTsiga2iw@mail.gmail.com>
Message-ID: <CAAXf6LXrANu2mfxX6zjVGRZYUKH7Ud=wv+Xh7N0p338yxSMHpQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vincent,

On Tue, Dec 20, 2011 at 2:47 AM, vbr vbr <vvvg77@gmail.com> wrote:
> Hi,
>
> I have set up my buildroot environment, built an external toolchain
> (crosstool ng) with uClibc, and I understand how to add autotools-based
> packages to buildroot. I committed buildroot source to my svn repo and most
> of the tarballs that I needed which sit in the dl directory. Everything
> works great!

That's nice to hear!

>
> Now I have private programs and libraries that I would want to add in
> buildroot infrastructure too, but I don't want to add them in the form of a
> tarball like other open-source tools and libraries. I just want to commit
> the source code for each library and integrate their respective makefiles
> (or create a new makefile for each of them to work) with buildroot. (no
> tarball involved).
>
> Does buildroot infrastructure/makefiles support that? Any guidelines or
> examples?
> I haven't found info regarding that question in the online documentation so
> far.

You could either use the git, svn, bzr or hg site methods, or use the
'local' site method.
The first set of methods will automatically clone the right revision
from your repository and build it. The revision itself is packaged in
a tarball in the background, but I don't think this bothers you. It is
transparent. All you have to do is specify the revision to use in the
.mk file.
This is described in the buildroot documentation (search for
LIBFOO_SITE_METHOD).

The local site method allows you to use an already existing clone or
source base. In this case, you point buildroot to the path where this
working directory is located. You can have uncommitted files there,
which is useful during development. This feature is described in the
following blog post made by Thomas Petazzoni:
http://free-electrons.com/blog/buildroot-2011-11/
It describes some of the new features of buildroot 2011.11 that are
not yet documented.

Best regards,
Thomas
