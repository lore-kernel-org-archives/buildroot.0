From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 20 Dec 2018 21:22:47 -0200
Subject: [Buildroot] [PATCH v2 0/2] make host-cryptopp selectable
Message-ID: <20181220232249.29434-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting Thomas Petazzoni, the current situation is:

 * Most host packages don't have any Config.in.host options (blind or
   visible), because they are merely build dependencies of other
   packages.

 * A few host packages do have a visible Config.in.host because they
   are useful by themselves, and not just as a build dependency of
   something else: image generation tools, flashing tools, qemu, etc.

The idea we have for the future is:

 * All host packages have a Config.in.host option.

 * The host packages that are only build dependencies of other packages
   have a blind Config.in.host option

 * The host packages that are useful by themselves continue to have a
   visible Config.in.host option.

Carlos Santos (2):
  package/cryptopp: add a blind Config.in.host
  package/tegrarcm: select host-cryptopp

 package/Config.in.host          | 1 +
 package/cryptopp/Config.in.host | 6 ++++++
 package/tegrarcm/Config.in.host | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 package/cryptopp/Config.in.host

-- 
2.19.2
