From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Nov 2016 23:57:30 +0100
Subject: [Buildroot] [PATCH 0/5] Bump QT 5.8.0-beta
In-Reply-To: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <a7ab51cc-7dfd-e7e2-70fc-d2f5535fbcd1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-16 11:30, Andreas Naumann wrote:
> I'm currently playing around with qt5.8 and might as well ask for comments.
> 
> I've done some testing on IMX6 and SAMA5D3 and things seem to do fine, 
> especially GPU-less QML which is motivation for this.
> Compile only tested with a ras-pi defconfig.
> 
> This series removes the hashes for now since they will change again anyway.

 I've done a super-quick review.

 I've marked the series as Rejected in patchwork, since it's not intended to be
included.

 Regards,
 Arnout

> 
> 
> Andreas Naumann (5):
>   qt5: bump to 5.8.0-beta
>   Revert "qt5base: install bundled fonts to target"
>   qt5webkit: bump to 5.8.0-beta
>   qt5declarative: enable Quick for non-GL platforms
>   quickcontrols1/2: enable for software renderer
> 
>  package/qt5/Config.in                              |  7 +--
>  package/qt5/qt5.mk                                 |  6 +-
>  package/qt5/qt53d/qt53d.hash                       |  2 -
>  ...001-directfb-make-platform-plugin-compile.patch | 22 ++++++++
>  .../0006-eglfs-rasp-pi-header-inclusion.patch      | 45 ---------------
>  package/qt5/qt5base/qt5base.hash                   |  2 -
>  package/qt5/qt5base/qt5base.mk                     | 11 +---
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  2 -
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  2 -
>  package/qt5/qt5declarative/Config.in               |  4 +-
>  package/qt5/qt5declarative/qt5declarative.hash     |  2 -
>  package/qt5/qt5enginio/Config.in                   | 13 -----
>  package/qt5/qt5enginio/qt5enginio.hash             |  2 -
>  package/qt5/qt5enginio/qt5enginio.mk               | 64 ----------------------
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  2 -
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  2 -
>  package/qt5/qt5location/qt5location.hash           |  2 -
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  2 -
>  package/qt5/qt5multimedia/qt5multimedia.mk         |  2 +
>  package/qt5/qt5quickcontrols/Config.in             |  3 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  2 -
>  package/qt5/qt5quickcontrols/qt5quickcontrols.mk   |  5 +-
>  package/qt5/qt5quickcontrols2/Config.in            |  3 +-
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  2 -
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk |  8 ++-
>  package/qt5/qt5script/qt5script.hash               |  2 -
>  package/qt5/qt5sensors/qt5sensors.hash             |  2 -
>  package/qt5/qt5serialbus/qt5serialbus.hash         |  2 -
>  package/qt5/qt5serialport/qt5serialport.hash       |  2 -
>  package/qt5/qt5svg/qt5svg.hash                     |  2 -
>  package/qt5/qt5tools/qt5tools.hash                 |  2 -
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  2 -
>  package/qt5/qt5webkit/qt5webkit.hash               |  2 -
>  package/qt5/qt5webkit/qt5webkit.mk                 |  3 +-
>  package/qt5/qt5websockets/qt5websockets.hash       |  2 -
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  2 -
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  2 -
>  37 files changed, 45 insertions(+), 197 deletions(-)
>  delete mode 100644 package/qt5/qt53d/qt53d.hash
>  create mode 100644 package/qt5/qt5base/0001-directfb-make-platform-plugin-compile.patch
>  delete mode 100644 package/qt5/qt5base/0006-eglfs-rasp-pi-header-inclusion.patch
>  delete mode 100644 package/qt5/qt5base/qt5base.hash
>  delete mode 100644 package/qt5/qt5canvas3d/qt5canvas3d.hash
>  delete mode 100644 package/qt5/qt5connectivity/qt5connectivity.hash
>  delete mode 100644 package/qt5/qt5declarative/qt5declarative.hash
>  delete mode 100644 package/qt5/qt5enginio/Config.in
>  delete mode 100644 package/qt5/qt5enginio/qt5enginio.hash
>  delete mode 100644 package/qt5/qt5enginio/qt5enginio.mk
>  delete mode 100644 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
>  delete mode 100644 package/qt5/qt5imageformats/qt5imageformats.hash
>  delete mode 100644 package/qt5/qt5location/qt5location.hash
>  delete mode 100644 package/qt5/qt5multimedia/qt5multimedia.hash
>  delete mode 100644 package/qt5/qt5quickcontrols/qt5quickcontrols.hash
>  delete mode 100644 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
>  delete mode 100644 package/qt5/qt5script/qt5script.hash
>  delete mode 100644 package/qt5/qt5sensors/qt5sensors.hash
>  delete mode 100644 package/qt5/qt5serialbus/qt5serialbus.hash
>  delete mode 100644 package/qt5/qt5serialport/qt5serialport.hash
>  delete mode 100644 package/qt5/qt5svg/qt5svg.hash
>  delete mode 100644 package/qt5/qt5tools/qt5tools.hash
>  delete mode 100644 package/qt5/qt5webchannel/qt5webchannel.hash
>  delete mode 100644 package/qt5/qt5webkit/qt5webkit.hash
>  delete mode 100644 package/qt5/qt5websockets/qt5websockets.hash
>  delete mode 100644 package/qt5/qt5x11extras/qt5x11extras.hash
>  delete mode 100644 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
