From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 20 Mar 2021 15:28:31 -0700
Subject: [Buildroot] [PATCH 0/4] mender updates
Message-ID: <20210320222835.3951325-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@rivian.com>

Some small mender updates in this patch set.

  - host-pkgconf is required, as mender uses it to find openssl.
  - Fix the version string showing up as "unknown"
  - Install the dbus authentication file if dbus is selected.

I would add mender-connect, but I don't want to add the package under my name
in the developers file. :)

Adam

Adam Duskett (4):
  package/mender/mender.mk: use MENDER_PKGDIR variable
  package/mender/mender.mk: fix linker version argument
  package/mender: bump version to 2.5.0
  package/mender: install dbus authentication file if dbus is selected

 package/mender/mender.hash | 13 ++++++++-----
 package/mender/mender.mk   | 21 +++++++++++++++------
 2 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.25.1
