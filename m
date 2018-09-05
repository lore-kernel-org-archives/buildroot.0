From: Fame Castle <famecastle@gmail.com>
Date: Wed, 5 Sep 2018 18:11:51 +0200
Subject: [Buildroot] Chromium v7 test
Message-ID: <CAD0+TpAh1V=ztZfNAGzF34DAW=6f-JSzkJ0SvhwNWqu3vw_5HQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

I finally found the time to test your chromium-v7-wip branch. I cloned the
repo (only the chromium-v7-wip branch) into a new buildroot folder. I then
set up a Linux 4.18 kernel, GlibC, Mesa and XOrg. The build fails at a step
I think I have seen before. (DeJa Vu?)

This is the output:

.../ChromeTest/buildroot/output/build/chromium-68.0.3440.106/build/config/linux/pkg-config.py
nss -v -lssl3
Returned 1.
stderr:

Package nss was not found in the pkg-config search path.
Perhaps you should add the directory containing `nss.pc'
to the PKG_CONFIG_PATH environment variable
No package 'nss' found
Could not run pkg-config.

See //third_party/nss/BUILD.gn:15:3: whence it was called.
  pkg_config("system_nss_no_ssl_config") {
  ^---------------------------------------
See //crypto/BUILD.gn:221:25: which caused the file to be included.
    public_configs += [ "//third_party/nss:system_nss_no_ssl_config" ]
                        ^-------------------------------------------

I compiled for i586 architecture.

Is this the problem you have to deal with too?

Cheers,
Famecastle
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180905/4daa3eb2/attachment.html>
