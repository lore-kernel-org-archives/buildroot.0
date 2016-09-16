From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 18:55:59 +0200
Subject: [Buildroot] [PATCH 1/1] libfastjson: Was referencing
 non-existing files
In-Reply-To: <1474018609-2610-1-git-send-email-fpa@sbtaqua.com>
References: <1474018609-2610-1-git-send-email-fpa@sbtaqua.com>
Message-ID: <20160916185559.23a41621@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Sep 2016 11:36:49 +0200, Frederik Aalund wrote:

> -LIBFASTJSON_VERSION = v0.99.2
> +LIBFASTJSON_VERSION = 0.99.2
>  LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,$(LIBFASTJSON_VERSION))
> +LIBFASTJSON_SOURCE = v$(LIBFASTJSON_VERSION).tar.gz

This is not correct: the version is really v0.99.2, as this is the name
of the Git tag.

Moreover, I'm not sure what you're fixing here. It downloads perfectly
fine here without your patch:

>>> libfastjson v0.99.2 Downloading
--2016-09-16 18:53:29--  https://github.com/rsyslog/libfastjson/archive/v0.99.2/libfastjson-v0.99.2.tar.gz
Resolving github.com (github.com)... 192.30.253.113
Connecting to github.com (github.com)|192.30.253.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/rsyslog/libfastjson/tar.gz/v0.99.2 [following]
--2016-09-16 18:53:36--  https://codeload.github.com/rsyslog/libfastjson/tar.gz/v0.99.2
Resolving codeload.github.com (codeload.github.com)... 192.30.253.121
Connecting to codeload.github.com (codeload.github.com)|192.30.253.121|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: ?/home/thomas/projets/buildroot/output/build/.libfastjson-v0.99.2.tar.gz.PKe11m/output?

     0K .......... .......... .......... .......... .......... 80,8K
    50K .......... .......... .......... .....                  118K=0,9s

2016-09-16 18:53:38 (92,9 KB/s) - ?/home/thomas/projets/buildroot/output/build/.libfastjson-v0.99.2.tar.gz.PKe11m/output? saved [87526]

libfastjson-v0.99.2.tar.gz: OK (sha256: fcdca0c4702362de3db3f02c8da05f985b54a9eccd618af41730409b75d10a8f)

Could you be more specific in the issue you were facing, such as
posting a build log of what happens during the download without your
patch applied?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
