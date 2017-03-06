From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 09:19:11 +0100
Subject: [Buildroot] [PATCH 1/1] libwebsockets: bump to version 2.1.1
In-Reply-To: <20170305182748.GJ24886@airbook.vandijck-laurijssen.be>
References: <20170305182748.GJ24886@airbook.vandijck-laurijssen.be>
Message-ID: <20170306091911.05fb09c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 19:27:48 +0100, Kurt Van Dijck wrote:
> Mosquitto combined with version 2.1.0 of libwebsockets yields a failing
> system. Version 2.1.1 restores the websocket interface again.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

This update causes a build failure:

/home/test/autobuild/run/instance-2/output/build/libwebsockets-v2.1.1/lib/libwebsockets.c: In function 'lws_get_addresses':
/home/test/autobuild/run/instance-2/output/build/libwebsockets-v2.1.1/lib/libwebsockets.c:645:4: error: too many arguments for format [-Werror=format-extra-args]
    lwsl_err("inet_ntop", strerror(LWS_ERRNO));
    ^
cc1: all warnings being treated as errors

See http://autobuild.buildroot.net/results/bf0/bf04ea2c63562443dbe62934cd55f9f771fb3b3c/build-end.log

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
