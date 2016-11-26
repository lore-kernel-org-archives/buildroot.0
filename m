From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 26 Nov 2016 17:20:12 +0100
Subject: [Buildroot] [PATCH v4 14/18] python3: generate reproducible .pyc
In-Reply-To: <20161123230939.62c3f549@free-electrons.com>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
 <1479905937-17241-15-git-send-email-jezz@sysmic.org>
 <20161123230939.62c3f549@free-electrons.com>
Message-ID: <5528914.ltOSMuvLx6@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wednesday 23 November 2016 23:09:39 Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 23 Nov 2016 13:58:53 +0100, J?r?me Pouiller wrote:
> > .pyc files contain modification time of .py source. In order to make
> > build reproducible, we fix modification time of all .py before to
> > compile .pyc files.
> 
> Is there a way of avoiding the modification time contained inside
> the .pyc files? According to
> http://wiki.baserock.org/projects/deterministic-builds/: "Debian solve
> this by creating the .pyc and .pyo files at package install time",
> which is essentially what we do. How do they handle this exactly?
Debian compile .pyc and .pyo when user install package. deb files does 
not contains compiled files. Therefore, .pyc reproducibility does not 
matter.

In Buildroot, .pyc are included in filesystem. .pyc reproducibility does 
matter.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
