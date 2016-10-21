From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 21 Oct 2016 13:46:35 +0200
Subject: [Buildroot] cached downloads for scm branches
In-Reply-To: <D2934D97-E0A4-4AE5-933C-49D38BFFB436@walle.cc>
References: <f006d88783fb1d99aaef2d6cab1dfc88@walle.cc>
 <20161020213841.75105d07@free-electrons.com>
 <D2934D97-E0A4-4AE5-933C-49D38BFFB436@walle.cc>
Message-ID: <18938922.pbxtG6M13H@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Thursday 20 October 2016 22:29:15 Michael Walle wrote:
> hi,
> 
> thanks. yeah i thought so. Just to give you some background regarding
> my question. We have some kind of CI, actually it's rather a daily
> build. we build a root filesystem with some fixed packages, but also
> with multiple packages of our own and we want to track the tip of a
> branch for a build (because it is CI ;)). I don't think the src
> override method really suit the CI case. I guess one way could be
> that the CI defines the commit that should be build. Or simply delete
> the download. mhh ;)

I suggest to pass package version to command line:

  make MY_PKG_VERSION=$(git ls-remote http://repo.git/path master) all

You may also force versions using local.mk:

  override MY_PKG_VERSION = $(shell git ls-remote http://repo.git/path 
master)

However, these ways are not officially supported. Consider them
as hacks.

BR,

-- 
J?r?me Pouiller
