From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 15 Nov 2008 13:33:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: audio
	audio/alsa-lib audio/alsa-utils a etc...
Message-ID: <20081115213308.153063C8AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-15 13:33:07 -0800 (Sat, 15 Nov 2008)
New Revision: 24056

Log:
package/audio: rename audio category to multimedia

Prepare for the merge of audio and video packages. Many packages cannot
properly be assigned to either audio or video, because they have support
for both (libogg, mplayer, vlc).

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Added:
   trunk/buildroot/package/multimedia/
   trunk/buildroot/package/multimedia/Config.in
   trunk/buildroot/package/multimedia/alsa-lib/
   trunk/buildroot/package/multimedia/alsa-lib/Config.in
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
   trunk/buildroot/package/multimedia/alsa-utils/
   trunk/buildroot/package/multimedia/alsa-utils/Config.in
   trunk/buildroot/package/multimedia/alsa-utils/alsa-utils.mk
   trunk/buildroot/package/multimedia/asterisk/
   trunk/buildroot/package/multimedia/asterisk/Config.in
   trunk/buildroot/package/multimedia/asterisk/asterisk.mk
   trunk/buildroot/package/multimedia/asterisk/asterisk_no_res_ninit.patch
   trunk/buildroot/package/multimedia/aumix/
   trunk/buildroot/package/multimedia/aumix/Config.in
   trunk/buildroot/package/multimedia/aumix/aumix.mk
   trunk/buildroot/package/multimedia/festival/
   trunk/buildroot/package/multimedia/festival/Config.in
   trunk/buildroot/package/multimedia/festival/festival.mk
   trunk/buildroot/package/multimedia/festival/festival/
   trunk/buildroot/package/multimedia/festival/festival/festival-1.96-beta-doc.patch
   trunk/buildroot/package/multimedia/festival/festival/festival-1.96-beta-etcsiteinit.patch
   trunk/buildroot/package/multimedia/festival/festival/festival-1.96-beta-libdir.patch
   trunk/buildroot/package/multimedia/festival/festival/festival-1.96-beta-speechtools-dir.patch
   trunk/buildroot/package/multimedia/festival/festival/festival.mk
   trunk/buildroot/package/multimedia/festival/lexicons/
   trunk/buildroot/package/multimedia/festival/lexicons/Config.in
   trunk/buildroot/package/multimedia/festival/lexicons/festlex.mk
   trunk/buildroot/package/multimedia/festival/speech-tools/
   trunk/buildroot/package/multimedia/festival/speech-tools/Config.in
   trunk/buildroot/package/multimedia/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
   trunk/buildroot/package/multimedia/festival/speech-tools/speech-tools.mk
   trunk/buildroot/package/multimedia/festival/voices/
   trunk/buildroot/package/multimedia/festival/voices/Config.in
   trunk/buildroot/package/multimedia/festival/voices/festvox.mk
   trunk/buildroot/package/multimedia/libid3tag/
   trunk/buildroot/package/multimedia/libid3tag/Config.in
   trunk/buildroot/package/multimedia/libid3tag/libid3tag.mk
   trunk/buildroot/package/multimedia/libmad/
   trunk/buildroot/package/multimedia/libmad/Config.in
   trunk/buildroot/package/multimedia/libmad/libmad-0.15.1b-optimization.patch.avr32
   trunk/buildroot/package/multimedia/libmad/libmad.mk
   trunk/buildroot/package/multimedia/libogg/
   trunk/buildroot/package/multimedia/libogg/Config.in
   trunk/buildroot/package/multimedia/libogg/libogg.mk
   trunk/buildroot/package/multimedia/libsndfile/
   trunk/buildroot/package/multimedia/libsndfile/Config.in
   trunk/buildroot/package/multimedia/libsndfile/libsndfile-srconly.patch
   trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk
   trunk/buildroot/package/multimedia/libvorbis/
   trunk/buildroot/package/multimedia/libvorbis/Config.in
   trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk
   trunk/buildroot/package/multimedia/madplay/
   trunk/buildroot/package/multimedia/madplay/Config.in
   trunk/buildroot/package/multimedia/madplay/madplay.mk
   trunk/buildroot/package/multimedia/mpg123/
   trunk/buildroot/package/multimedia/mpg123/Config.in
   trunk/buildroot/package/multimedia/mpg123/mpg123-0.59r-cross.patch
   trunk/buildroot/package/multimedia/mpg123/mpg123.mk
   trunk/buildroot/package/multimedia/multimedia.mk
   trunk/buildroot/package/multimedia/speex/
   trunk/buildroot/package/multimedia/speex/Config.in
   trunk/buildroot/package/multimedia/speex/speex.mk

