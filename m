From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 21 Feb 2012 14:54:47 +0000 (UTC)
Subject: [Buildroot] Where does post-build script belong?
References: <jhub5r$smv$1@dough.gmane.org>
 <CAC78GpcJ8nZ0QrZ01a0sDgVxV7kN12ShRi27Cv8sGLg4-TKXgQ@mail.gmail.com>
 <jhueu4$u5p$1@dough.gmane.org> <4F435977.1060001@lucaceresoli.net>
Message-ID: <ji0b7n$2hl$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-02-21, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Grant Edwards wrote:
> ...
>
>>> Personally, I keep my post-build is a directory structure like:
>>> board/manufacture/model/post-build.sh
>>
>> I prefer to modify the buildroot source tree as little as possible
>> (it makes upgrading to a new version easier).  So I keep everything
>> outside it that I can.  I've put what used to be my
>> package/customize/source directory in "../customfiles", my post-build
>> script in "../postbuild.sh", and my output directory is "../output".
>
> Buildroot can be used in different ways, so yours is not necessarily
> wrong. But the structure of Buildroot is such that you can put your
> customizations in a few, well-defined places, which typically are the
> board/mycompany/myproduct dir and your config file.

I don't want to replace the default skeleton.  I want to add some
files to it, and possible modify a few.  The documentation describes
two ways to do that:

  1) package/customize

  2) post-build script

I'm told 1) is now depricated, so I'm switching to 2).

Where under board/mycompany/myproduct do you put "extra" files that
will be added to the standard skeleton?

> To add proprietary packages what I do is to create a
> packages/mcompany/ dir with packages inside.
>
> If you need to add currently unsupported opensource packages you can
> just submit a patch to this mailing-list for mainline inclusion.

That's not what I'm doing.  I'm mainly adding some basic web pages and
a few init scripts that do things like set the hostname, and start
some of the busybox daemons like httpd, inetd, etc.  My "extra"
applications are built externally and bundled as as ipkg packages that
are installed/managed outside of buildroot's package system.

> Finally, especially if you need many customizations, I suggest you
> think about using git.

I'd love to use git, but we're standardized on subversion (which does
not handle branching merging at all well). :/

In the past I've tried combining svn and git and it just didn't work.

> You can have mainline Buildroot in the master branch and you
> modifications in another branch. It is very quick to merge your
> branch with an updated Buildroot, if you follow the guidelines above.

-- 
Grant Edwards               grant.b.edwards        Yow! I know things about
                                  at               TROY DONAHUE that can't
                              gmail.com            even be PRINTED!!
