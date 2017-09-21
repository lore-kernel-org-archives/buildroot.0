From: Christian Stewart <christian@paral.in>
Date: Fri, 22 Sep 2017 00:09:40 +0100
Subject: [Buildroot] [PATCH 3/9] docker-engine: add support for init
	processes
In-Reply-To: <859c9ec7-7a17-cfef-ac9f-8982d8f8c086@mind.be>
References: <20170920030210.19446-1-christian@paral.in>
 <20170920030210.19446-4-christian@paral.in>
 <859c9ec7-7a17-cfef-ac9f-8982d8f8c086@mind.be>
Message-ID: <CA+h8R2pkz7=vpzbScAShZrdZU3=QDoKoPc7+iwVVP4vBiX=4JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

I marked this series as RFC on patchwork, just because there are a
couple of fixes I have applied and will respin after people are done
reviewing.

On Thu, Sep 21, 2017 at 10:37 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  On my Debian system there is no docker-init but I don't get this warning when
> starting docker...

This is likely because Docker has changed since I wrote this patch
originally, which was against a version 4 versions ago around 6 months
ago.

>  Upstream URL is not needed here, only in the package itself.

Interesting, I put it there because for some reason I remember seeing
the upstream URL in the Config.in for other packages. Will remove.

>  It might be useful to add some help text that indicates the difference between
> tini and dumb-init.

Functionally there is none, but the actual implementations are just
slightly different by different authors. Tini is a bit newer but
backed by a less trusted source while dumb-init is old and backed by
Yelp. For some reason Tini is used by the docker official
distribution.

Best,
Christian