Removed:
   trunk/buildroot/package/audio/Config.in
   trunk/buildroot/package/audio/alsa-lib/Config.in
   trunk/buildroot/package/audio/alsa-lib/alsa-lib.mk
   trunk/buildroot/package/audio/alsa-utils/Config.in
   trunk/buildroot/package/audio/alsa-utils/alsa-utils.mk
   trunk/buildroot/package/audio/asterisk/Config.in
   trunk/buildroot/package/audio/asterisk/asterisk.mk
   trunk/buildroot/package/audio/asterisk/asterisk_no_res_ninit.patch
   trunk/buildroot/package/audio/audio.mk
   trunk/buildroot/package/audio/aumix/Config.in
   trunk/buildroot/package/audio/aumix/aumix.mk
   trunk/buildroot/package/audio/festival/Config.in
   trunk/buildroot/package/audio/festival/festival.mk
   trunk/buildroot/package/audio/festival/festival/festival-1.96-beta-doc.patch
   trunk/buildroot/package/audio/festival/festival/festival-1.96-beta-etcsiteinit.patch
   trunk/buildroot/package/audio/festival/festival/festival-1.96-beta-libdir.patch
   trunk/buildroot/package/audio/festival/festival/festival-1.96-beta-speechtools-dir.patch
   trunk/buildroot/package/audio/festival/festival/festival.mk
   trunk/buildroot/package/audio/festival/lexicons/Config.in
   trunk/buildroot/package/audio/festival/lexicons/festlex.mk
   trunk/buildroot/package/audio/festival/speech-tools/Config.in
   trunk/buildroot/package/audio/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
   trunk/buildroot/package/audio/festival/speech-tools/speech-tools.mk
   trunk/buildroot/package/audio/festival/voices/Config.in
   trunk/buildroot/package/audio/festival/voices/festvox.mk
   trunk/buildroot/package/audio/libid3tag/Config.in
   trunk/buildroot/package/audio/libid3tag/libid3tag.mk
   trunk/buildroot/package/audio/libmad/Config.in
   trunk/buildroot/package/audio/libmad/libmad-0.15.1b-optimization.patch.avr32
   trunk/buildroot/package/audio/libmad/libmad.mk
   trunk/buildroot/package/audio/libogg/Config.in
   trunk/buildroot/package/audio/libogg/libogg.mk
   trunk/buildroot/package/audio/libsndfile/Config.in
   trunk/buildroot/package/audio/libsndfile/libsndfile-srconly.patch
   trunk/buildroot/package/audio/libsndfile/libsndfile.mk
   trunk/buildroot/package/audio/libvorbis/Config.in
   trunk/buildroot/package/audio/libvorbis/libvorbis.mk
   trunk/buildroot/package/audio/madplay/Config.in
   trunk/buildroot/package/audio/madplay/madplay.mk
   trunk/buildroot/package/audio/mpg123/Config.in
   trunk/buildroot/package/audio/mpg123/mpg123-0.59r-cross.patch
   trunk/buildroot/package/audio/mpg123/mpg123.mk
   trunk/buildroot/package/audio/speex/Config.in
   trunk/buildroot/package/audio/speex/speex.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:

Sorry, the patch is too large to include (9671 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24056
