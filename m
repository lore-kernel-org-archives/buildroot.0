From: Martin Bark <martin@barkynet.com>
Date: Thu, 14 Mar 2019 13:38:10 +0000
Subject: [Buildroot] [PATCH 0/3] Update nodejs to 10.x LTS branch
Message-ID: <20190314133813.727-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Now that buildroot supports openssl 1.1 we can update nodejs to the 10.x LTS branch.  The 10.x branch is the current active LTS branch and will be supported until April 2021.  The 8.x branch buildroot currently uses is now in maintenance only and this will stop at the end of 2019.

Nodejs 10.x needs to compile a host tool called torque when building V8.  Currently the nodejs build system fails to compile this correctly for the host so i have included a work around in the patch.  Hopefully in the future this will get fixed. See [1] for some info.

I have also update nodejs to use nghttp2 to remove one more static dependency.

Thanks

Martin

[1] https://github.com/nodejs/node/issues/23420


Martin Bark (3):
  package/nodejs: bump version to 10.15.3
  package/nghttp2: bump version to 1.37.0
  package/nodejs: use shared nghttp2 library

 package/nghttp2/nghttp2.hash |  2 +-
 package/nghttp2/nghttp2.mk   |  2 +-
 package/nodejs/Config.in     |  1 +
 package/nodejs/nodejs.hash   |  4 ++--
 package/nodejs/nodejs.mk     | 15 ++++++++++++---
 5 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.21.0
