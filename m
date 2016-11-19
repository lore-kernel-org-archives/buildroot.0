From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 19 Nov 2016 14:53:15 +0100
Subject: [Buildroot] [PATCH v2 05/15] reproducibility/linux: override
	build timestamp
In-Reply-To: <20161118124035.2a18431b@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-6-git-send-email-jezz@sysmic.org>
 <20161118124035.2a18431b@free-electrons.com>
Message-ID: <3760418.eHefN4R8xK@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 18 November 2016 12:40:35 Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 Nov 2016 10:10:14 +0100, J?r?me Pouiller wrote:
> 
> > +ifeq ($(BR2_REPRODUCIBLE),y)
> > +LINUX_MAKE_ENV += \
> > +	KBUILD_BUILD_VERSION=1 \
> > +	KBUILD_BUILD_USER=buildroot \
> > +	KBUILD_BUILD_HOST=buildroot \
> > +	KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
> 
> With your "fakedate" script, do we really need this last line?

I prefer to use native solution when upstream provide one. I hope one
day all packages will be fixed by upstream and we could get ride of
fakedate.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
