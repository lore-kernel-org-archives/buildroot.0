From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:23:19 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets : bump to v1.7.2
In-Reply-To: <56D6EAEA.5050709@proximus.be>
References: <1456871425-26152-1-git-send-email-sagaert.johan@proximus.be>
 <20160301233457.2dae9d21@free-electrons.com>
 <56D63448.4080202@proximus.be>
 <20160302091601.7076cc01@free-electrons.com>
 <56D6EAEA.5050709@proximus.be>
Message-ID: <20160302212319.6768a95d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan,

On Wed, 2 Mar 2016 14:30:18 +0100, Johan Sagaert wrote:

> The static library libwebsockets.a is at .../staging/usr/lib  as well as 
> the shared version
> having both static and shared libraries enabled in Buildroot.
> 
> However when i select static only libraries i get the following build error:
> I looks like the extention fails to build.
> 
> When adding :
> ifeq ($(BR2_STATIC_LIBS),y)
> LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SHARED=OFF
> endif
> 
> libwebsockets.a builds fine, so i guess this is the way to go.

Right, but you didn't add this to your v2. Did I miss it?

> (should i disable the static build when shared libs are selected ?
> both  static and shared are now build when shared libs only is selected 
> in Buildroot. )

We have three cases in Buildroot:

BR2_STATIC_LIBS=y		=> only static lib should be built
BR2_SHARED_LIBS=y		=> only shared lib should be built
BR2_SHARED_STATIC_LIBS=y	=> both shared and static lib should be
built

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
