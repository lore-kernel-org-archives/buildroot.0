From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 26 Oct 2016 18:08:01 +0200
Subject: [Buildroot] [PATCH v2 0/2] mfgtools: new package
Message-ID: <20161026160803.30262-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here is the v2 with the following modifications:
- Use host-cmake-package and build the CLI as a post build hook
- Fix licenses: now BSD-3c and CPOL
- Fix MFGTOOLS_CFLAGS and rename it HOST_MFGTOOLS_CFLAGS
- Use HOST_LDFLAGS instead of specifyin the rpath manually
- Fix install commands to have the full destination path
- Add readme.txt file
- Add a follow-up patch to add the package to DEVELOPERS

Thomas, I will send a cmake patch upstream later, hope that's ok.

Frank, I did try both the mfgtools files from NXP on a SabreSD and my own
sample file on a SabreLite, it worked on both. Hope you'll be able to try it.

Note that I've put some effort into the readme.txt not to forget the steps ;)

Regards,
Gary

Gary Bisson (2):
  mfgtools: new package
  DEVELOPERS: add entry for mfgtools

 DEVELOPERS                      |  1 +
 package/Config.in.host          |  1 +
 package/mfgtools/Config.in.host | 10 ++++++++
 package/mfgtools/mfgtools.hash  |  2 ++
 package/mfgtools/mfgtools.mk    | 34 +++++++++++++++++++++++++
 package/mfgtools/readme.txt     | 56 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 104 insertions(+)
 create mode 100644 package/mfgtools/Config.in.host
 create mode 100644 package/mfgtools/mfgtools.hash
 create mode 100644 package/mfgtools/mfgtools.mk
 create mode 100644 package/mfgtools/readme.txt

-- 
2.9.3
