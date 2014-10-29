From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 22:24:18 +0100
Subject: [Buildroot] [PATCH v2 1/2] libffi: make thread support optional
In-Reply-To: <1410784002-8659-1-git-send-email-jezz@sysmic.org>
References: <1410784002-8659-1-git-send-email-jezz@sysmic.org>
Message-ID: <20141029222418.17f91967@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Mon, 15 Sep 2014 14:26:41 +0200, J?r?me Pouiller wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/7ee57d01917ea72d1811469e482513dda2ceb1ea/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

To be honest, I am wondering if we really should bother merging a patch
to make libffi usable on configurations that have thread support
disabled. Nowadays, not having thread support is also impossible due to
the large number of libraries/applications that rely on threads. libffi
is generally used in "big" things like Python or glib, so not having
thread support in systems using such big things is a bit unlikely.

In addition, I'm not sure the patch could be upstreamed as is, which
means we would have to carry it in Buildroot forever.

Peter, Arnout, Gustavo, what is your point of view on this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
