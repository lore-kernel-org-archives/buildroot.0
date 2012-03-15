From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 15 Mar 2012 17:51:42 -0300
Subject: [Buildroot] [PATCH 19/20] alsa-lib: bump to version 1.0.25
In-Reply-To: <20120315213041.3bda3650@skate>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
 <201203140036.06296.arnout@mind.be> <20120315213041.3bda3650@skate>
Message-ID: <702f6e09c17e9a072c3e4458c35a83a2@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-15 17:30, Thomas Petazzoni wrote:

> ifeq ($(BR2_PREFER_STATIC_LIB),y)
> SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
> else
> SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
> endif
>
> And SHARED_STATIC_LIB_OPTS is used in package/Makefile.autotools.in. 
> I
> am not sure why alsa-lib requires those different options than the
> standard ones.
>
> Thomas

Because it doesn't build with both static & shared set starting with 
version 1.0.25, the configure script just errors out complaining about 
some libtool issues about building both.
Regards.
