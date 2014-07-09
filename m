From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 09 Jul 2014 11:05:26 +0200
Subject: [Buildroot] Is it possible to override a package from git?
In-Reply-To: <53BCF033.8050006@lucaceresoli.net>
References: <CAFRxoJ=iMsDdd3x5bGxkoyQ=rmeEMUKVaaBEOA16Kt8FBWc89w@mail.gmail.com>
 <53BCF033.8050006@lucaceresoli.net>
Message-ID: <2308540.DVG8UuBffz@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca, Marco,

On Wednesday 09 July 2014 09:33:07 Luca Ceresoli wrote:
[...]
> However, when you build the next time, Buildroot will already find
> <mypkg>-master.tar.gz in the downloaded sourced directory and will not
> download it again. So before building you have to remove that archive
> (or the whole download directory).
> 
> You'll also need to remove the output/build/<mypkg>-master/ directory,
> or Buildroot will think it already has the sources for the "master"
> version extracted and won't extract them again.
> 
> In a nutshell, if you're building in-tree:
>    rm -f <my_download_dir>/<mypkg>-master.tar.gz            [*]
>    make my_defconfig
>    make <MYPKG>_VERSION=master <mypkg>-dirclean all
You may avoid ths complexity by retreiving commit id of HEAD (also work for 
branches):

  ID=$(git ls-remote <GIT_REPO> HEAD | cut -f 1)
  make my_defconfig
  make <MYPKG>_VERSION=$ID all




-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
