From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 15 Nov 2008 17:04:42 +0100
Subject: [Buildroot] [PATCH] move audio category to multimedia and add
	mplayer and vlc
Message-ID: <200811151704.42586.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the following two patches are too big to include, even bziped they are over
40k because of moving big package patch files.

http://markus-hd.homepage.t-online.de/br/0001-package-audio-rename-audio-category-to-multimedia.patch

http://markus-hd.homepage.t-online.de/br/0002-mplayer-vlc-move-into-multimedia-category.patch


 package/Config.in                                                                          |    8 ++------
 package/audio/Config.in                                                                    |   15 ---------------
 package/audio/audio.mk                                                                     |    1 -
 package/audio/festival/festival.mk                                                         |    4 ----
 package/multimedia/Config.in                                                               |   17 +++++++++++++++++
 package/{audio => multimedia}/alsa-lib/Config.in                                           |    0
 package/{audio => multimedia}/alsa-lib/alsa-lib.mk                                         |    2 +-
 package/{audio => multimedia}/alsa-utils/Config.in                                         |    0
 package/{audio => multimedia}/alsa-utils/alsa-utils.mk                                     |    2 +-
 package/{audio => multimedia}/asterisk/Config.in                                           |    0
 package/{audio => multimedia}/asterisk/asterisk.mk                                         |    2 +-
 package/{audio => multimedia}/asterisk/asterisk_no_res_ninit.patch                         |    0
 package/{audio => multimedia}/aumix/Config.in                                              |    0
 package/{audio => multimedia}/aumix/aumix.mk                                               |    0
 package/{audio => multimedia}/festival/Config.in                                           |    6 +++---
 package/multimedia/festival/festival.mk                                                    |    4 ++++
 package/{audio => multimedia}/festival/festival/festival-1.96-beta-doc.patch               |    0
 package/{audio => multimedia}/festival/festival/festival-1.96-beta-etcsiteinit.patch       |    0
 package/{audio => multimedia}/festival/festival/festival-1.96-beta-libdir.patch            |    0
 package/{audio => multimedia}/festival/festival/festival-1.96-beta-speechtools-dir.patch   |    0
 package/{audio => multimedia}/festival/festival/festival.mk                                |    2 +-
 package/{audio => multimedia}/festival/lexicons/Config.in                                  |    0
 package/{audio => multimedia}/festival/lexicons/festlex.mk                                 |    0
 package/{audio => multimedia}/festival/speech-tools/Config.in                              |    0
 package/{audio => multimedia}/festival/speech-tools/speech-tools-1.2.96-beta-install.patch |    0
 package/{audio => multimedia}/festival/speech-tools/speech-tools.mk                        |    2 +-
 package/{audio => multimedia}/festival/voices/Config.in                                    |    0
 package/{audio => multimedia}/festival/voices/festvox.mk                                   |    0
 package/{audio => multimedia}/libid3tag/Config.in                                          |    0
 package/{audio => multimedia}/libid3tag/libid3tag.mk                                       |    2 +-
 package/{audio => multimedia}/libmad/Config.in                                             |    0
 package/{audio => multimedia}/libmad/libmad-0.15.1b-optimization.patch.avr32               |    0
 package/{audio => multimedia}/libmad/libmad.mk                                             |    4 ++--
 package/{audio => multimedia}/libogg/Config.in                                             |    0
 package/{audio => multimedia}/libogg/libogg.mk                                             |    2 +-
 package/{audio => multimedia}/libsndfile/Config.in                                         |    0
 package/{audio => multimedia}/libsndfile/libsndfile-srconly.patch                          |    0
 package/{audio => multimedia}/libsndfile/libsndfile.mk                                     |    2 +-
 package/{audio => multimedia}/libvorbis/Config.in                                          |    0
 package/{audio => multimedia}/libvorbis/libvorbis.mk                                       |    0
 package/{audio => multimedia}/madplay/Config.in                                            |    0
 package/{audio => multimedia}/madplay/madplay.mk                                           |    2 +-
 package/{audio => multimedia}/mpg123/Config.in                                             |    0
 package/{audio => multimedia}/mpg123/mpg123-0.59r-cross.patch                              |    0
 package/{audio => multimedia}/mpg123/mpg123.mk                                             |    2 +-
 package/{ => multimedia}/mplayer/Config.in                                                 |    0
 package/{ => multimedia}/mplayer/mplayer-1.0rc1-atmel.3.patch                              |    0
 package/{ => multimedia}/mplayer/mplayer-1.0rc1-index.patch                                |    0
 package/{ => multimedia}/mplayer/mplayer.mk                                                |    2 +-
 package/multimedia/multimedia.mk                                                           |    1 +
 package/{audio => multimedia}/speex/Config.in                                              |    0
 package/{audio => multimedia}/speex/speex.mk                                               |    2 +-
 package/{ => multimedia}/vlc/Config.in                                                     |    0
 package/{ => multimedia}/vlc/vlc.mk                                                        |    2 +-
 54 files changed, 42 insertions(+), 44 deletions(-)
 delete mode 100644 package/audio/Config.in
 delete mode 100644 package/audio/audio.mk
 delete mode 100644 package/audio/festival/festival.mk
 create mode 100644 package/multimedia/Config.in
 rename package/{audio => multimedia}/alsa-lib/Config.in (100%)
 rename package/{audio => multimedia}/alsa-lib/alsa-lib.mk (96%)
 rename package/{audio => multimedia}/alsa-utils/Config.in (100%)
 rename package/{audio => multimedia}/alsa-utils/alsa-utils.mk (96%)
 rename package/{audio => multimedia}/asterisk/Config.in (100%)
 rename package/{audio => multimedia}/asterisk/asterisk.mk (97%)
 rename package/{audio => multimedia}/asterisk/asterisk_no_res_ninit.patch (100%)
 rename package/{audio => multimedia}/aumix/Config.in (100%)
 rename package/{audio => multimedia}/aumix/aumix.mk (100%)
 rename package/{audio => multimedia}/festival/Config.in (63%)
 create mode 100644 package/multimedia/festival/festival.mk
 rename package/{audio => multimedia}/festival/festival/festival-1.96-beta-doc.patch (100%)
 rename package/{audio => multimedia}/festival/festival/festival-1.96-beta-etcsiteinit.patch (100%)
 rename package/{audio => multimedia}/festival/festival/festival-1.96-beta-libdir.patch (100%)
 rename package/{audio => multimedia}/festival/festival/festival-1.96-beta-speechtools-dir.patch (100%)
 rename package/{audio => multimedia}/festival/festival/festival.mk (90%)
 rename package/{audio => multimedia}/festival/lexicons/Config.in (100%)
 rename package/{audio => multimedia}/festival/lexicons/festlex.mk (100%)
 rename package/{audio => multimedia}/festival/speech-tools/Config.in (100%)
 rename package/{audio => multimedia}/festival/speech-tools/speech-tools-1.2.96-beta-install.patch (100%)
 rename package/{audio => multimedia}/festival/speech-tools/speech-tools.mk (89%)
 rename package/{audio => multimedia}/festival/voices/Config.in (100%)
 rename package/{audio => multimedia}/festival/voices/festvox.mk (100%)
 rename package/{audio => multimedia}/libid3tag/Config.in (100%)
 rename package/{audio => multimedia}/libid3tag/libid3tag.mk (95%)
 rename package/{audio => multimedia}/libmad/Config.in (100%)
 rename package/{audio => multimedia}/libmad/libmad-0.15.1b-optimization.patch.avr32 (100%)
 rename package/{audio => multimedia}/libmad/libmad.mk (92%)
 rename package/{audio => multimedia}/libogg/Config.in (100%)
 rename package/{audio => multimedia}/libogg/libogg.mk (87%)
 rename package/{audio => multimedia}/libsndfile/Config.in (100%)
 rename package/{audio => multimedia}/libsndfile/libsndfile-srconly.patch (100%)
 rename package/{audio => multimedia}/libsndfile/libsndfile.mk (96%)
 rename package/{audio => multimedia}/libvorbis/Config.in (100%)
 rename package/{audio => multimedia}/libvorbis/libvorbis.mk (100%)
 rename package/{audio => multimedia}/madplay/Config.in (100%)
 rename package/{audio => multimedia}/madplay/madplay.mk (96%)
 rename package/{audio => multimedia}/mpg123/Config.in (100%)
 rename package/{audio => multimedia}/mpg123/mpg123-0.59r-cross.patch (100%)
 rename package/{audio => multimedia}/mpg123/mpg123.mk (95%)
 rename package/{ => multimedia}/mplayer/Config.in (100%)
 rename package/{ => multimedia}/mplayer/mplayer-1.0rc1-atmel.3.patch (100%)
 rename package/{ => multimedia}/mplayer/mplayer-1.0rc1-index.patch (100%)
 rename package/{ => multimedia}/mplayer/mplayer.mk (95%)
 create mode 100644 package/multimedia/multimedia.mk
 rename package/{audio => multimedia}/speex/Config.in (100%)
 rename package/{audio => multimedia}/speex/speex.mk (95%)
 rename package/{ => multimedia}/vlc/Config.in (100%)
 rename package/{ => multimedia}/vlc/vlc.mk (88%)
