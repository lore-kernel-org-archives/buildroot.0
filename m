From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:18:33 +0200
Subject: [Buildroot] [PATCH 00/49 v2] package/asterisk: add a complete
 asterisk stack
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <b98cd7e0-6499-ea43-6ea3-b7d963a4f459@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-09-17 23:39, Yann E. MORIN wrote:
[snip]
> ----------------------------------------------------------------
> Yann E. MORIN (49):
>       package/asterisk: new package
>       package/asterisk: enable backtrace when available
>       package/asterisk: add optional libgsm dependency
>       package/asterisk: add optional zlib dependency
>       package/asterisk: add optional support for SSL
>       package/asterisk: add optional alsa-lib dependency
>       package/asterisk: add optional curl dependency
>       package/asterisk: add optional neon dependency
>       package/asterisk: add optional libogg dependency
>       package/asterisk: add optional bluez_utils dependency
>       package/asterisk: add optional opus dependency
>       package/asterisk: add optional speex dependency
>       package/asterisk: add optional libvorbis dependency
>       package/asterisk: add optional libilbc dependency
>       package/asterisk: add optional portaudio dependency
>       package/asterisk: add optional libical dependency
>       package/asterisk: add optional openldap dependency
>       package/asterisk: add optional freeradius-client dependency
>       package/asterisk: add optional libsrtp dependency
>       package/dahdi-linux: new package
>       package/dahdi-tools: new package
>       package/dahdi-tools: add USB support
>       package/asterisk: add support for dahdi
>       package/libss7: new package
>       package/asterisk: add support for SS7
>       package/libpri: new package
>       package/asterisk: add support for PRI signalling

 All of the above is applied except the two I rejected.

>       package/spandsp: new package
>       package/asterisk: add optional spandsp support
>       package/libqb: new package
>       package/corosync: new package
>       package/corosync: add optional dbus support
>       package/corosync: add optional snmp support
>       package/asterisk: add optional corosync dependency

 I had comments on the above so marked as changes requested.

>       package/libpjsip: add option to enable GSM codec

 Maybe you have a good reason to make this an explicit option, so I have kept it
as New.

>       package/asterisk: add optional netsnmp dependency

 This one I applied.

>       package/libpjsip: add option to enable SPEEX codec
>       package/libpjsip: add option to enable G.711 codec
>       package/libpjsip: add option to enable G.722 codec
>       package/libpjsip: add option to enable G.7221 codec
>       package/libpjsip: add option to enable iLBC codec
>       package/libpjsip: add option to enable L16 codec
>       package/libpjsip: add optional portaudio support
>       package/asterisk: add optional pjsip support
>       package/asterisk: add optional libcap dependency

 I could have applied this one and the following ones, but it gives conflicts
because the rest is not yet applied, so I didn't bother.


 Regards,
 Arnout

>       package/asterisk: add optional iconv support
>       package/asterisk: enable inotify when possible
>       package/asterisk: add optional unixodbc dependency
>       package/asterisk: add optional jack2 dependency
> 
>  package/Config.in                                  |   8 +
>  ...-configure-do-not-configure-in-menuselect.patch |  58 ++++
>  ...02-sounds-do-not-download-and-check-sha1s.patch |  52 +++
>  .../0003-configure-fix-detection-of-libcrypt.patch |  43 +++
>  ...n-cross-complation-assimne-eventfd-are-av.patch |  37 +++
>  package/asterisk/Config.in                         |  25 ++
>  package/asterisk/asterisk.hash                     |   9 +
>  package/asterisk/asterisk.mk                       | 356 +++++++++++++++++++++
>  package/corosync/Config.in                         |  20 ++
>  package/corosync/corosync.hash                     |   2 +
>  package/corosync/corosync.mk                       |  60 ++++
>  package/dahdi-linux/Config.in                      |  19 ++
>  package/dahdi-linux/dahdi-linux.hash               |  23 ++
>  package/dahdi-linux/dahdi-linux.mk                 |  88 +++++
>  package/dahdi-tools/0001-no-build-docs.patch       |  16 +
>  package/dahdi-tools/0002-no-perl-manpages.patch    |  37 +++
>  package/dahdi-tools/Config.in                      |  23 ++
>  package/dahdi-tools/dahdi-tools.hash               |   4 +
>  package/dahdi-tools/dahdi-tools.mk                 |  57 ++++
>  package/libpjsip/Config.in                         |  31 ++
>  package/libpjsip/libpjsip.mk                       |  55 +++-
>  package/libpri/Config.in                           |  21 ++
>  package/libpri/libpri.hash                         |   3 +
>  package/libpri/libpri.mk                           |  52 +++
>  ...fix-CLOCK_MONOTONIC-check-for-cross-compi.patch |  33 ++
>  package/libqb/Config.in                            |  12 +
>  package/libqb/libqb.hash                           |   2 +
>  package/libqb/libqb.mk                             |  32 ++
>  package/libss7/Config.in                           |  18 ++
>  package/libss7/libss7.hash                         |   3 +
>  package/libss7/libss7.mk                           |  55 ++++
>  package/spandsp/0001-fix-msse4.x.patch             |  29 ++
>  package/spandsp/Config.in                          |   9 +
>  package/spandsp/spandsp.hash                       |   2 +
>  package/spandsp/spandsp.mk                         |  28 ++
>  35 files changed, 1314 insertions(+), 8 deletions(-)
>  create mode 100644 package/asterisk/0001-configure-do-not-configure-in-menuselect.patch
>  create mode 100644 package/asterisk/0002-sounds-do-not-download-and-check-sha1s.patch
>  create mode 100644 package/asterisk/0003-configure-fix-detection-of-libcrypt.patch
>  create mode 100644 package/asterisk/0004-configure-in-cross-complation-assimne-eventfd-are-av.patch
>  create mode 100644 package/asterisk/Config.in
>  create mode 100644 package/asterisk/asterisk.hash
>  create mode 100644 package/asterisk/asterisk.mk
>  create mode 100644 package/corosync/Config.in
>  create mode 100644 package/corosync/corosync.hash
>  create mode 100644 package/corosync/corosync.mk
>  create mode 100644 package/dahdi-linux/Config.in
>  create mode 100644 package/dahdi-linux/dahdi-linux.hash
>  create mode 100644 package/dahdi-linux/dahdi-linux.mk
>  create mode 100644 package/dahdi-tools/0001-no-build-docs.patch
>  create mode 100644 package/dahdi-tools/0002-no-perl-manpages.patch
>  create mode 100644 package/dahdi-tools/Config.in
>  create mode 100644 package/dahdi-tools/dahdi-tools.hash
>  create mode 100644 package/dahdi-tools/dahdi-tools.mk
>  create mode 100644 package/libpri/Config.in
>  create mode 100644 package/libpri/libpri.hash
>  create mode 100644 package/libpri/libpri.mk
>  create mode 100644 package/libqb/0001-bconfigure-fix-CLOCK_MONOTONIC-check-for-cross-compi.patch
>  create mode 100644 package/libqb/Config.in
>  create mode 100644 package/libqb/libqb.hash
>  create mode 100644 package/libqb/libqb.mk
>  create mode 100644 package/libss7/Config.in
>  create mode 100644 package/libss7/libss7.hash
>  create mode 100644 package/libss7/libss7.mk
>  create mode 100644 package/spandsp/0001-fix-msse4.x.patch
>  create mode 100644 package/spandsp/Config.in
>  create mode 100644 package/spandsp/spandsp.hash
>  create mode 100644 package/spandsp/spandsp.mk
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
