From: Marco Pastorelli <mpastorelli@gmail.com>
Date: Wed, 9 Jul 2014 16:55:53 +0200
Subject: [Buildroot] Is it possible to override a package from git?
In-Reply-To: <2308540.DVG8UuBffz@sagittea>
References: <CAFRxoJ=iMsDdd3x5bGxkoyQ=rmeEMUKVaaBEOA16Kt8FBWc89w@mail.gmail.com>
 <53BCF033.8050006@lucaceresoli.net> <2308540.DVG8UuBffz@sagittea>
Message-ID: <CAFRxoJnwgcQF8r-HCu-PSLmYtcdsCETB9kxW+jqyFBC_drDyhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, J?r?me,

this is a graceful solution,
thank you so much!

Marco.


2014-07-09 11:05 GMT+02:00 J?r?me Pouiller <jezz@sysmic.org>:

> Hello Luca, Marco,
>
> On Wednesday 09 July 2014 09:33:07 Luca Ceresoli wrote:
> [...]
> > However, when you build the next time, Buildroot will already find
> > <mypkg>-master.tar.gz in the downloaded sourced directory and will not
> > download it again. So before building you have to remove that archive
> > (or the whole download directory).
> >
> > You'll also need to remove the output/build/<mypkg>-master/ directory,
> > or Buildroot will think it already has the sources for the "master"
> > version extracted and won't extract them again.
> >
> > In a nutshell, if you're building in-tree:
> >    rm -f <my_download_dir>/<mypkg>-master.tar.gz            [*]
> >    make my_defconfig
> >    make <MYPKG>_VERSION=master <mypkg>-dirclean all
> You may avoid ths complexity by retreiving commit id of HEAD (also work for
> branches):
>
>   ID=$(git ls-remote <GIT_REPO> HEAD | cut -f 1)
>   make my_defconfig
>   make <MYPKG>_VERSION=$ID all
>
>
>
>
> --
> J?r?me Pouiller, Sysmic
> Embedded Linux specialist
> http://www.sysmic.fr
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140709/334de696/attachment.html>
