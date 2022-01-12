Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D77C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 911EC4010C;
	Wed, 12 Jan 2022 14:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id woQYK-jeB6wY; Wed, 12 Jan 2022 14:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 543D142907;
	Wed, 12 Jan 2022 14:36:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01EC01BF2F6
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 14:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E565C42907
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 14:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f3nyhUZ0JzDT for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 14:36:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F303542904
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 14:36:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F109AFF802;
 Wed, 12 Jan 2022 14:36:35 +0000 (UTC)
Date: Wed, 12 Jan 2022 15:36:34 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220112153634.3e604cbc@windsurf>
In-Reply-To: <20220112132618.2634250-1-aperez@igalia.com>
References: <20220112132618.2634250-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RFC 0/2] Use Ninja as build tool for
 CMake-based packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adrian,

On Wed, 12 Jan 2022 15:26:16 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> While not a long list by any means, I think it shows a decent sample of
> packages coming from different development teams that work just fine
> switching to Ninja.
> 
> If anybody can suggest something with a bigger number of CMake packages to
> build (or a .config file to share) I will be more than happy to give it a
> test this with these patches applied :)

Packages that need to be tested:

./package/alure/alure.mk
./package/apitrace/apitrace.mk
./package/armadillo/armadillo.mk
./package/assimp/assimp.mk
./package/avro-c/avro-c.mk
./package/azmq/azmq.mk
./package/azure-iot-sdk-c/azure-iot-sdk-c.mk
./package/bcg729/bcg729.mk
./package/bctoolbox/bctoolbox.mk
./package/belle-sip/belle-sip.mk
./package/belr/belr.mk
./package/bento4/bento4.mk
./package/brickd/brickd.mk
./package/brotli/brotli.mk
./package/bullet/bullet.mk
./package/cannelloni/cannelloni.mk
./package/cctz/cctz.mk
./package/cdrkit/cdrkit.mk
./package/cegui/cegui.mk
./package/cereal/cereal.mk
./package/cfm/cfm.mk
./package/chipmunk/chipmunk.mk
./package/cjson/cjson.mk
./package/clang/clang.mk
./package/cmake/cmake.mk
./package/cmocka/cmocka.mk
./package/cog/cog.mk
./package/c-periphery/c-periphery.mk
./package/cppcms/cppcms.mk
./package/cppdb/cppdb.mk
./package/cppzmq/cppzmq.mk
./package/curlpp/curlpp.mk
./package/cutelyst/cutelyst.mk
./package/domoticz/domoticz.mk
./package/doxygen/doxygen.mk
./package/easydbus/easydbus.mk
./package/easyframes/easyframes.mk
./package/eigen/eigen.mk
./package/exiv2/exiv2.mk
./package/fatcat/fatcat.mk
./package/firmware-utils/firmware-utils.mk
./package/flann/flann.mk
./package/flare-engine/flare-engine.mk
./package/flare-game/flare-game.mk
./package/flatbuffers/flatbuffers.mk
./package/flatcc/flatcc.mk
./package/fluidsynth/fluidsynth.mk
./package/fmt/fmt.mk
./package/freerdp/freerdp.mk
./package/gerbera/gerbera.mk
./package/gflags/gflags.mk
./package/gli/gli.mk
./package/glm/glm.mk
./package/glog/glog.mk
./package/gnuradio/gnuradio.mk
./package/gqrx/gqrx.mk
./package/grantlee/grantlee.mk
./package/graphite2/graphite2.mk
./package/gr-osmosdr/gr-osmosdr.mk
./package/grpc/grpc.mk
./package/gtest/gtest.mk
./package/hackrf/hackrf.mk
./package/hiawatha/hiawatha.mk
./package/hiredis/hiredis.mk
./package/i2pd/i2pd.mk
./package/intel-gmmlib/intel-gmmlib.mk
./package/intel-mediadriver/intel-mediadriver.mk
./package/intel-mediasdk/intel-mediasdk.mk
./package/jasper/jasper.mk
./package/jpeg-turbo/jpeg-turbo.mk
./package/json-c/json-c.mk
./package/json-for-modern-cpp/json-for-modern-cpp.mk
./package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
./package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
./package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
./package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
./package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
./package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
./package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
./package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
./package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
./package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
./package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
./package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
./package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
./package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
./package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
./package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
./package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
./package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
./package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
./package/kodi/kodi.mk
./package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
./package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
./package/kodi-pvr-argustv/kodi-pvr-argustv.mk
./package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
./package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
./package/kodi-pvr-filmon/kodi-pvr-filmon.mk
./package/kodi-pvr-hdhomerun/kodi-pvr-hdhomerun.mk
./package/kodi-pvr-hts/kodi-pvr-hts.mk
./package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
./package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
./package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
./package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
./package/kodi-pvr-njoy/kodi-pvr-njoy.mk
./package/kodi-pvr-octonet/kodi-pvr-octonet.mk
./package/kodi-pvr-pctv/kodi-pvr-pctv.mk
./package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
./package/kodi-pvr-stalker/kodi-pvr-stalker.mk
./package/kodi-pvr-vbox/kodi-pvr-vbox.mk
./package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
./package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
./package/kodi-pvr-waipu/kodi-pvr-waipu.mk
./package/kodi-pvr-wmc/kodi-pvr-wmc.mk
./package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
./package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
./package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
./package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
./package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
./package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
./package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
./package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
./package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
./package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
./package/kodi-screensaver-stars/kodi-screensaver-stars.mk
./package/kodi-texturepacker/kodi-texturepacker.mk
./package/kodi-vfs-libarchive/kodi-vfs-libarchive.mk
./package/kodi-vfs-rar/kodi-vfs-rar.mk
./package/kodi-vfs-sftp/kodi-vfs-sftp.mk
./package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
./package/kodi-visualisation-goom/kodi-visualisation-goom.mk
./package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
./package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
./package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
./package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
./package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
./package/lapack/lapack.mk
./package/lensfun/lensfun.mk
./package/let-me-create/let-me-create.mk
./package/leveldb/leveldb.mk
./package/libabseil-cpp/libabseil-cpp.mk
./package/libasplib/libasplib.mk
./package/libcec/libcec.mk
./package/libcgi/libcgi.mk
./package/libcodec2/libcodec2.mk
./package/libcorrect/libcorrect.mk
./package/libcpprestsdk/libcpprestsdk.mk
./package/libcuefile/libcuefile.mk
./package/libcue/libcue.mk
./package/libeastl/libeastl.mk
./package/libebml/libebml.mk
./package/libebur128/libebur128.mk
./package/libfreeglut/libfreeglut.mk
./package/libftdi1/libftdi1.mk
./package/libgeos/libgeos.mk
./package/libgit2/libgit2.mk
./package/libglfw/libglfw.mk
./package/libgta/libgta.mk
./package/libical/libical.mk
./package/libiec61850/libiec61850.mk
./package/libiio/libiio.mk
./package/libiqrf/libiqrf.mk
./package/libks/libks.mk
./package/libmatroska/libmatroska.mk
./package/libmdbx/libmdbx.mk
./package/libminiupnpc/libminiupnpc.mk
./package/libnetconf2/libnetconf2.mk
./package/libolm/libolm.mk
./package/libosmium/libosmium.mk
./package/libplatform/libplatform.mk
./package/libressl/libressl.mk
./package/librsync/librsync.mk
./package/librtlsdr/librtlsdr.mk
./package/libsoxr/libsoxr.mk
./package/libspatialindex/libspatialindex.mk
./package/libssh/libssh.mk
./package/libubootenv/libubootenv.mk
./package/libubox/libubox.mk
./package/libuci/libuci.mk
./package/libuecc/libuecc.mk
./package/libuhttpd/libuhttpd.mk
./package/liburiparser/liburiparser.mk
./package/libuwsc/libuwsc.mk
./package/libvncserver/libvncserver.mk
./package/libwebsockets/libwebsockets.mk
./package/libyang/libyang.mk
./package/libyuv/libyuv.mk
./package/libzip/libzip.mk
./package/linphone/linphone.mk
./package/linux-serial-test/linux-serial-test.mk
./package/lld/lld.mk
./package/llvm/llvm.mk
./package/log4cxx/log4cxx.mk
./package/log4qt/log4qt.mk
./package/lua-ev/lua-ev.mk
./package/lua-sdl2/lua-sdl2.mk
./package/lugaru/lugaru.mk
./package/luvi/luvi.mk
./package/luv/luv.mk
./package/lzlib/lzlib.mk
./package/lzo/lzo.mk
./package/mariadb/mariadb.mk
./package/mbedtls/mbedtls.mk
./package/mediastreamer/mediastreamer.mk
./package/mfgtools/mfgtools.mk
./package/midori/midori.mk
./package/minetest/minetest.mk
./package/minizip/minizip.mk
./package/mjpg-streamer/mjpg-streamer.mk
./package/mraa/mraa.mk
./package/mrp/mrp.mk
./package/msgpack/msgpack.mk
./package/musepack/musepack.mk
./package/nanomsg/nanomsg.mk
./package/ne10/ne10.mk
./package/netopeer2/netopeer2.mk
./package/ninja/ninja.mk
./package/odhcp6c/odhcp6c.mk
./package/ogre/ogre.mk
./package/open62541/open62541.mk
./package/openal/openal.mk
./package/opencv3/opencv3.mk
./package/opencv4/opencv4.mk
./package/openfpgaloader/openfpgaloader.mk
./package/openjpeg/openjpeg.mk
./package/openobex/openobex.mk
./package/openpowerlink/openpowerlink.mk
./package/opentracing-cpp/opentracing-cpp.mk
./package/optee-benchmark/optee-benchmark.mk
./package/optee-client/optee-client.mk
./package/optee-examples/optee-examples.mk
./package/optee-test/optee-test.mk
./package/ortp/ortp.mk
./package/osm2pgsql/osm2pgsql.mk
./package/paho-mqtt-c/paho-mqtt-c.mk
./package/paho-mqtt-cpp/paho-mqtt-cpp.mk
./package/physfs/physfs.mk
./package/piglit/piglit.mk
./package/pistache/pistache.mk
./package/pkg-cmake.mk
./package/poppler/poppler.mk
./package/protozero/protozero.mk
./package/pugixml/pugixml.mk
./package/pulseview/pulseview.mk
./package/python-pybind/python-pybind.mk
./package/qhull/qhull.mk
./package/qjson/qjson.mk
./package/qpid-proton/qpid-proton.mk
./package/qt5/qt5webkit/qt5webkit.mk
./package/quazip/quazip.mk
./package/rabbitmq-c/rabbitmq-c.mk
./package/racehound/racehound.mk
./package/rapidjson/rapidjson.mk
./package/re2/re2.mk
./package/read-edid/read-edid.mk
./package/rpi-userland/rpi-userland.mk
./package/rtl_433/rtl_433.mk
./package/rtty/rtty.mk
./package/sdbus-cpp/sdbus-cpp.mk
./package/sentry-native/sentry-native.mk
./package/simple-mail/simple-mail.mk
./package/snappy/snappy.mk
./package/snort3/snort3.mk
./package/solarus/solarus.mk
./package/spdlog/spdlog.mk
./package/stellarium/stellarium.mk
./package/supertuxkart/supertuxkart.mk
./package/supertux/supertux.mk
./package/synergy/synergy.mk
./package/sysdig/sysdig.mk
./package/sysrepo/sysrepo.mk
./package/taglib/taglib.mk
./package/taskd/taskd.mk
./package/tcf-agent/tcf-agent.mk
./package/thrift/thrift.mk
./package/timescaledb/timescaledb.mk
./package/tinyxml2/tinyxml2.mk
./package/ttyd/ttyd.mk
./package/ubus/ubus.mk
./package/uhd/uhd.mk
./package/uhttpd/uhttpd.mk
./package/unionfs/unionfs.mk
./package/unzip/unzip.mk
./package/uqmi/uqmi.mk
./package/ustream-ssl/ustream-ssl.mk
./package/utf8proc/utf8proc.mk
./package/uvw/uvw.mk
./package/valijson/valijson.mk
./package/vulkan-headers/vulkan-headers.mk
./package/waffle/waffle.mk
./package/wampcc/wampcc.mk
./package/waylandpp/waylandpp.mk
./package/webkitgtk/webkitgtk.mk
./package/websocketpp/websocketpp.mk
./package/wireshark/wireshark.mk
./package/woff2/woff2.mk
./package/wpewebkit/wpewebkit.mk
./package/x265/x265.mk
./package/xerces/xerces.mk
./package/xmrig/xmrig.mk
./package/yajl/yajl.mk
./package/yaml-cpp/yaml-cpp.mk
./package/ympd/ympd.mk
./package/zlib-ng/zlib-ng.mk
./package/znc/znc.mk
./package/zxing-cpp/zxing-cpp.mk
./package/zziplib/zziplib.mk

The list is much longer than the ~10 samples you have taken I'm afraid :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
