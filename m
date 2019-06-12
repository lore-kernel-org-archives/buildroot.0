From: Victor Huesca <victor.huesca@bootlin.com>
Date: Wed, 12 Jun 2019 08:42:06 +0200
Subject: [Buildroot] [PATCH 1/4] package: remove 'v' prefix from
 github-fetched packages
In-Reply-To: <20190612064209.23619-1-victor.huesca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
Message-ID: <20190612064209.23619-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Github, a large number of projects name their tag vXYZ (i.e v3.0,
v0.1, etc.). In some packages we do:

 <pkg>_VERSION = v0.3
 <pkg>_SITE = $(call github foo,bar,$(<pkg>_VERSION))

And in some other packages we do:

 <pkg>_VERSION = 0.3
 <pkg>_SITE = $(call github foo,bar,v$(<pkg>_VERSION))

I.e in one case we consider the version to be v0.3, in the other case
we consider 0.3 to be the version.

The problem with v0.3 is that when used in conjunction with
release-monitoring.org, it doesn't work very well, because
release-monitoring.org has the concept of "version prefix" and using
that they drop the "v" prefix for the version.

Therefore, a number of packages in Buildroot have a version that
doesn't match with release-monitoring.org because Buildroot has 'v0.3'
and release-monitoring.org has '0.3'.

Since really the version number of 0.3, is makes sense to update our
packages to drop this 'v'.

This commit only addresses the (common) case of github packages where
the prefix is simply 'v'. Other cases will be handled by separate
commits.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 boot/afboot-stm32/afboot-stm32.hash                         | 2 +-
 boot/afboot-stm32/afboot-stm32.mk                           | 4 ++--
 boot/opensbi/opensbi.hash                                   | 2 +-
 boot/opensbi/opensbi.mk                                     | 4 ++--
 package/a10disp/a10disp.hash                                | 2 +-
 package/a10disp/a10disp.mk                                  | 4 ++--
 package/angular-websocket/angular-websocket.hash            | 2 +-
 package/angular-websocket/angular-websocket.mk              | 4 ++--
 package/assimp/assimp.hash                                  | 2 +-
 package/assimp/assimp.mk                                    | 4 ++--
 package/azmq/azmq.hash                                      | 2 +-
 package/azmq/azmq.mk                                        | 4 ++--
 package/bandwidthd/bandwidthd.hash                          | 2 +-
 package/bandwidthd/bandwidthd.mk                            | 4 ++--
 package/bats-core/bats-core.hash                            | 2 +-
 package/bats-core/bats-core.mk                              | 4 ++--
 package/bcache-tools/bcache-tools.hash                      | 2 +-
 package/bcache-tools/bcache-tools.mk                        | 4 ++--
 package/bluez-alsa/bluez-alsa.hash                          | 2 +-
 package/bluez-alsa/bluez-alsa.mk                            | 4 ++--
 package/c-periphery/c-periphery.hash                        | 2 +-
 package/c-periphery/c-periphery.mk                          | 4 ++--
 package/can-utils/can-utils.hash                            | 2 +-
 package/can-utils/can-utils.mk                              | 4 ++--
 package/capnproto/capnproto.hash                            | 2 +-
 package/capnproto/capnproto.mk                              | 4 ++--
 package/cbootimage/cbootimage.hash                          | 2 +-
 package/cbootimage/cbootimage.mk                            | 4 ++--
 package/civetweb/civetweb.hash                              | 2 +-
 package/civetweb/civetweb.mk                                | 4 ++--
 package/cjson/cjson.hash                                    | 2 +-
 package/cjson/cjson.mk                                      | 4 ++--
 package/cog/cog.hash                                        | 2 +-
 package/cog/cog.mk                                          | 4 ++--
 package/corkscrew/corkscrew.hash                            | 2 +-
 package/corkscrew/corkscrew.mk                              | 4 ++--
 package/cppzmq/cppzmq.hash                                  | 2 +-
 package/cppzmq/cppzmq.mk                                    | 4 ++--
 package/cpuload/cpuload.hash                                | 2 +-
 package/cpuload/cpuload.mk                                  | 4 ++--
 package/davici/davici.hash                                  | 2 +-
 package/davici/davici.mk                                    | 4 ++--
 package/docker-cli/docker-cli.hash                          | 2 +-
 package/docker-cli/docker-cli.mk                            | 4 ++--
 package/docker-containerd/docker-containerd.hash            | 2 +-
 package/docker-containerd/docker-containerd.mk              | 4 ++--
 package/docker-engine/docker-engine.hash                    | 2 +-
 package/docker-engine/docker-engine.mk                      | 4 ++--
 package/dtach/dtach.hash                                    | 2 +-
 package/dtach/dtach.mk                                      | 4 ++--
 package/duktape/duktape.hash                                | 2 +-
 package/duktape/duktape.mk                                  | 4 ++--
 package/faifa/faifa.hash                                    | 2 +-
 package/faifa/faifa.mk                                      | 4 ++--
 package/faketime/faketime.hash                              | 2 +-
 package/faketime/faketime.mk                                | 4 ++--
 package/flare-engine/flare-engine.hash                      | 2 +-
 package/flare-engine/flare-engine.mk                        | 4 ++--
 package/flare-game/flare-game.hash                          | 2 +-
 package/flare-game/flare-game.mk                            | 4 ++--
 package/flatbuffers/flatbuffers.hash                        | 2 +-
 package/flatbuffers/flatbuffers.mk                          | 4 ++--
 package/flatcc/flatcc.hash                                  | 2 +-
 package/flatcc/flatcc.mk                                    | 4 ++--
 package/font-awesome/font-awesome.hash                      | 2 +-
 package/font-awesome/font-awesome.mk                        | 4 ++--
 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash    | 2 +-
 package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk      | 4 ++--
 package/fwup/fwup.hash                                      | 2 +-
 package/fwup/fwup.mk                                        | 4 ++--
 package/gerbera/gerbera.hash                                | 2 +-
 package/gerbera/gerbera.mk                                  | 4 ++--
 package/gflags/gflags.hash                                  | 2 +-
 package/gflags/gflags.mk                                    | 4 ++--
 package/glog/glog.hash                                      | 2 +-
 package/glog/glog.mk                                        | 4 ++--
 package/gqrx/gqrx.hash                                      | 2 +-
 package/gqrx/gqrx.mk                                        | 4 ++--
 package/grpc/grpc.hash                                      | 2 +-
 package/grpc/grpc.mk                                        | 4 ++--
 package/gstreamer/gst-omapfb/gst-omapfb.hash                | 2 +-
 package/gstreamer/gst-omapfb/gst-omapfb.mk                  | 4 ++--
 package/hiredis/hiredis.hash                                | 2 +-
 package/hiredis/hiredis.mk                                  | 4 ++--
 package/hwdata/hwdata.hash                                  | 2 +-
 package/hwdata/hwdata.mk                                    | 4 ++--
 package/igd2-for-linux/igd2-for-linux.hash                  | 2 +-
 package/igd2-for-linux/igd2-for-linux.mk                    | 4 ++--
 package/input-event-daemon/input-event-daemon.hash          | 2 +-
 package/input-event-daemon/input-event-daemon.mk            | 4 ++--
 package/irqbalance/irqbalance.hash                          | 2 +-
 package/irqbalance/irqbalance.mk                            | 4 ++--
 package/jack2/jack2.hash                                    | 2 +-
 package/jack2/jack2.mk                                      | 4 ++--
 package/janus-gateway/janus-gateway.hash                    | 2 +-
 package/janus-gateway/janus-gateway.mk                      | 4 ++--
 package/jquery-keyboard/jquery-keyboard.hash                | 2 +-
 package/jquery-keyboard/jquery-keyboard.mk                  | 4 ++--
 package/json-for-modern-cpp/json-for-modern-cpp.mk          | 6 +++---
 .../kodi-audiodecoder-modplug.hash                          | 2 +-
 .../kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk  | 4 ++--
 .../kodi-audiodecoder-nosefart.hash                         | 2 +-
 .../kodi-audiodecoder-nosefart.mk                           | 4 ++--
 .../kodi-audiodecoder-sidplay.hash                          | 2 +-
 .../kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk  | 4 ++--
 .../kodi-audiodecoder-snesapu.hash                          | 2 +-
 .../kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk  | 4 ++--
 .../kodi-audiodecoder-stsound.hash                          | 2 +-
 .../kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk  | 4 ++--
 .../kodi-audiodecoder-timidity.hash                         | 2 +-
 .../kodi-audiodecoder-timidity.mk                           | 4 ++--
 .../kodi-audiodecoder-vgmstream.hash                        | 2 +-
 .../kodi-audiodecoder-vgmstream.mk                          | 4 ++--
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash  | 2 +-
 package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk    | 4 ++--
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash  | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk    | 4 ++--
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash  | 2 +-
 .../kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk    | 4 ++--
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash    | 2 +-
 package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk      | 4 ++--
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash    | 2 +-
 package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk      | 4 ++--
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.hash  | 2 +-
 .../kodi-peripheral-joystick/kodi-peripheral-joystick.mk    | 4 ++--
 .../kodi-screensaver-asteroids.hash                         | 2 +-
 .../kodi-screensaver-asteroids.mk                           | 4 ++--
 .../kodi-screensaver-asterwave.hash                         | 2 +-
 .../kodi-screensaver-asterwave.mk                           | 4 ++--
 .../kodi-screensaver-biogenesis.hash                        | 2 +-
 .../kodi-screensaver-biogenesis.mk                          | 4 ++--
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash  | 2 +-
 .../kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk    | 4 ++--
 .../kodi-screensaver-greynetic.hash                         | 2 +-
 .../kodi-screensaver-greynetic.mk                           | 4 ++--
 .../kodi-screensaver-matrixtrails.hash                      | 2 +-
 .../kodi-screensaver-matrixtrails.mk                        | 4 ++--
 .../kodi-screensaver-pingpong.hash                          | 2 +-
 .../kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk  | 4 ++--
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash    | 2 +-
 package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk      | 4 ++--
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash    | 2 +-
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk      | 4 ++--
 package/kodi-screensaver-stars/kodi-screensaver-stars.hash  | 2 +-
 package/kodi-screensaver-stars/kodi-screensaver-stars.mk    | 4 ++--
 .../kodi-visualisation-fishbmc.hash                         | 2 +-
 .../kodi-visualisation-fishbmc.mk                           | 4 ++--
 .../kodi-visualisation-shadertoy.hash                       | 2 +-
 .../kodi-visualisation-shadertoy.mk                         | 4 ++--
 .../kodi-visualisation-spectrum.hash                        | 2 +-
 .../kodi-visualisation-spectrum.mk                          | 4 ++--
 .../kodi-visualisation-waveform.hash                        | 2 +-
 .../kodi-visualisation-waveform.mk                          | 4 ++--
 package/kvazaar/kvazaar.hash                                | 2 +-
 package/kvazaar/kvazaar.mk                                  | 4 ++--
 package/lcdapi/lcdapi.hash                                  | 2 +-
 package/lcdapi/lcdapi.mk                                    | 4 ++--
 package/let-me-create/let-me-create.hash                    | 2 +-
 package/let-me-create/let-me-create.mk                      | 4 ++--
 package/leveldb/leveldb.hash                                | 2 +-
 package/leveldb/leveldb.mk                                  | 4 ++--
 package/libatomic_ops/libatomic_ops.hash                    | 2 +-
 package/libatomic_ops/libatomic_ops.mk                      | 4 ++--
 package/libcoap/libcoap.hash                                | 2 +-
 package/libcoap/libcoap.mk                                  | 4 ++--
 package/libconfig/libconfig.hash                            | 2 +-
 package/libconfig/libconfig.mk                              | 4 ++--
 package/libcpprestsdk/libcpprestsdk.hash                    | 2 +-
 package/libcpprestsdk/libcpprestsdk.mk                      | 4 ++--
 package/libcue/libcue.hash                                  | 2 +-
 package/libcue/libcue.mk                                    | 4 ++--
 package/libdcadec/libdcadec.hash                            | 2 +-
 package/libdcadec/libdcadec.mk                              | 4 ++--
 package/libebur128/libebur128.hash                          | 2 +-
 package/libebur128/libebur128.mk                            | 4 ++--
 package/libfastjson/libfastjson.hash                        | 2 +-
 package/libfastjson/libfastjson.mk                          | 4 ++--
 package/libffi/libffi.hash                                  | 2 +-
 package/libffi/libffi.mk                                    | 4 ++--
 package/libgit2/libgit2.hash                                | 2 +-
 package/libgit2/libgit2.mk                                  | 4 ++--
 package/libhttpparser/libhttpparser.hash                    | 2 +-
 package/libhttpparser/libhttpparser.mk                      | 4 ++--
 package/libiqrf/libiqrf.hash                                | 2 +-
 package/libiqrf/libiqrf.mk                                  | 4 ++--
 package/libite/libite.hash                                  | 2 +-
 package/libite/libite.mk                                    | 4 ++--
 package/liblog4c-localtime/liblog4c-localtime.hash          | 2 +-
 package/liblog4c-localtime/liblog4c-localtime.mk            | 4 ++--
 package/libndp/libndp.hash                                  | 2 +-
 package/libndp/libndp.mk                                    | 4 ++--
 package/libopenh264/libopenh264.hash                        | 2 +-
 package/libopenh264/libopenh264.mk                          | 4 ++--
 package/libpagekite/libpagekite.hash                        | 4 ++--
 package/libpagekite/libpagekite.mk                          | 4 ++--
 package/libpam-tacplus/libpam-tacplus.hash                  | 2 +-
 package/libpam-tacplus/libpam-tacplus.mk                    | 4 ++--
 package/librsync/librsync.hash                              | 2 +-
 package/librsync/librsync.mk                                | 4 ++--
 package/librtas/librtas.hash                                | 2 +-
 package/librtas/librtas.mk                                  | 4 ++--
 package/libscrypt/libscrypt.hash                            | 2 +-
 package/libscrypt/libscrypt.mk                              | 4 ++--
 package/libseccomp/libseccomp.hash                          | 2 +-
 package/libseccomp/libseccomp.mk                            | 4 ++--
 package/libserial/libserial.hash                            | 2 +-
 package/libserial/libserial.mk                              | 4 ++--
 package/libsrtp/libsrtp.hash                                | 2 +-
 package/libsrtp/libsrtp.mk                                  | 4 ++--
 package/libtpl/libtpl.hash                                  | 2 +-
 package/libtpl/libtpl.mk                                    | 4 ++--
 package/libuv/libuv.hash                                    | 2 +-
 package/libuv/libuv.mk                                      | 4 ++--
 package/libvpx/libvpx.hash                                  | 2 +-
 package/libvpx/libvpx.mk                                    | 4 ++--
 package/libwebsockets/libwebsockets.hash                    | 2 +-
 package/libwebsockets/libwebsockets.mk                      | 4 ++--
 package/liquid-dsp/liquid-dsp.hash                          | 2 +-
 package/liquid-dsp/liquid-dsp.mk                            | 4 ++--
 package/ljsyscall/ljsyscall.hash                            | 2 +-
 package/ljsyscall/ljsyscall.mk                              | 4 ++--
 package/lm-sensors/lm-sensors.hash                          | 2 +-
 package/lm-sensors/lm-sensors.mk                            | 4 ++--
 package/lua-sdl2/lua-sdl2.hash                              | 2 +-
 package/lua-sdl2/lua-sdl2.mk                                | 4 ++--
 package/lz4/lz4.hash                                        | 2 +-
 package/lz4/lz4.mk                                          | 4 ++--
 package/mfgtools/mfgtools.hash                              | 2 +-
 package/mfgtools/mfgtools.mk                                | 4 ++--
 package/micropython-lib/micropython-lib.hash                | 2 +-
 package/micropython-lib/micropython-lib.mk                  | 4 ++--
 package/micropython/micropython.hash                        | 2 +-
 package/micropython/micropython.mk                          | 4 ++--
 package/mini-snmpd/mini-snmpd.hash                          | 2 +-
 package/mini-snmpd/mini-snmpd.mk                            | 4 ++--
 package/mraa/mraa.hash                                      | 2 +-
 package/mraa/mraa.mk                                        | 4 ++--
 package/ne10/ne10.hash                                      | 2 +-
 package/ne10/ne10.mk                                        | 4 ++--
 package/nginx-dav-ext/nginx-dav-ext.hash                    | 2 +-
 package/nginx-dav-ext/nginx-dav-ext.mk                      | 4 ++--
 package/nilfs-utils/nilfs-utils.hash                        | 2 +-
 package/nilfs-utils/nilfs-utils.mk                          | 4 ++--
 package/ninja/ninja.hash                                    | 2 +-
 package/ninja/ninja.mk                                      | 4 ++--
 package/numactl/numactl.hash                                | 2 +-
 package/numactl/numactl.mk                                  | 4 ++--
 package/nvme/nvme.hash                                      | 2 +-
 package/nvme/nvme.mk                                        | 4 ++--
 package/openblas/openblas.hash                              | 2 +-
 package/openblas/openblas.mk                                | 4 ++--
 package/opentracing-cpp/opentracing-cpp.hash                | 2 +-
 package/opentracing-cpp/opentracing-cpp.mk                  | 4 ++--
 package/openzwave/openzwave.hash                            | 2 +-
 package/openzwave/openzwave.mk                              | 4 ++--
 package/paho-mqtt-c/paho-mqtt-c.hash                        | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk                          | 4 ++--
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash                    | 2 +-
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk                      | 4 ++--
 package/pdbg/pdbg.hash                                      | 2 +-
 package/pdbg/pdbg.mk                                        | 4 ++--
 package/pigpio/pigpio.hash                                  | 2 +-
 package/pigpio/pigpio.mk                                    | 4 ++--
 package/pigz/pigz.hash                                      | 2 +-
 package/pigz/pigz.mk                                        | 4 ++--
 package/powerpc-utils/powerpc-utils.hash                    | 2 +-
 package/powerpc-utils/powerpc-utils.mk                      | 4 ++--
 package/protobuf-c/protobuf-c.hash                          | 2 +-
 package/protobuf-c/protobuf-c.mk                            | 4 ++--
 package/python-configshell-fb/python-configshell-fb.hash    | 2 +-
 package/python-configshell-fb/python-configshell-fb.mk      | 4 ++--
 package/python-pydal/python-pydal.hash                      | 2 +-
 package/python-pydal/python-pydal.mk                        | 4 ++--
 package/python-pymodbus/python-pymodbus.hash                | 2 +-
 package/python-pymodbus/python-pymodbus.mk                  | 4 ++--
 package/python-pyparted/python-pyparted.hash                | 2 +-
 package/python-pyparted/python-pyparted.mk                  | 4 ++--
 package/python-remi/python-remi.hash                        | 2 +-
 package/python-remi/python-remi.mk                          | 4 ++--
 package/python-rtslib-fb/python-rtslib-fb.hash              | 2 +-
 package/python-rtslib-fb/python-rtslib-fb.mk                | 4 ++--
 package/python-scapy3k/python-scapy3k.hash                  | 2 +-
 package/python-scapy3k/python-scapy3k.mk                    | 4 ++--
 package/qdecoder/qdecoder.hash                              | 2 +-
 package/qdecoder/qdecoder.mk                                | 4 ++--
 package/qlibc/qlibc.hash                                    | 2 +-
 package/qlibc/qlibc.mk                                      | 4 ++--
 package/rabbitmq-c/rabbitmq-c.hash                          | 2 +-
 package/rabbitmq-c/rabbitmq-c.mk                            | 4 ++--
 package/rapidjson/rapidjson.hash                            | 2 +-
 package/rapidjson/rapidjson.mk                              | 4 ++--
 package/reaver/reaver.hash                                  | 2 +-
 package/reaver/reaver.mk                                    | 4 ++--
 package/runc/runc.hash                                      | 2 +-
 package/runc/runc.mk                                        | 4 ++--
 package/safeclib/safeclib.hash                              | 2 +-
 package/safeclib/safeclib.mk                                | 4 ++--
 package/shellinabox/shellinabox.hash                        | 2 +-
 package/shellinabox/shellinabox.mk                          | 4 ++--
 package/sngrep/sngrep.hash                                  | 2 +-
 package/sngrep/sngrep.mk                                    | 4 ++--
 package/softether/softether.hash                            | 2 +-
 package/softether/softether.mk                              | 4 ++--
 package/sqlcipher/sqlcipher.hash                            | 2 +-
 package/sqlcipher/sqlcipher.mk                              | 4 ++--
 package/sunxi-tools/sunxi-tools.hash                        | 2 +-
 package/sunxi-tools/sunxi-tools.mk                          | 4 ++--
 package/synergy/synergy.hash                                | 2 +-
 package/synergy/synergy.mk                                  | 4 ++--
 package/targetcli-fb/targetcli-fb.hash                      | 2 +-
 package/targetcli-fb/targetcli-fb.mk                        | 4 ++--
 package/tegrarcm/tegrarcm.hash                              | 2 +-
 package/tegrarcm/tegrarcm.mk                                | 4 ++--
 package/tini/tini.hash                                      | 2 +-
 package/tini/tini.mk                                        | 4 ++--
 package/tinycbor/tinycbor.hash                              | 2 +-
 package/tinycbor/tinycbor.mk                                | 4 ++--
 package/tinymembench/tinymembench.hash                      | 2 +-
 package/tinymembench/tinymembench.mk                        | 4 ++--
 package/turbolua/turbolua.hash                              | 2 +-
 package/turbolua/turbolua.mk                                | 4 ++--
 package/uccp420wlan/uccp420wlan.hash                        | 2 +-
 package/uccp420wlan/uccp420wlan.mk                          | 4 ++--
 package/uhubctl/uhubctl.hash                                | 2 +-
 package/uhubctl/uhubctl.mk                                  | 4 ++--
 package/v4l2loopback/v4l2loopback.hash                      | 2 +-
 package/v4l2loopback/v4l2loopback.mk                        | 4 ++--
 package/valijson/valijson.hash                              | 2 +-
 package/valijson/valijson.mk                                | 4 ++--
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash    | 2 +-
 package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk      | 4 ++--
 package/vim/vim.hash                                        | 2 +-
 package/vim/vim.mk                                          | 4 ++--
 package/vmtouch/vmtouch.hash                                | 2 +-
 package/vmtouch/vmtouch.mk                                  | 4 ++--
 package/waffle/waffle.hash                                  | 2 +-
 package/waffle/waffle.mk                                    | 4 ++--
 package/wampcc/wampcc.hash                                  | 2 +-
 package/wampcc/wampcc.mk                                    | 4 ++--
 package/wavemon/wavemon.hash                                | 2 +-
 package/wavemon/wavemon.mk                                  | 4 ++--
 package/xdotool/xdotool.hash                                | 2 +-
 package/xdotool/xdotool.mk                                  | 4 ++--
 package/xl2tp/xl2tp.hash                                    | 2 +-
 package/xl2tp/xl2tp.mk                                      | 4 ++--
 package/xxhash/xxhash.hash                                  | 2 +-
 package/xxhash/xxhash.mk                                    | 4 ++--
 package/ympd/ympd.hash                                      | 2 +-
 package/ympd/ympd.mk                                        | 4 ++--
 package/zstd/zstd.hash                                      | 2 +-
 package/zstd/zstd.mk                                        | 4 ++--
 package/zyre/zyre.hash                                      | 2 +-
 package/zyre/zyre.mk                                        | 4 ++--
 353 files changed, 532 insertions(+), 532 deletions(-)

diff --git a/boot/afboot-stm32/afboot-stm32.hash b/boot/afboot-stm32/afboot-stm32.hash
index d23b74ad21..431fbc3305 100644
--- a/boot/afboot-stm32/afboot-stm32.hash
+++ b/boot/afboot-stm32/afboot-stm32.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 dbd715c8b99f7d266f74a04707a4dac76b75b31321f24dee5256a6348260530c  afboot-stm32-v0.1.tar.gz
+sha256 dbd715c8b99f7d266f74a04707a4dac76b75b31321f24dee5256a6348260530c  afboot-stm32-0.1.tar.gz
diff --git a/boot/afboot-stm32/afboot-stm32.mk b/boot/afboot-stm32/afboot-stm32.mk
index 5e221cf364..ee17fab5ff 100644
--- a/boot/afboot-stm32/afboot-stm32.mk
+++ b/boot/afboot-stm32/afboot-stm32.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AFBOOT_STM32_VERSION = v0.1
-AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,$(AFBOOT_STM32_VERSION))
+AFBOOT_STM32_VERSION = 0.1
+AFBOOT_STM32_SITE = $(call github,mcoquelin-stm32,afboot-stm32,v$(AFBOOT_STM32_VERSION))
 AFBOOT_STM32_INSTALL_IMAGES = YES
 AFBOOT_STM32_INSTALL_TARGET = NO
 
diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
index 822c2dc9ce..d8449f573a 100644
--- a/boot/opensbi/opensbi.hash
+++ b/boot/opensbi/opensbi.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a224be300 opensbi-v0.3.tar.gz
+sha256 07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a224be300 opensbi-0.3.tar.gz
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index b0b413abf9..45a3fc4859 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENSBI_VERSION = v0.3
-OPENSBI_SITE = $(call github,riscv,opensbi,$(OPENSBI_VERSION))
+OPENSBI_VERSION = 0.3
+OPENSBI_SITE = $(call github,riscv,opensbi,v$(OPENSBI_VERSION))
 OPENSBI_LICENSE = BSD-2-Clause
 OPENSBI_LICENSE_FILES = COPYING.BSD
 OPENSBI_INSTALL_TARGET = NO
diff --git a/package/a10disp/a10disp.hash b/package/a10disp/a10disp.hash
index a1ec11c759..f1bddec5df 100644
--- a/package/a10disp/a10disp.hash
+++ b/package/a10disp/a10disp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5077405030e8f97a1edd4b86d469466abbc4d32b4a4609e58459347fcd1ba35b a10disp-v0.6.1.tar.gz
+sha256 5077405030e8f97a1edd4b86d469466abbc4d32b4a4609e58459347fcd1ba35b a10disp-0.6.1.tar.gz
diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
index 7353edea62..4c2ee14e29 100644
--- a/package/a10disp/a10disp.mk
+++ b/package/a10disp/a10disp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-A10DISP_VERSION = v0.6.1
-A10DISP_SITE = $(call github,hglm,a10disp,$(A10DISP_VERSION))
+A10DISP_VERSION = 0.6.1
+A10DISP_SITE = $(call github,hglm,a10disp,v$(A10DISP_VERSION))
 A10DISP_LICENSE = MIT
 
 A10DISP_DEPENDENCIES = linux
diff --git a/package/angular-websocket/angular-websocket.hash b/package/angular-websocket/angular-websocket.hash
index 36700684b9..550101e3aa 100644
--- a/package/angular-websocket/angular-websocket.hash
+++ b/package/angular-websocket/angular-websocket.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 69d752896bc17c08750a2fda24b5eb3c6d653afc6f406dd90a6b7c920b22a14a  angular-websocket-v2.0.0.tar.gz
+sha256 69d752896bc17c08750a2fda24b5eb3c6d653afc6f406dd90a6b7c920b22a14a  angular-websocket-2.0.0.tar.gz
diff --git a/package/angular-websocket/angular-websocket.mk b/package/angular-websocket/angular-websocket.mk
index b422847e2d..d45bfdf910 100644
--- a/package/angular-websocket/angular-websocket.mk
+++ b/package/angular-websocket/angular-websocket.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ANGULAR_WEBSOCKET_VERSION = v2.0.0
-ANGULAR_WEBSOCKET_SITE = $(call github,AngularClass,angular-websocket,$(ANGULAR_WEBSOCKET_VERSION))
+ANGULAR_WEBSOCKET_VERSION = 2.0.0
+ANGULAR_WEBSOCKET_SITE = $(call github,AngularClass,angular-websocket,v$(ANGULAR_WEBSOCKET_VERSION))
 ANGULAR_WEBSOCKET_LICENSE = MIT
 ANGULAR_WEBSOCKET_LICENSE_FILES = LICENSE
 
diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index bee26fb4f3..f97fd646b5 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 187f825c563e84b1b17527a4da0351aa3d575dfd696a9d204ae4bb19ee7df94a  assimp-v3.2.tar.gz
+sha256 187f825c563e84b1b17527a4da0351aa3d575dfd696a9d204ae4bb19ee7df94a  assimp-3.2.tar.gz
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 5720f9793f..292e337400 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = v3.2
-ASSIMP_SITE = $(call github,assimp,assimp,$(ASSIMP_VERSION))
+ASSIMP_VERSION = 3.2
+ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
 ASSIMP_DEPENDENCIES = zlib
diff --git a/package/azmq/azmq.hash b/package/azmq/azmq.hash
index 35139cfaeb..f5d24e79ce 100644
--- a/package/azmq/azmq.hash
+++ b/package/azmq/azmq.hash
@@ -1,4 +1,4 @@
 # Locally calculated
 # https://github.com/zeromq/azmq/archive/v1.0.2.tar.gz
-sha256 25fa8b07756cffae95e25a55c7ea42efe02e8cd797552201aa771dd69cfc8fbf  azmq-v1.0.2.tar.gz
+sha256 25fa8b07756cffae95e25a55c7ea42efe02e8cd797552201aa771dd69cfc8fbf  azmq-1.0.2.tar.gz
 sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-BOOST_1_0
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
index 9ccb407a65..918c6e1a36 100644
--- a/package/azmq/azmq.mk
+++ b/package/azmq/azmq.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-AZMQ_VERSION = v1.0.2
-AZMQ_SITE = $(call github,zeromq,azmq,$(AZMQ_VERSION))
+AZMQ_VERSION = 1.0.2
+AZMQ_SITE = $(call github,zeromq,azmq,v$(AZMQ_VERSION))
 AZMQ_DEPENDENCIES = boost zeromq
 AZMQ_LICENSE = BSL-1.0
 AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
diff --git a/package/bandwidthd/bandwidthd.hash b/package/bandwidthd/bandwidthd.hash
index 248f9ff961..c73584de2e 100644
--- a/package/bandwidthd/bandwidthd.hash
+++ b/package/bandwidthd/bandwidthd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0270d0def6cc53c8d47d59a9dd093d51fbca1620adeef85c15e35a32010e26ab  bandwidthd-v2.0.1-auto-r11.tar.gz
+sha256 0270d0def6cc53c8d47d59a9dd093d51fbca1620adeef85c15e35a32010e26ab  bandwidthd-2.0.1-auto-r11.tar.gz
diff --git a/package/bandwidthd/bandwidthd.mk b/package/bandwidthd/bandwidthd.mk
index 2773490428..e9bc871a6a 100644
--- a/package/bandwidthd/bandwidthd.mk
+++ b/package/bandwidthd/bandwidthd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BANDWIDTHD_VERSION = v2.0.1-auto-r11
-BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,$(BANDWIDTHD_VERSION))
+BANDWIDTHD_VERSION = 2.0.1-auto-r11
+BANDWIDTHD_SITE = $(call github,nroach44,bandwidthd,v$(BANDWIDTHD_VERSION))
 
 # Specified as "any version of the GPL that is current as of your
 # download" by upstream.
diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index 04e00ab601..4d10d785d6 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 855d8b8bed466bc505e61123d12885500ef6fcdb317ace1b668087364717ea82  bats-core-v1.1.0.tar.gz
+sha256 855d8b8bed466bc505e61123d12885500ef6fcdb317ace1b668087364717ea82  bats-core-1.1.0.tar.gz
 
 # License files
 sha256 55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index 739e7fc1f0..eee38056fe 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = v1.1.0
-BATS_CORE_SITE = $(call github,bats-core,bats-core,$(BATS_CORE_VERSION))
+BATS_CORE_VERSION = 1.1.0
+BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md
 
diff --git a/package/bcache-tools/bcache-tools.hash b/package/bcache-tools/bcache-tools.hash
index 6d3502fc29..4213705f35 100644
--- a/package/bcache-tools/bcache-tools.hash
+++ b/package/bcache-tools/bcache-tools.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d56923936f37287efc57a46315679102ef2c86cd0be5874590320acd48c1201c  bcache-tools-v1.0.8.tar.gz
+sha256 d56923936f37287efc57a46315679102ef2c86cd0be5874590320acd48c1201c  bcache-tools-1.0.8.tar.gz
diff --git a/package/bcache-tools/bcache-tools.mk b/package/bcache-tools/bcache-tools.mk
index 0e7a2821cd..4ff10cc4eb 100644
--- a/package/bcache-tools/bcache-tools.mk
+++ b/package/bcache-tools/bcache-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BCACHE_TOOLS_VERSION = v1.0.8
-BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
+BCACHE_TOOLS_VERSION = 1.0.8
+BCACHE_TOOLS_SITE = $(call github,g2p,bcache-tools,v$(BCACHE_TOOLS_VERSION))
 BCACHE_TOOLS_LICENSE = GPL-2.0
 BCACHE_TOOLS_LICENSE_FILES = COPYING
 BCACHE_TOOLS_DEPENDENCIES = host-pkgconf util-linux
diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index 384428f880..afc84329b3 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  6287ae6135795a78470068ef9d9ea660d556cefc409905bd9211fda04d1e1f8e  bluez-alsa-v1.4.0.tar.gz
+sha256  6287ae6135795a78470068ef9d9ea660d556cefc409905bd9211fda04d1e1f8e  bluez-alsa-1.4.0.tar.gz
 sha256  45fe8648faa0e735d4aaf60c32ddd37fc7f027d34ccedcf0f69d8aa961b63b25  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index c1806aef8b..4552be82f3 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = v1.4.0
-BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,$(BLUEZ_ALSA_VERSION))
+BLUEZ_ALSA_VERSION = 1.4.0
+BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
 BLUEZ_ALSA_DEPENDENCIES = alsa-lib bluez5_utils libglib2 sbc host-pkgconf
diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index 745e44a71c..8f3bd8a3da 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 50665a4f298b30e4cc8f7dbd38362fd860cc3746803d00325cb04806674e3166  c-periphery-v1.1.3.tar.gz
+sha256 50665a4f298b30e4cc8f7dbd38362fd860cc3746803d00325cb04806674e3166  c-periphery-1.1.3.tar.gz
 sha256 6b5669a90260126f0600aae98cb10fb5e219269dc9cbd0137f63927b96d5c31d  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index df26105541..e62d3e05ca 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = v1.1.3
-C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,$(C_PERIPHERY_VERSION))
+C_PERIPHERY_VERSION = 1.1.3
+C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 # only a static library
 C_PERIPHERY_INSTALL_TARGET = NO
diff --git a/package/can-utils/can-utils.hash b/package/can-utils/can-utils.hash
index 2034c35a87..403c59787e 100644
--- a/package/can-utils/can-utils.hash
+++ b/package/can-utils/can-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  370ad4b19447c29099f7300548f1a3362d6e123c4a6a827dbbd3110bc2c26839  can-utils-v2018.02.0.tar.gz
+sha256  370ad4b19447c29099f7300548f1a3362d6e123c4a6a827dbbd3110bc2c26839  can-utils-2018.02.0.tar.gz
 sha256  c258939ebb09c3857f5fc7704a449e5077cc881090c87b38f9a81332b96fa075  Makefile
diff --git a/package/can-utils/can-utils.mk b/package/can-utils/can-utils.mk
index bff4d21fef..7e919a3efa 100644
--- a/package/can-utils/can-utils.mk
+++ b/package/can-utils/can-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CAN_UTILS_VERSION = v2018.02.0
-CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
+CAN_UTILS_VERSION = 2018.02.0
+CAN_UTILS_SITE = $(call github,linux-can,can-utils,v$(CAN_UTILS_VERSION))
 CAN_UTILS_LICENSE = BSD-3-Clause or GPL-2.0, GPL-2.0+
 CAN_UTILS_LICENSE_FILES = Makefile
 CAN_UTILS_AUTORECONF = YES
diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index 1a65cdd401..bc6a27684b 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	85210424c09693d8fe158c1970a2bca37af3a0424f02b263f566a1b8a5451a2d  capnproto-v0.6.1.tar.gz
+sha256	85210424c09693d8fe158c1970a2bca37af3a0424f02b263f566a1b8a5451a2d  capnproto-0.6.1.tar.gz
 sha256	16194222e9412c3aa14d2287953f7fc89a1dcbcdd266d1534ba35060d4cde5b6  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index ff7a5bc15b..3c7965d60c 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = v0.6.1
-CAPNPROTO_SITE = $(call github,capnproto,capnproto,$(CAPNPROTO_VERSION))
+CAPNPROTO_VERSION = 0.6.1
+CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
 CAPNPROTO_INSTALL_STAGING = YES
diff --git a/package/cbootimage/cbootimage.hash b/package/cbootimage/cbootimage.hash
index 96cf172e39..01342cdc91 100644
--- a/package/cbootimage/cbootimage.hash
+++ b/package/cbootimage/cbootimage.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 373c108d7b6778c62a33e59ad0cd5ea9ebb379319a0c8b4cf469eaa8bec5521b  cbootimage-v1.7.tar.gz
+sha256 373c108d7b6778c62a33e59ad0cd5ea9ebb379319a0c8b4cf469eaa8bec5521b  cbootimage-1.7.tar.gz
diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
index 40a248aed6..107ae70920 100644
--- a/package/cbootimage/cbootimage.mk
+++ b/package/cbootimage/cbootimage.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CBOOTIMAGE_VERSION = v1.7
-CBOOTIMAGE_SITE = $(call github,NVIDIA,cbootimage,$(CBOOTIMAGE_VERSION))
+CBOOTIMAGE_VERSION = 1.7
+CBOOTIMAGE_SITE = $(call github,NVIDIA,cbootimage,v$(CBOOTIMAGE_VERSION))
 CBOOTIMAGE_LICENSE = GPL-2.0
 CBOOTIMAGE_LICENSE_FILES = COPYING
 CBOOTIMAGE_AUTORECONF = YES
diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index 23f7c4acac..e6f60ff1dc 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 de7d5e7a2d9551d325898c71e41d437d5f7b51e754b242af897f7be96e713a42  civetweb-v1.11.tar.gz
+sha256 de7d5e7a2d9551d325898c71e41d437d5f7b51e754b242af897f7be96e713a42  civetweb-1.11.tar.gz
 sha256 1cd00da00b8649b4005757f4019acfd3102ecd407f47998081697e8e9086f706  LICENSE.md
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 1652239ebb..99da1b6f06 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = v1.11
-CIVETWEB_SITE = $(call github,civetweb,civetweb,$(CIVETWEB_VERSION))
+CIVETWEB_VERSION = 1.11
+CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
 
diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index d980fc85a3..a02158321a 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 760687665ab41a5cff9c40b1053c19572bcdaadef1194e5cba1b5e6f824686e7  cjson-v1.7.12.tar.gz
+sha256 760687665ab41a5cff9c40b1053c19572bcdaadef1194e5cba1b5e6f824686e7  cjson-1.7.12.tar.gz
 sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ae09ea95ed..b61d1ceb1b 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CJSON_VERSION = v1.7.12
-CJSON_SITE = $(call github,DaveGamble,cjson,$(CJSON_VERSION))
+CJSON_VERSION = 1.7.12
+CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 39cf2afdbd..3aec4ca378 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,5 +1,5 @@
 # Locally generated
-sha256 755c68029bbd05a17784262e56021362740783d15868dab9402a125ef35eedaf  cog-v0.3.0.tar.gz
+sha256 755c68029bbd05a17784262e56021362740783d15868dab9402a125ef35eedaf  cog-0.3.0.tar.gz
 
 # Hashes for license files:
 sha256 e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index b56a772a25..98b0aa6f7a 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-COG_VERSION = v0.3.0
-COG_SITE = $(call github,Igalia,cog,$(COG_VERSION))
+COG_VERSION = 0.3.0
+COG_SITE = $(call github,Igalia,cog,v$(COG_VERSION))
 COG_INSTALL_STAGING = YES
 COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
 COG_LICENSE = MIT
diff --git a/package/corkscrew/corkscrew.hash b/package/corkscrew/corkscrew.hash
index c6dee95d85..4006c6abaf 100644
--- a/package/corkscrew/corkscrew.hash
+++ b/package/corkscrew/corkscrew.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  09d70daaa3145070a1e463dbab6ae1cbc62449b1e09c94e158f6017e7c79c9f6  corkscrew-v2.0.tar.gz
+sha256  09d70daaa3145070a1e463dbab6ae1cbc62449b1e09c94e158f6017e7c79c9f6  corkscrew-2.0.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/corkscrew/corkscrew.mk b/package/corkscrew/corkscrew.mk
index ae90df80b7..de696bad64 100644
--- a/package/corkscrew/corkscrew.mk
+++ b/package/corkscrew/corkscrew.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CORKSCREW_VERSION = v2.0
-CORKSCREW_SITE = $(call github,bryanpkc,corkscrew,$(CORKSCREW_VERSION))
+CORKSCREW_VERSION = 2.0
+CORKSCREW_SITE = $(call github,bryanpkc,corkscrew,v$(CORKSCREW_VERSION))
 CORKSCREW_LICENSE = GPL-2.0
 CORKSCREW_LICENSE_FILES = COPYING
 CORKSCREW_AUTORECONF = YES
diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 52308d1ea6..54406ad72d 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 27d1f56406ba94ee779e639203218820975cf68174f92fbeae0f645df0fcada4  cppzmq-v4.3.0.tar.gz
+sha256 27d1f56406ba94ee779e639203218820975cf68174f92fbeae0f645df0fcada4  cppzmq-4.3.0.tar.gz
 sha256 7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index d23366e1d3..aab6e71afb 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = v4.3.0
-CPPZMQ_SITE = $(call github,zeromq,cppzmq,$(CPPZMQ_VERSION))
+CPPZMQ_VERSION = 4.3.0
+CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
 CPPZMQ_LICENSE = MIT
diff --git a/package/cpuload/cpuload.hash b/package/cpuload/cpuload.hash
index 02861ffa95..2a32283500 100644
--- a/package/cpuload/cpuload.hash
+++ b/package/cpuload/cpuload.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 1d61f4776dc3e2746343d68b2ea2faf138e54666b630a6060df4f3945badbcae  cpuload-v0.3.tar.gz
+sha256 1d61f4776dc3e2746343d68b2ea2faf138e54666b630a6060df4f3945badbcae  cpuload-0.3.tar.gz
diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
index e792952a4e..648b17e59e 100644
--- a/package/cpuload/cpuload.mk
+++ b/package/cpuload/cpuload.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CPULOAD_VERSION = v0.3
-CPULOAD_SITE = $(call github,kelvincheung,cpuload,$(CPULOAD_VERSION))
+CPULOAD_VERSION = 0.3
+CPULOAD_SITE = $(call github,kelvincheung,cpuload,v$(CPULOAD_VERSION))
 CPULOAD_LICENSE = GPL-2.0
 CPULOAD_LICENSE_FILES = COPYING
 
diff --git a/package/davici/davici.hash b/package/davici/davici.hash
index 257e902ce7..178d87f2e2 100644
--- a/package/davici/davici.hash
+++ b/package/davici/davici.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d3e5e806ecca841d7e133a3df768062df59f4b4c76bf98e0f90aa8064721b3bd  davici-v1.3.tar.gz
+sha256 d3e5e806ecca841d7e133a3df768062df59f4b4c76bf98e0f90aa8064721b3bd  davici-1.3.tar.gz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/davici/davici.mk b/package/davici/davici.mk
index 5c4b9774ea..a90eeeefef 100644
--- a/package/davici/davici.mk
+++ b/package/davici/davici.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DAVICI_VERSION = v1.3
-DAVICI_SITE = $(call github,strongswan,davici,$(DAVICI_VERSION))
+DAVICI_VERSION = 1.3
+DAVICI_SITE = $(call github,strongswan,davici,v$(DAVICI_VERSION))
 DAVICI_LICENSE = LGPL-2.1+
 DAVICI_LICENSE_FILES = COPYING
 DAVICI_DEPENDENCIES = strongswan
diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index e8af45ccea..4abc5cf91a 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	02bcb73dde1c9542fa65c8b87078aaa1b01b0dbdd62346637bcf0999a2a0909f  docker-cli-v18.09.6.tar.gz
+sha256	02bcb73dde1c9542fa65c8b87078aaa1b01b0dbdd62346637bcf0999a2a0909f  docker-cli-18.09.6.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index b71bd7097d..eef492d625 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = v18.09.6
-DOCKER_CLI_SITE = $(call github,docker,cli,$(DOCKER_CLI_VERSION))
+DOCKER_CLI_VERSION = 18.09.6
+DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 DOCKER_CLI_WORKSPACE = gopath
 
 DOCKER_CLI_LICENSE = Apache-2.0
diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 525191c651..2e275dd81e 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256	f2d578b743fb9faa5b3477b7cf4b33d00501087043a53b27754f14bbe741f891  docker-containerd-v1.2.6.tar.gz
+sha256	f2d578b743fb9faa5b3477b7cf4b33d00501087043a53b27754f14bbe741f891  docker-containerd-1.2.6.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4	LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index c67b36e7dc..22480d1df8 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = v1.2.6
-DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
+DOCKER_CONTAINERD_VERSION = 1.2.6
+DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,v$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
 
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 4e673f2856..5beceea04b 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	7cb45266fff79245c81ec86c455d4b0513ca5d4ec1b9be8c8330df30a9467481  docker-engine-v18.09.6.tar.gz
+sha256	7cb45266fff79245c81ec86c455d4b0513ca5d4ec1b9be8c8330df30a9467481  docker-engine-18.09.6.tar.gz
 sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 50d4129256..dd23c59d16 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v18.09.6
-DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = 18.09.6
+DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
diff --git a/package/dtach/dtach.hash b/package/dtach/dtach.hash
index c643264f84..5caa58e5c0 100644
--- a/package/dtach/dtach.hash
+++ b/package/dtach/dtach.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  5f7e8c835ee49a9e6dcf89f4e8ccbe724b061c0fc8565b504dd8b3e67ab79f82  dtach-v0.9.tar.gz
+sha256  5f7e8c835ee49a9e6dcf89f4e8ccbe724b061c0fc8565b504dd8b3e67ab79f82  dtach-0.9.tar.gz
diff --git a/package/dtach/dtach.mk b/package/dtach/dtach.mk
index 571481cdda..3cbf37e257 100644
--- a/package/dtach/dtach.mk
+++ b/package/dtach/dtach.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DTACH_VERSION = v0.9
-DTACH_SITE = $(call github,crigler,dtach,$(DTACH_VERSION))
+DTACH_VERSION = 0.9
+DTACH_SITE = $(call github,crigler,dtach,v$(DTACH_VERSION))
 DTACH_LICENSE = GPL-2.0+
 DTACH_LICENSE_FILES = COPYING
 
diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
index 100af58d60..f0e2a71d4d 100644
--- a/package/duktape/duktape.hash
+++ b/package/duktape/duktape.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	0df1c0a9d40bfae31733e5c44f0eabaeae59e0a2ebf7693ff68bbabd49aae331	duktape-v2.3.0.tar.gz
+sha256	0df1c0a9d40bfae31733e5c44f0eabaeae59e0a2ebf7693ff68bbabd49aae331	duktape-2.3.0.tar.gz
 sha256	9aabee442709a6e7652348b9617ae26d26da6b270c1f4b6fce4a1e746acb3df0	LICENSE.txt
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 97b51f94b1..7d7eb15f8f 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DUKTAPE_VERSION = v2.3.0
-DUKTAPE_SITE = $(call github,svaarala,duktape-releases,$(DUKTAPE_VERSION))
+DUKTAPE_VERSION = 2.3.0
+DUKTAPE_SITE = $(call github,svaarala,duktape-releases,v$(DUKTAPE_VERSION))
 DUKTAPE_LICENSE = MIT
 DUKTAPE_LICENSE_FILES = LICENSE.txt
 DUKTAPE_INSTALL_STAGING = YES
diff --git a/package/faifa/faifa.hash b/package/faifa/faifa.hash
index b4c27418f7..5d45e5db9d 100644
--- a/package/faifa/faifa.hash
+++ b/package/faifa/faifa.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  6eada81f3d21f80b5848338b627784981064d728f8e377e5cf973d31640d4489  faifa-v0.1.tar.gz
+sha256  6eada81f3d21f80b5848338b627784981064d728f8e377e5cf973d31640d4489  faifa-0.1.tar.gz
diff --git a/package/faifa/faifa.mk b/package/faifa/faifa.mk
index af7a1741ff..e5dc157482 100644
--- a/package/faifa/faifa.mk
+++ b/package/faifa/faifa.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FAIFA_VERSION = v0.1
-FAIFA_SITE = $(call github,ffainelli,faifa,$(FAIFA_VERSION))
+FAIFA_VERSION = 0.1
+FAIFA_SITE = $(call github,ffainelli,faifa,v$(FAIFA_VERSION))
 FAIFA_INSTALL_STAGING = YES
 FAIFA_DEPENDENCIES = libpcap host-autoconf
 FAIFA_LICENSE = BSD-3-Clause
diff --git a/package/faketime/faketime.hash b/package/faketime/faketime.hash
index a17ef8526b..5203fdb12a 100644
--- a/package/faketime/faketime.hash
+++ b/package/faketime/faketime.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 56bc32006f4c5b021ff648cc1fd458c5316f40aadfd2031879229a234189b031 faketime-v0.9.6.tar.gz
+sha256 56bc32006f4c5b021ff648cc1fd458c5316f40aadfd2031879229a234189b031 faketime-0.9.6.tar.gz
diff --git a/package/faketime/faketime.mk b/package/faketime/faketime.mk
index 6c88a71aa3..0a72feb866 100644
--- a/package/faketime/faketime.mk
+++ b/package/faketime/faketime.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FAKETIME_VERSION = v0.9.6
-FAKETIME_SITE = $(call github,wolfcw,libfaketime,$(FAKETIME_VERSION))
+FAKETIME_VERSION = 0.9.6
+FAKETIME_SITE = $(call github,wolfcw,libfaketime,v$(FAKETIME_VERSION))
 FAKETIME_LICENSE = GPL-2.0
 FAKETIME_LICENSE_FILES = COPYING
 
diff --git a/package/flare-engine/flare-engine.hash b/package/flare-engine/flare-engine.hash
index 8c6fc3ab1b..e03bcc589e 100644
--- a/package/flare-engine/flare-engine.hash
+++ b/package/flare-engine/flare-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4bbd4674513b643be6294188904665c53f0ef2912e803212c05e8fd22a44d74d  flare-engine-v1.0.tar.gz
+sha256  4bbd4674513b643be6294188904665c53f0ef2912e803212c05e8fd22a44d74d  flare-engine-1.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index 8a656d695f..ed9dd19b0e 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLARE_ENGINE_VERSION = v1.0
-FLARE_ENGINE_SITE =  $(call github,clintbellanger,flare-engine,$(FLARE_ENGINE_VERSION))
+FLARE_ENGINE_VERSION = 1.0
+FLARE_ENGINE_SITE =  $(call github,clintbellanger,flare-engine,v$(FLARE_ENGINE_VERSION))
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
 
diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
index a27c66d9e3..51646269a3 100644
--- a/package/flare-game/flare-game.hash
+++ b/package/flare-game/flare-game.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5c8e9d72fcbe59f1861f79ac7b76ceffe3ec61d1df241c32d9133fe158fba4c1  flare-game-v1.0.tar.gz
+sha256  5c8e9d72fcbe59f1861f79ac7b76ceffe3ec61d1df241c32d9133fe158fba4c1  flare-game-1.0.tar.gz
 sha256  9fce5eb663f136449e11293a871ed96db5ba579116a927fc6a70dd20a4a5b9e6  README
diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
index 89750d99b1..a70e998d0e 100644
--- a/package/flare-game/flare-game.mk
+++ b/package/flare-game/flare-game.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLARE_GAME_VERSION = v1.0
-FLARE_GAME_SITE =  $(call github,clintbellanger,flare-game,$(FLARE_GAME_VERSION))
+FLARE_GAME_VERSION = 1.0
+FLARE_GAME_SITE =  $(call github,clintbellanger,flare-game,v$(FLARE_GAME_VERSION))
 FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
 	OFL-1.1 (Liberation Sans)
 FLARE_GAME_LICENSE_FILES = README
diff --git a/package/flatbuffers/flatbuffers.hash b/package/flatbuffers/flatbuffers.hash
index 7afe849cd7..673e0026b0 100644
--- a/package/flatbuffers/flatbuffers.hash
+++ b/package/flatbuffers/flatbuffers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	3714e3db8c51e43028e10ad7adffb9a36fc4aa5b1a363c2d0c4303dd1be59a7c	flatbuffers-v1.10.0.tar.gz
+sha256	3714e3db8c51e43028e10ad7adffb9a36fc4aa5b1a363c2d0c4303dd1be59a7c	flatbuffers-1.10.0.tar.gz
 sha256	7ec9661a8afafab1eee3523d6f1a193eff76314a5ab10b4ce96aefd87621b0c3	LICENSE.txt
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 69054885ea..c4ea5e1b1c 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLATBUFFERS_VERSION = v1.10.0
-FLATBUFFERS_SITE = $(call github,google,flatbuffers,$(FLATBUFFERS_VERSION))
+FLATBUFFERS_VERSION = 1.10.0
+FLATBUFFERS_SITE = $(call github,google,flatbuffers,v$(FLATBUFFERS_VERSION))
 FLATBUFFERS_LICENSE = Apache-2.0
 FLATBUFFERS_LICENSE_FILES = LICENSE.txt
 FLATBUFFERS_INSTALL_STAGING = YES
diff --git a/package/flatcc/flatcc.hash b/package/flatcc/flatcc.hash
index b517250472..b8a50edf01 100644
--- a/package/flatcc/flatcc.hash
+++ b/package/flatcc/flatcc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	02dac93d3daf8d0a290aa8711a9b8a53f047436ec5331adb1972389061ec6615  flatcc-v0.5.2.tar.gz
+sha256	02dac93d3daf8d0a290aa8711a9b8a53f047436ec5331adb1972389061ec6615  flatcc-0.5.2.tar.gz
 sha256	c8f0d9c1f92c658d87ebd854ee7447a3d3912d2c3a5c78c117787be5d5da8af3  LICENSE
diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index 1c8d0ec7fb..7a7c108af6 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLATCC_VERSION = v0.5.2
-FLATCC_SITE = $(call github,dvidelabs,flatcc,$(FLATCC_VERSION))
+FLATCC_VERSION = 0.5.2
+FLATCC_SITE = $(call github,dvidelabs,flatcc,v$(FLATCC_VERSION))
 FLATCC_LICENSE = Apache-2.0
 FLATCC_LICENSE_FILES = LICENSE
 FLATCC_INSTALL_STAGING = YES
diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index e266168acc..2ea11d5fe4 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-v4.7.0.tar.gz
+sha256 de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-4.7.0.tar.gz
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index f39401041a..666346be0e 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FONT_AWESOME_VERSION = v4.7.0
-FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
+FONT_AWESOME_VERSION = 4.7.0
+FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,v$(FONT_AWESOME_VERSION))
 FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
 FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
 
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
index 475556ebe9..a863dbfcf7 100644
--- a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0dec5b78f655e175936806396b89b4997c8e543a1c84683a19ea2b6f36e01d7e  freeswitch-mod-bcg729-v1.0.4.tar.gz
+sha256 0dec5b78f655e175936806396b89b4997c8e543a1c84683a19ea2b6f36e01d7e  freeswitch-mod-bcg729-1.0.4.tar.gz
 sha256 bb4680b13c3190429464a8308a07d7d891e6454349fb7be856e02405b25b1195  LICENSE
diff --git a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
index 98324b2a08..f92a490051 100644
--- a/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
+++ b/package/freeswitch-mod-bcg729/freeswitch-mod-bcg729.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FREESWITCH_MOD_BCG729_VERSION = v1.0.4
-FREESWITCH_MOD_BCG729_SITE = $(call github,xadhoom,mod_bcg729,$(FREESWITCH_MOD_BCG729_VERSION))
+FREESWITCH_MOD_BCG729_VERSION = 1.0.4
+FREESWITCH_MOD_BCG729_SITE = $(call github,xadhoom,mod_bcg729,v$(FREESWITCH_MOD_BCG729_VERSION))
 FREESWITCH_MOD_BCG729_LICENSE = MPL-1.1
 FREESWITCH_MOD_BCG729_LICENSE_FILES = LICENSE
 FREESWITCH_MOD_BCG729_DEPENDENCIES = freeswitch bcg729
diff --git a/package/fwup/fwup.hash b/package/fwup/fwup.hash
index 73bff448de..337883f9a8 100644
--- a/package/fwup/fwup.hash
+++ b/package/fwup/fwup.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 20302dc96cef88438034e15551e178bb0652c28d99aa7ca5260100cb3bebbc2a  fwup-v1.2.5.tar.gz
+sha256 20302dc96cef88438034e15551e178bb0652c28d99aa7ca5260100cb3bebbc2a  fwup-1.2.5.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index be0b1d13b8..e1e5467765 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FWUP_VERSION = v1.2.5
-FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
+FWUP_VERSION = 1.2.5
+FWUP_SITE = $(call github,fhunleth,fwup,v$(FWUP_VERSION))
 FWUP_LICENSE = Apache-2.0
 FWUP_LICENSE_FILES = LICENSE
 FWUP_DEPENDENCIES = host-pkgconf libconfuse libarchive libsodium
diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index aa6a29f81e..92a84c1aa6 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	9c4509189eab6bff0fe183e1dd54ea8cb17d7fb0bc6e21bb5b1a8ccaaf6c60d9	gerbera-v1.3.1.tar.gz
+sha256	9c4509189eab6bff0fe183e1dd54ea8cb17d7fb0bc6e21bb5b1a8ccaaf6c60d9	gerbera-1.3.1.tar.gz
 sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 5b69faaf82..f868c72b57 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GERBERA_VERSION = v1.3.1
-GERBERA_SITE = $(call github,gerbera,gerbera,$(GERBERA_VERSION))
+GERBERA_VERSION = 1.3.1
+GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
 GERBERA_DEPENDENCIES = \
diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
index 3cae2b03bb..18483b1101 100644
--- a/package/gflags/gflags.hash
+++ b/package/gflags/gflags.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256	466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88	gflags-v2.2.0.tar.gz
+sha256	466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88	gflags-2.2.0.tar.gz
 
 # Hash for license file:
 sha256 90d1f3701813c3cd65eee2dc736746fe46b465918f3f7d6d31463a2018b33fa5  COPYING.txt
diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
index 45186a33c6..920100c13f 100644
--- a/package/gflags/gflags.mk
+++ b/package/gflags/gflags.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GFLAGS_VERSION = v2.2.0
-GFLAGS_SITE = $(call github,gflags,gflags,$(GFLAGS_VERSION))
+GFLAGS_VERSION = 2.2.0
+GFLAGS_SITE = $(call github,gflags,gflags,v$(GFLAGS_VERSION))
 GFLAGS_INSTALL_STAGING = YES
 GFLAGS_LICENSE = BSD-3-Clause
 GFLAGS_LICENSE_FILES = COPYING.txt
diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index 909e072b66..6d75c32284 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0  glog-v0.3.5.tar.gz
+sha256 7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0  glog-0.3.5.tar.gz
 
 # Hash for License file:
 sha256 0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 3f17529f58..39bcf82ef8 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLOG_VERSION = v0.3.5
-GLOG_SITE = $(call github,google,glog,$(GLOG_VERSION))
+GLOG_VERSION = 0.3.5
+GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
 GLOG_LICENSE = BSD-3-Clause
 GLOG_LICENSE_FILES = COPYING
diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 7c1fc9852f..78df7f05be 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256 c4e836c552dc99bf383ca84b2ddc0c67e3d05b073676318e2a011bcd463303ef  gqrx-v2.11.4.tar.gz
+sha256 c4e836c552dc99bf383ca84b2ddc0c67e3d05b073676318e2a011bcd463303ef  gqrx-2.11.4.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index d93c07d10c..e70d349cdc 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GQRX_VERSION = v2.11.4
-GQRX_SITE = $(call github,csete,gqrx,$(GQRX_VERSION))
+GQRX_VERSION = 2.11.4
+GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
 GQRX_DEPENDENCIES = boost gnuradio gr-osmosdr qt5base qt5svg
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 3ccf3bdd69..b915b40307 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 069a52a166382dd7b99bf8e7e805f6af40d797cfcee5f80e530ca3fc75fd06e2 grpc-v1.18.0.tar.gz
+sha256 069a52a166382dd7b99bf8e7e805f6af40d797cfcee5f80e530ca3fc75fd06e2 grpc-1.18.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 1a5f8855a1..e3e5a87712 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GRPC_VERSION = v1.18.0
-GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
+GRPC_VERSION = 1.18.0
+GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
 
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.hash b/package/gstreamer/gst-omapfb/gst-omapfb.hash
index 7d1c722de9..89a3ada696 100644
--- a/package/gstreamer/gst-omapfb/gst-omapfb.hash
+++ b/package/gstreamer/gst-omapfb/gst-omapfb.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 56c719584d7a7ede5fc2053e8d1060f623b226a60672de0faba46fad646658a4  gst-omapfb-v1.0.tar.gz
+sha256 56c719584d7a7ede5fc2053e8d1060f623b226a60672de0faba46fad646658a4  gst-omapfb-1.0.tar.gz
diff --git a/package/gstreamer/gst-omapfb/gst-omapfb.mk b/package/gstreamer/gst-omapfb/gst-omapfb.mk
index c0bf690531..d37e77577e 100644
--- a/package/gstreamer/gst-omapfb/gst-omapfb.mk
+++ b/package/gstreamer/gst-omapfb/gst-omapfb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GST_OMAPFB_VERSION = v1.0
-GST_OMAPFB_SITE = $(call github,felipec,gst-omapfb,$(GST_OMAPFB_VERSION))
+GST_OMAPFB_VERSION = 1.0
+GST_OMAPFB_SITE = $(call github,felipec,gst-omapfb,v$(GST_OMAPFB_VERSION))
 
 define GST_OMAPFB_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index 7478ae0f24..709fff8639 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	042f965e182b80693015839a9d0278ae73fae5d5d09d8bf6d0e6a39a8c4393bd	hiredis-v0.14.0.tar.gz
+sha256	042f965e182b80693015839a9d0278ae73fae5d5d09d8bf6d0e6a39a8c4393bd	hiredis-0.14.0.tar.gz
 sha256	dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb	COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index e187aed52c..06d2f4de68 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 HIREDIS_VERSION_MAJOR = 0.14
-HIREDIS_VERSION = v$(HIREDIS_VERSION_MAJOR).0
-HIREDIS_SITE = $(call github,redis,hiredis,$(HIREDIS_VERSION))
+HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
+HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_INSTALL_STAGING = YES
diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index dba1be31e0..0b52c11004 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 986d919c20a0c7f8b669a63830f6d2f4cb5c4cddcfc944c5e2ae05c2e9e5ec9f  hwdata-v0.308.tar.gz
+sha256 986d919c20a0c7f8b669a63830f6d2f4cb5c4cddcfc944c5e2ae05c2e9e5ec9f  hwdata-0.308.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 4603ad6ec8..6e8971ad6e 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HWDATA_VERSION = v0.308
-HWDATA_SITE = $(call github,vcrhonek,hwdata,$(HWDATA_VERSION))
+HWDATA_VERSION = 0.308
+HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
 
diff --git a/package/igd2-for-linux/igd2-for-linux.hash b/package/igd2-for-linux/igd2-for-linux.hash
index 0425399501..ecde4b51c2 100644
--- a/package/igd2-for-linux/igd2-for-linux.hash
+++ b/package/igd2-for-linux/igd2-for-linux.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	523545a26b0d662e9f6913bec2518df6e70f4d497935d88983d994336a1b0ea9	igd2-for-linux-v1.2.tar.gz
+sha256	523545a26b0d662e9f6913bec2518df6e70f4d497935d88983d994336a1b0ea9	igd2-for-linux-1.2.tar.gz
 sha256	204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994	linuxigd2/doc/LICENSE
diff --git a/package/igd2-for-linux/igd2-for-linux.mk b/package/igd2-for-linux/igd2-for-linux.mk
index 68b64f1d47..38170b4f57 100644
--- a/package/igd2-for-linux/igd2-for-linux.mk
+++ b/package/igd2-for-linux/igd2-for-linux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IGD2_FOR_LINUX_VERSION = v1.2
-IGD2_FOR_LINUX_SITE = $(call github,ffontaine,igd2-for-linux,$(IGD2_FOR_LINUX_VERSION))
+IGD2_FOR_LINUX_VERSION = 1.2
+IGD2_FOR_LINUX_SITE = $(call github,ffontaine,igd2-for-linux,v$(IGD2_FOR_LINUX_VERSION))
 
 IGD2_FOR_LINUX_LICENSE = GPL-2.0
 IGD2_FOR_LINUX_LICENSE_FILES = linuxigd2/doc/LICENSE
diff --git a/package/input-event-daemon/input-event-daemon.hash b/package/input-event-daemon/input-event-daemon.hash
index d5364a95e3..534dfce639 100644
--- a/package/input-event-daemon/input-event-daemon.hash
+++ b/package/input-event-daemon/input-event-daemon.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 1d9a44160aead88080093f74be9d709fbbc2637f982958e2673d80aedacd0a65  input-event-daemon-v0.1.3.tar.gz
+sha256 1d9a44160aead88080093f74be9d709fbbc2637f982958e2673d80aedacd0a65  input-event-daemon-0.1.3.tar.gz
diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
index e61c8cc4b5..632c9eeecb 100644
--- a/package/input-event-daemon/input-event-daemon.mk
+++ b/package/input-event-daemon/input-event-daemon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-INPUT_EVENT_DAEMON_VERSION = v0.1.3
-INPUT_EVENT_DAEMON_SITE = $(call github,gandro,input-event-daemon,$(INPUT_EVENT_DAEMON_VERSION))
+INPUT_EVENT_DAEMON_VERSION = 0.1.3
+INPUT_EVENT_DAEMON_SITE = $(call github,gandro,input-event-daemon,v$(INPUT_EVENT_DAEMON_VERSION))
 INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
 INPUT_EVENT_DAEMON_LICENSE_FILES = README
 
diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index dfe14c9003..3aba2e7dba 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3318eddc03782cfdad22b20eff18eaf378c498c5de286e8cbaa5521ddf4f810b  irqbalance-v1.5.0.tar.gz
+sha256 3318eddc03782cfdad22b20eff18eaf378c498c5de286e8cbaa5521ddf4f810b  irqbalance-1.5.0.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index 063b02bb68..8e550df3bf 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = v1.5.0
-IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,$(IRQBALANCE_VERSION))
+IRQBALANCE_VERSION = 1.5.0
+IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
 IRQBALANCE_DEPENDENCIES = host-pkgconf libglib2
diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index 54107d9bf4..f6f2345eb5 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 deefe2f936dc32f59ad3cef7e37276c2035ef8a024ca92118f35c9a292272e33  jack2-v1.9.12.tar.gz
+sha256 deefe2f936dc32f59ad3cef7e37276c2035ef8a024ca92118f35c9a292272e33  jack2-1.9.12.tar.gz
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 7f4fbfbe04..171f7d039f 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JACK2_VERSION = v1.9.12
-JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
+JACK2_VERSION = 1.9.12
+JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
 JACK2_INSTALL_STAGING = YES
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 1f6625faab..5e531da0b9 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 de8f4e3e8b19a099c903b5db7813dbbf442084af686c9922796736d42c8a8c98 janus-gateway-v0.6.3.tar.gz
+sha256 de8f4e3e8b19a099c903b5db7813dbbf442084af686c9922796736d42c8a8c98 janus-gateway-0.6.3.tar.gz
 sha256 0a884af515b4593503f6f0c9b424db3945bd77eaa2644d25f45eb93a412b3c19 COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 59048b4dd6..a2ecc77a00 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.6.3
-JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
+JANUS_GATEWAY_VERSION = 0.6.3
+JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 
diff --git a/package/jquery-keyboard/jquery-keyboard.hash b/package/jquery-keyboard/jquery-keyboard.hash
index 7502867c86..171f1133ee 100644
--- a/package/jquery-keyboard/jquery-keyboard.hash
+++ b/package/jquery-keyboard/jquery-keyboard.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6a20a1cdc9367c218048125eeb6f78d775175a964b3b9b781a931b63c0f98c66  jquery-keyboard-v1.18.12.tar.gz
+sha256 6a20a1cdc9367c218048125eeb6f78d775175a964b3b9b781a931b63c0f98c66  jquery-keyboard-1.18.12.tar.gz
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
index a1320dc97a..5066aa2c66 100644
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JQUERY_KEYBOARD_VERSION = v1.18.12
-JQUERY_KEYBOARD_SITE = $(call github,Mottie,Keyboard,$(JQUERY_KEYBOARD_VERSION))
+JQUERY_KEYBOARD_VERSION = 1.18.12
+JQUERY_KEYBOARD_SITE = $(call github,Mottie,Keyboard,v$(JQUERY_KEYBOARD_VERSION))
 JQUERY_KEYBOARD_LICENSE = MIT WTFPL
 JQUERY_KEYBOARD_LICENSE_FILES = README.markdown
 
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 09dbf30839..b3b029a5d0 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = v3.6.1
-JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
-JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
+JSON_FOR_MODERN_CPP_VERSION = 3.6.1
+JSON_FOR_MODERN_CPP_SOURCE = json-v$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
+JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,v$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
 JSON_FOR_MODERN_CPP_LICENSE_FILES = LICENSE.MIT
 JSON_FOR_MODERN_CPP_INSTALL_STAGING = YES
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
index 9b1c2114aa..6a0607e83d 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8be4f8c6324bf790069e42c963e14733c53fcdc27548f21f4822b178f47b8177  kodi-audiodecoder-modplug-v1.1.0.tar.gz
+sha256 8be4f8c6324bf790069e42c963e14733c53fcdc27548f21f4822b178f47b8177  kodi-audiodecoder-modplug-1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
index c5a6f32676..fb7003f093 100644
--- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_MODPLUG_VERSION = v1.1.0
-KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
+KODI_AUDIODECODER_MODPLUG_VERSION = 1.1.0
+KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,v$(KODI_AUDIODECODER_MODPLUG_VERSION))
 KODI_AUDIODECODER_MODPLUG_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
 KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi-platform libmodplug
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
index df93b25c8e..670e324ee4 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 444cc85f4618daa5147a63633db3f300123d5e33b1b5894e7036fa9243e8a535  kodi-audiodecoder-nosefart-v1.1.0.tar.gz
+sha256 444cc85f4618daa5147a63633db3f300123d5e33b1b5894e7036fa9243e8a535  kodi-audiodecoder-nosefart-1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
index f56dc19158..5e008198ca 100644
--- a/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
+++ b/package/kodi-audiodecoder-nosefart/kodi-audiodecoder-nosefart.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_NOSEFART_VERSION = v1.1.0
-KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,$(KODI_AUDIODECODER_NOSEFART_VERSION))
+KODI_AUDIODECODER_NOSEFART_VERSION = 1.1.0
+KODI_AUDIODECODER_NOSEFART_SITE = $(call github,notspiff,audiodecoder.nosefart,v$(KODI_AUDIODECODER_NOSEFART_VERSION))
 KODI_AUDIODECODER_NOSEFART_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_NOSEFART_LICENSE_FILES = src/NSFCodec.cpp
 KODI_AUDIODECODER_NOSEFART_DEPENDENCIES = kodi-platform
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
index b806956a75..97c5f28fc7 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 527b188679add8043e8cd691af9735b6fe8bd6935ad8ac8312b459d6f160cdac  kodi-audiodecoder-sidplay-v1.1.0.tar.gz
+sha256 527b188679add8043e8cd691af9735b6fe8bd6935ad8ac8312b459d6f160cdac  kodi-audiodecoder-sidplay-1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
index 8eb425f443..8dc827a666 100644
--- a/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
+++ b/package/kodi-audiodecoder-sidplay/kodi-audiodecoder-sidplay.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SIDPLAY_VERSION = v1.1.0
-KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,$(KODI_AUDIODECODER_SIDPLAY_VERSION))
+KODI_AUDIODECODER_SIDPLAY_VERSION = 1.1.0
+KODI_AUDIODECODER_SIDPLAY_SITE = $(call github,notspiff,audiodecoder.sidplay,v$(KODI_AUDIODECODER_SIDPLAY_VERSION))
 KODI_AUDIODECODER_SIDPLAY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SIDPLAY_LICENSE_FILES = src/SIDCodec.cpp
 KODI_AUDIODECODER_SIDPLAY_DEPENDENCIES = host-pkgconf kodi-platform libsidplay2
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
index 159d67ecdf..877b7a7f9c 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 20d85822d0c01223903b5e5472a1d029fa4931c2a9ac4d399345c4363fa8f905  kodi-audiodecoder-snesapu-v1.1.0.tar.gz
+sha256 20d85822d0c01223903b5e5472a1d029fa4931c2a9ac4d399345c4363fa8f905  kodi-audiodecoder-snesapu-1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
index 6104de717f..df7a8f09b9 100644
--- a/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
+++ b/package/kodi-audiodecoder-snesapu/kodi-audiodecoder-snesapu.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_SNESAPU_VERSION = v1.1.0
-KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,$(KODI_AUDIODECODER_SNESAPU_VERSION))
+KODI_AUDIODECODER_SNESAPU_VERSION = 1.1.0
+KODI_AUDIODECODER_SNESAPU_SITE = $(call github,notspiff,audiodecoder.snesapu,v$(KODI_AUDIODECODER_SNESAPU_VERSION))
 KODI_AUDIODECODER_SNESAPU_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_SNESAPU_LICENSE_FILES = src/SPCCodec.cpp
 KODI_AUDIODECODER_SNESAPU_DEPENDENCIES = kodi-platform
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
index 133e645fa9..2d70e085d9 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 c9b6e98d544712f7cec3cf18f866ccaed2fbcd20410179259ae0455ffa967ca4  kodi-audiodecoder-stsound-v1.1.0.tar.gz
+sha256 c9b6e98d544712f7cec3cf18f866ccaed2fbcd20410179259ae0455ffa967ca4  kodi-audiodecoder-stsound-1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
index dd5b9da3f8..f49c614bb2 100644
--- a/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
+++ b/package/kodi-audiodecoder-stsound/kodi-audiodecoder-stsound.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_STSOUND_VERSION = v1.1.0
-KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,$(KODI_AUDIODECODER_STSOUND_VERSION))
+KODI_AUDIODECODER_STSOUND_VERSION = 1.1.0
+KODI_AUDIODECODER_STSOUND_SITE = $(call github,notspiff,audiodecoder.stsound,v$(KODI_AUDIODECODER_STSOUND_VERSION))
 KODI_AUDIODECODER_STSOUND_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_STSOUND_LICENSE_FILES = src/YMCodec.cpp
 KODI_AUDIODECODER_STSOUND_DEPENDENCIES = kodi-platform
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
index 5711b87a6c..34260e9449 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 83a740010dc7fa01101da370c74e79287ebd67bd28d27125e4372abe2fb3bb47  kodi-audiodecoder-timidity-v1.1.1.tar.gz
+sha256 83a740010dc7fa01101da370c74e79287ebd67bd28d27125e4372abe2fb3bb47  kodi-audiodecoder-timidity-1.1.1.tar.gz
diff --git a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
index e4a97fa7f6..a4847e0289 100644
--- a/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
+++ b/package/kodi-audiodecoder-timidity/kodi-audiodecoder-timidity.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_TIMIDITY_VERSION = v1.1.1
-KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,$(KODI_AUDIODECODER_TIMIDITY_VERSION))
+KODI_AUDIODECODER_TIMIDITY_VERSION = 1.1.1
+KODI_AUDIODECODER_TIMIDITY_SITE = $(call github,notspiff,audiodecoder.timidity,v$(KODI_AUDIODECODER_TIMIDITY_VERSION))
 KODI_AUDIODECODER_TIMIDITY_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_TIMIDITY_LICENSE_FILES = src/TimidityCodec.cpp
 KODI_AUDIODECODER_TIMIDITY_DEPENDENCIES = kodi
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
index 28f4272e20..f4cf51aa21 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 40cd4f7f143c9313a4437854e31c460046af47bd709364439f0e370ec464af0d  kodi-audiodecoder-vgmstream-v1.1.0.tar.gz
+sha256 40cd4f7f143c9313a4437854e31c460046af47bd709364439f0e370ec464af0d  kodi-audiodecoder-vgmstream-1.1.0.tar.gz
diff --git a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
index 8dc09fa7e4..e89602117e 100644
--- a/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
+++ b/package/kodi-audiodecoder-vgmstream/kodi-audiodecoder-vgmstream.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIODECODER_VGMSTREAM_VERSION = v1.1.0
-KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
+KODI_AUDIODECODER_VGMSTREAM_VERSION = 1.1.0
+KODI_AUDIODECODER_VGMSTREAM_SITE = $(call github,notspiff,audiodecoder.vgmstream,v$(KODI_AUDIODECODER_VGMSTREAM_VERSION))
 KODI_AUDIODECODER_VGMSTREAM_LICENSE = GPL-2.0+
 KODI_AUDIODECODER_VGMSTREAM_LICENSE_FILES = src/VGMCodec.cpp
 KODI_AUDIODECODER_VGMSTREAM_DEPENDENCIES = kodi-platform
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
index 41ddeb4eea..9a0f81e10d 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 811dac5766dc9ef1a3447c55637edde55c5ddca1d583124e9312328152015ae5  kodi-audioencoder-flac-v1.1.0.tar.gz
+sha256 811dac5766dc9ef1a3447c55637edde55c5ddca1d583124e9312328152015ae5  kodi-audioencoder-flac-1.1.0.tar.gz
diff --git a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
index d1c41ca36b..ea5a0860c6 100644
--- a/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
+++ b/package/kodi-audioencoder-flac/kodi-audioencoder-flac.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_FLAC_VERSION = v1.1.0
-KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,$(KODI_AUDIOENCODER_FLAC_VERSION))
+KODI_AUDIOENCODER_FLAC_VERSION = 1.1.0
+KODI_AUDIOENCODER_FLAC_SITE = $(call github,xbmc,audioencoder.flac,v$(KODI_AUDIOENCODER_FLAC_VERSION))
 KODI_AUDIOENCODER_FLAC_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_FLAC_LICENSE_FILES = src/EncoderFlac.cpp
 KODI_AUDIOENCODER_FLAC_DEPENDENCIES = flac kodi libogg host-pkgconf
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index b93ae02e21..6edd161559 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5118a2925bb0f7eca36b2d0f4d6822b45a8967c9fb91054bfaa8f83d21209c95  kodi-audioencoder-lame-v1.2.0.tar.gz
+sha256 5118a2925bb0f7eca36b2d0f4d6822b45a8967c9fb91054bfaa8f83d21209c95  kodi-audioencoder-lame-1.2.0.tar.gz
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index 941604ae46..3f06a06135 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = v1.2.0
-KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
+KODI_AUDIOENCODER_LAME_VERSION = 1.2.0
+KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,v$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = src/EncoderLame.cpp
 KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
index 094b2fabc6..1b41a88dbc 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f00c74f010b465d43e8206bcbe155785e1f34660ca010acff3b890595ea2352c  kodi-audioencoder-vorbis-v1.1.0.tar.gz
+sha256 f00c74f010b465d43e8206bcbe155785e1f34660ca010acff3b890595ea2352c  kodi-audioencoder-vorbis-1.1.0.tar.gz
diff --git a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
index 198d3b1c64..0c0c406a58 100644
--- a/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
+++ b/package/kodi-audioencoder-vorbis/kodi-audioencoder-vorbis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_VORBIS_VERSION = v1.1.0
-KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,$(KODI_AUDIOENCODER_VORBIS_VERSION))
+KODI_AUDIOENCODER_VORBIS_VERSION = 1.1.0
+KODI_AUDIOENCODER_VORBIS_SITE = $(call github,xbmc,audioencoder.vorbis,v$(KODI_AUDIOENCODER_VORBIS_VERSION))
 KODI_AUDIOENCODER_VORBIS_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_VORBIS_LICENSE_FILES = src/EncoderVorbis.cpp
 KODI_AUDIOENCODER_VORBIS_DEPENDENCIES = kodi libogg libvorbis host-pkgconf
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
index c6bbe79e17..b302c18ac9 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f9b0f79c8364fb7ef584137031fceb8d2ab1af28e110cfe2a31932631cb8d36e  kodi-audioencoder-wav-v1.1.0.tar.gz
+sha256 f9b0f79c8364fb7ef584137031fceb8d2ab1af28e110cfe2a31932631cb8d36e  kodi-audioencoder-wav-1.1.0.tar.gz
diff --git a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
index 1a9a6b7bbc..d21546ba05 100644
--- a/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
+++ b/package/kodi-audioencoder-wav/kodi-audioencoder-wav.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_WAV_VERSION = v1.1.0
-KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,$(KODI_AUDIOENCODER_WAV_VERSION))
+KODI_AUDIOENCODER_WAV_VERSION = 1.1.0
+KODI_AUDIOENCODER_WAV_SITE = $(call github,xbmc,audioencoder.wav,v$(KODI_AUDIOENCODER_WAV_VERSION))
 KODI_AUDIOENCODER_WAV_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_WAV_LICENSE_FILES = src/EncoderWav.cpp
 KODI_AUDIOENCODER_WAV_DEPENDENCIES = kodi
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
index f5a82d2aae..2d7a68ba3c 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 75a3cc87243a7c92a0a2e3f16710a1e60d05cd8dbc8b7fd1852244fbc5da2ae8  kodi-inputstream-rtmp-v1.0.4.tar.gz
+sha256 75a3cc87243a7c92a0a2e3f16710a1e60d05cd8dbc8b7fd1852244fbc5da2ae8  kodi-inputstream-rtmp-1.0.4.tar.gz
diff --git a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
index 80c4bccd67..061aedf1e7 100644
--- a/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
+++ b/package/kodi-inputstream-rtmp/kodi-inputstream-rtmp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_RTMP_VERSION = v1.0.4
-KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,$(KODI_INPUTSTREAM_RTMP_VERSION))
+KODI_INPUTSTREAM_RTMP_VERSION = 1.0.4
+KODI_INPUTSTREAM_RTMP_SITE = $(call github,notspiff,inputstream.rtmp,v$(KODI_INPUTSTREAM_RTMP_VERSION))
 KODI_INPUTSTREAM_RTMP_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_RTMP_LICENSE_FILES = src/RTMPStream.cpp
 KODI_INPUTSTREAM_RTMP_DEPENDENCIES = kodi rtmpdump
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 728c3cac53..5a7348d414 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 9a183e1f92ff2c68816bfa0056c65585a3e1129d924326359d7a5dfbcba6c56a  kodi-peripheral-joystick-v1.3.4.tar.gz
+sha256 9a183e1f92ff2c68816bfa0056c65585a3e1129d924326359d7a5dfbcba6c56a  kodi-peripheral-joystick-1.3.4.tar.gz
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 2fadbcc210..13c33fc0af 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -6,8 +6,8 @@
 
 # This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PERIPHERAL_JOYSTICK_VERSION = v1.3.4
-KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
+KODI_PERIPHERAL_JOYSTICK_VERSION = 1.3.4
+KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,v$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = src/addon.cpp
 KODI_PERIPHERAL_JOYSTICK_DEPENDENCIES = kodi-platform udev
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
index 7d105beebe..d62032c076 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2e072e6aad12f707dec1e70b7df26c590bb41fed8880dcfdbe6c99949b7e287a  kodi-screensaver-asteroids-v1.1.2.tar.gz
+sha256 2e072e6aad12f707dec1e70b7df26c590bb41fed8880dcfdbe6c99949b7e287a  kodi-screensaver-asteroids-1.1.2.tar.gz
diff --git a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
index 46df2e76a0..378da74be1 100644
--- a/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
+++ b/package/kodi-screensaver-asteroids/kodi-screensaver-asteroids.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTEROIDS_VERSION = v1.1.2
-KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
+KODI_SCREENSAVER_ASTEROIDS_VERSION = 1.1.2
+KODI_SCREENSAVER_ASTEROIDS_SITE = $(call github,notspiff,screensaver.asteroids,v$(KODI_SCREENSAVER_ASTEROIDS_VERSION))
 KODI_SCREENSAVER_ASTEROIDS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_ASTEROIDS_LICENSE_FILES = src/main.cpp
 KODI_SCREENSAVER_ASTEROIDS_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
index f8f6d7b2fb..40c8f9b28c 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 48cd459b60b2407b8bae9107760a013d04ee29e00fddbce9550291896d42ef64  kodi-screensaver-asterwave-v1.1.0.tar.gz
+sha256 48cd459b60b2407b8bae9107760a013d04ee29e00fddbce9550291896d42ef64  kodi-screensaver-asterwave-1.1.0.tar.gz
diff --git a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
index b8c3a2adfa..8f6d583829 100644
--- a/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
+++ b/package/kodi-screensaver-asterwave/kodi-screensaver-asterwave.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_ASTERWAVE_VERSION = v1.1.0
-KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
+KODI_SCREENSAVER_ASTERWAVE_VERSION = 1.1.0
+KODI_SCREENSAVER_ASTERWAVE_SITE = $(call github,notspiff,screensaver.asterwave,v$(KODI_SCREENSAVER_ASTERWAVE_VERSION))
 KODI_SCREENSAVER_ASTERWAVE_DEPENDENCIES = kodi libglu libsoil
 
 $(eval $(cmake-package))
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
index 63b9d3c93a..81b57e4265 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b97dc804261b19df725e0a9f1af3be6903226ae616fcac170f7b9c1a67bf811a  kodi-screensaver-biogenesis-v1.1.0.tar.gz
+sha256 b97dc804261b19df725e0a9f1af3be6903226ae616fcac170f7b9c1a67bf811a  kodi-screensaver-biogenesis-1.1.0.tar.gz
diff --git a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
index c5ebd85596..fe0d284448 100644
--- a/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
+++ b/package/kodi-screensaver-biogenesis/kodi-screensaver-biogenesis.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_BIOGENESIS_VERSION = v1.1.0
-KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
+KODI_SCREENSAVER_BIOGENESIS_VERSION = 1.1.0
+KODI_SCREENSAVER_BIOGENESIS_SITE = $(call github,notspiff,screensaver.biogenesis,v$(KODI_SCREENSAVER_BIOGENESIS_VERSION))
 KODI_SCREENSAVER_BIOGENESIS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_BIOGENESIS_LICENSE_FILES = src/Life.cpp
 KODI_SCREENSAVER_BIOGENESIS_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
index 21443d82bf..bc1228c55f 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1ca5e4de61251de7e420dc6ded3156960f9bb52ed7ff0243f305768147d470e3  kodi-screensaver-cpblobs-v1.1.0.tar.gz
+sha256 1ca5e4de61251de7e420dc6ded3156960f9bb52ed7ff0243f305768147d470e3  kodi-screensaver-cpblobs-1.1.0.tar.gz
diff --git a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
index 63a8dfa8cf..09dc6c16fc 100644
--- a/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
+++ b/package/kodi-screensaver-cpblobs/kodi-screensaver-cpblobs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_CPBLOBS_VERSION = v1.1.0
-KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,$(KODI_SCREENSAVER_CPBLOBS_VERSION))
+KODI_SCREENSAVER_CPBLOBS_VERSION = 1.1.0
+KODI_SCREENSAVER_CPBLOBS_SITE = $(call github,notspiff,screensaver.cpblobs,v$(KODI_SCREENSAVER_CPBLOBS_VERSION))
 KODI_SCREENSAVER_CPBLOBS_LICENSE = GPL-2.0
 KODI_SCREENSAVER_CPBLOBS_LICENSE_FILES = LICENSE
 KODI_SCREENSAVER_CPBLOBS_DEPENDENCIES = kodi libsoil
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
index 212aee663c..5ca0f66d58 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 55a77487f02d282e8431e64de3cb263489037c2374a4b9cdd7aa189093e7621f  kodi-screensaver-greynetic-v1.1.0.tar.gz
+sha256 55a77487f02d282e8431e64de3cb263489037c2374a4b9cdd7aa189093e7621f  kodi-screensaver-greynetic-1.1.0.tar.gz
diff --git a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
index 66435eb270..ef95dc7505 100644
--- a/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
+++ b/package/kodi-screensaver-greynetic/kodi-screensaver-greynetic.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_GREYNETIC_VERSION = v1.1.0
-KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,$(KODI_SCREENSAVER_GREYNETIC_VERSION))
+KODI_SCREENSAVER_GREYNETIC_VERSION = 1.1.0
+KODI_SCREENSAVER_GREYNETIC_SITE = $(call github,notspiff,screensaver.greynetic,v$(KODI_SCREENSAVER_GREYNETIC_VERSION))
 KODI_SCREENSAVER_GREYNETIC_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_GREYNETIC_LICENSE_FILES = src/GreyNetic.cpp
 KODI_SCREENSAVER_GREYNETIC_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
index 55deabea1e..6ba6d542b0 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 2b531f51b86536df2a5268547e3d1b7fabc8a1dc930808b46685afcc455bb8fa  kodi-screensaver-matrixtrails-v1.1.0.tar.gz
+sha256 2b531f51b86536df2a5268547e3d1b7fabc8a1dc930808b46685afcc455bb8fa  kodi-screensaver-matrixtrails-1.1.0.tar.gz
diff --git a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
index 142e48dc76..ff64ccb17f 100644
--- a/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
+++ b/package/kodi-screensaver-matrixtrails/kodi-screensaver-matrixtrails.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_MATRIXTRAILS_VERSION = v1.1.0
-KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
+KODI_SCREENSAVER_MATRIXTRAILS_VERSION = 1.1.0
+KODI_SCREENSAVER_MATRIXTRAILS_SITE = $(call github,notspiff,screensaver.matrixtrails,v$(KODI_SCREENSAVER_MATRIXTRAILS_VERSION))
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_MATRIXTRAILS_LICENSE_FILES = src/matrixtrails.cpp
 
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
index aad8314bdd..12049cf989 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 99e9cbc3815d4e3dad964b2d233dbf6acc4416121398f7fca75f3811cb04d88f  kodi-screensaver-pingpong-v1.1.0.tar.gz
+sha256 99e9cbc3815d4e3dad964b2d233dbf6acc4416121398f7fca75f3811cb04d88f  kodi-screensaver-pingpong-1.1.0.tar.gz
diff --git a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
index 8b6426dae4..f8830f24fd 100644
--- a/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
+++ b/package/kodi-screensaver-pingpong/kodi-screensaver-pingpong.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PINGPONG_VERSION = v1.1.0
-KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,$(KODI_SCREENSAVER_PINGPONG_VERSION))
+KODI_SCREENSAVER_PINGPONG_VERSION = 1.1.0
+KODI_SCREENSAVER_PINGPONG_SITE = $(call github,notspiff,screensaver.pingpong,v$(KODI_SCREENSAVER_PINGPONG_VERSION))
 KODI_SCREENSAVER_PINGPONG_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PINGPONG_LICENSE_FILES = src/readme.txt
 KODI_SCREENSAVER_PINGPONG_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
index a16ee8e092..be29ca3bef 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0dcaed581ffe5595878338a8c9c55bd7acc87e03d30a4d3ca4a03c3f8db66ddc  kodi-screensaver-pyro-v1.1.0.tar.gz
+sha256 0dcaed581ffe5595878338a8c9c55bd7acc87e03d30a4d3ca4a03c3f8db66ddc  kodi-screensaver-pyro-1.1.0.tar.gz
diff --git a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
index bc50118302..4d6b1f72d3 100644
--- a/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
+++ b/package/kodi-screensaver-pyro/kodi-screensaver-pyro.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_PYRO_VERSION = v1.1.0
-KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,$(KODI_SCREENSAVER_PYRO_VERSION))
+KODI_SCREENSAVER_PYRO_VERSION = 1.1.0
+KODI_SCREENSAVER_PYRO_SITE = $(call github,notspiff,screensaver.pyro,v$(KODI_SCREENSAVER_PYRO_VERSION))
 KODI_SCREENSAVER_PYRO_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_PYRO_LICENSE_FILES = src/Pyro.cpp
 KODI_SCREENSAVER_PYRO_DEPENDENCIES = kodi
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
index 66d79a06f3..e80c972ebb 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8436c29d2f42bc65ff6f1abc2f1d05a613cc2ebb16d793e02b1f2bee296952a6  kodi-screensaver-rsxs-v1.3.0.tar.gz
+sha256 8436c29d2f42bc65ff6f1abc2f1d05a613cc2ebb16d793e02b1f2bee296952a6  kodi-screensaver-rsxs-1.3.0.tar.gz
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 8445bf88d8..64ffb4fba6 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_RSXS_VERSION = v1.3.0
-KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
+KODI_SCREENSAVER_RSXS_VERSION = 1.3.0
+KODI_SCREENSAVER_RSXS_SITE = $(call github,notspiff,screensavers.rsxs,v$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-3.0
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = lib/rsxs-1.0/COPYING
 KODI_SCREENSAVER_RSXS_DEPENDENCIES = kodi libpng xlib_libXmu
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
index 7f8c9aefd0..63335742b2 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 525caac94fd2bd858daf9fa7719eea4181c168e5c692bb896689625bf4437d32  kodi-screensaver-stars-v1.1.0.tar.gz
+sha256 525caac94fd2bd858daf9fa7719eea4181c168e5c692bb896689625bf4437d32  kodi-screensaver-stars-1.1.0.tar.gz
diff --git a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
index e94670c6ff..19e9db7194 100644
--- a/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
+++ b/package/kodi-screensaver-stars/kodi-screensaver-stars.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_SCREENSAVER_STARS_VERSION = v1.1.0
-KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,$(KODI_SCREENSAVER_STARS_VERSION))
+KODI_SCREENSAVER_STARS_VERSION = 1.1.0
+KODI_SCREENSAVER_STARS_SITE = $(call github,notspiff,screensaver.stars,v$(KODI_SCREENSAVER_STARS_VERSION))
 KODI_SCREENSAVER_STARS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_STARS_LICENSE_FILES = src/StarField.cpp
 KODI_SCREENSAVER_STARS_DEPENDENCIES = kodi
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index c89ca9a618..21d80a31cb 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cf42a21978578cb5ecb10c20fe09791183d8ef2998ff9d956a84142a7dda8f72  kodi-visualisation-fishbmc-v4.1.0.tar.gz
+sha256 cf42a21978578cb5ecb10c20fe09791183d8ef2998ff9d956a84142a7dda8f72  kodi-visualisation-fishbmc-4.1.0.tar.gz
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index d08c215ee7..8360660ef4 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = v4.1.0
-KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
+KODI_VISUALISATION_FISHBMC_VERSION = 4.1.0
+KODI_VISUALISATION_FISHBMC_SITE = $(call github,notspiff,visualization.fishbmc,v$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = visualization.fishbmc/LICENSE
 KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index a0df397e8e..ae8c59ddb0 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 4456e88bc94bcb3e2481286b27926a1f6d85d6f857de31a46d50f44fead01abd  kodi-visualisation-shadertoy-v1.1.5.tar.gz
+sha256 4456e88bc94bcb3e2481286b27926a1f6d85d6f857de31a46d50f44fead01abd  kodi-visualisation-shadertoy-1.1.5.tar.gz
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 923891595b..a2b1b14d9f 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = v1.1.5
-KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
+KODI_VISUALISATION_SHADERTOY_VERSION = 1.1.5
+KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,v$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 6c892ed0ba..2d9ab0f3cf 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7ee78ff5c24e3f81b6e2a9208237f34667cb9faa5453d7bdb900ab65245973f1  kodi-visualisation-spectrum-v1.1.1.tar.gz
+sha256 7ee78ff5c24e3f81b6e2a9208237f34667cb9faa5453d7bdb900ab65245973f1  kodi-visualisation-spectrum-1.1.1.tar.gz
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 3ab2c9975d..016f405e40 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = v1.1.1
-KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
+KODI_VISUALISATION_SPECTRUM_VERSION = 1.1.1
+KODI_VISUALISATION_SPECTRUM_SITE = $(call github,notspiff,visualization.spectrum,v$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_SPECTRUM_DEPENDENCIES = kodi
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 1fdecbede5..271dc4a9e0 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 cf10d8d78cb2bde4a0a21bb7e467445617b46593c093ef05f336f95a048f2d54  kodi-visualisation-waveform-v1.1.0.tar.gz
+sha256 cf10d8d78cb2bde4a0a21bb7e467445617b46593c093ef05f336f95a048f2d54  kodi-visualisation-waveform-1.1.0.tar.gz
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index d906c653c2..13a621edb0 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = v1.1.0
-KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
+KODI_VISUALISATION_WAVEFORM_VERSION = 1.1.0
+KODI_VISUALISATION_WAVEFORM_SITE = $(call github,notspiff,visualization.waveform,v$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = COPYING
 KODI_VISUALISATION_WAVEFORM_DEPENDENCIES = kodi
diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
index aa746ca17e..fe3255a6c7 100644
--- a/package/kvazaar/kvazaar.hash
+++ b/package/kvazaar/kvazaar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9  kvazaar-v1.2.0.tar.gz
+sha256 480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9  kvazaar-1.2.0.tar.gz
 sha256 531712277c3543b9ee86c4c4e0e424f531b893a44cc021c74a24b038d8de4d2a COPYING
diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index 0cf965dd86..29433d6eb3 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-KVAZAAR_VERSION = v1.2.0
-KVAZAAR_SITE = $(call github,ultravideo,kvazaar,$(KVAZAAR_VERSION))
+KVAZAAR_VERSION = 1.2.0
+KVAZAAR_SITE = $(call github,ultravideo,kvazaar,v$(KVAZAAR_VERSION))
 KVAZAAR_LICENSE = LGPL-2.1+
 KVAZAAR_LICENSE_FILES = COPYING
 KVAZAAR_AUTORECONF = YES
diff --git a/package/lcdapi/lcdapi.hash b/package/lcdapi/lcdapi.hash
index c04ea021f7..643894e491 100644
--- a/package/lcdapi/lcdapi.hash
+++ b/package/lcdapi/lcdapi.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 6afdd4238af1fa7ea5f10378601381fc3f535a10504dc7d4ea8eab56e0dda091  lcdapi-v0.11.tar.gz
+sha256 6afdd4238af1fa7ea5f10378601381fc3f535a10504dc7d4ea8eab56e0dda091  lcdapi-0.11.tar.gz
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index b27abcdbf2..11eee880a6 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LCDAPI_VERSION = v0.11
-LCDAPI_SITE = $(call github,spdawson,lcdapi,$(LCDAPI_VERSION))
+LCDAPI_VERSION = 0.11
+LCDAPI_SITE = $(call github,spdawson,lcdapi,v$(LCDAPI_VERSION))
 LCDAPI_LICENSE = LGPL-2.1+
 LCDAPI_LICENSE_FILES = COPYING
 LCDAPI_AUTORECONF = YES
diff --git a/package/let-me-create/let-me-create.hash b/package/let-me-create/let-me-create.hash
index 45b5e55bcf..585b0ea3fc 100644
--- a/package/let-me-create/let-me-create.hash
+++ b/package/let-me-create/let-me-create.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5f42858a2062f34d2578e9cb1aed3ccb8d2409d908aa4c41a924418666d5f2bd  let-me-create-v1.5.2.tar.gz
+sha256 5f42858a2062f34d2578e9cb1aed3ccb8d2409d908aa4c41a924418666d5f2bd  let-me-create-1.5.2.tar.gz
diff --git a/package/let-me-create/let-me-create.mk b/package/let-me-create/let-me-create.mk
index 2dd07ef48a..faa5e14d96 100644
--- a/package/let-me-create/let-me-create.mk
+++ b/package/let-me-create/let-me-create.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LET_ME_CREATE_VERSION = v1.5.2
-LET_ME_CREATE_SITE = $(call github,CreatorDev,LetMeCreate,$(LET_ME_CREATE_VERSION))
+LET_ME_CREATE_VERSION = 1.5.2
+LET_ME_CREATE_SITE = $(call github,CreatorDev,LetMeCreate,v$(LET_ME_CREATE_VERSION))
 LET_ME_CREATE_INSTALL_STAGING = YES
 LET_ME_CREATE_LICENSE = BSD-3-Clause
 LET_ME_CREATE_LICENSE_FILES = LICENSE
diff --git a/package/leveldb/leveldb.hash b/package/leveldb/leveldb.hash
index a5300d7cd3..008c1a6c40 100644
--- a/package/leveldb/leveldb.hash
+++ b/package/leveldb/leveldb.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f5abe8b5b209c2f36560b75f32ce61412f39a2922f7045ae764a2c23335b6664  leveldb-v1.20.tar.gz
+sha256 f5abe8b5b209c2f36560b75f32ce61412f39a2922f7045ae764a2c23335b6664  leveldb-1.20.tar.gz
diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 6078cd496c..6c1a0e66fb 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LEVELDB_VERSION = v1.20
-LEVELDB_SITE = $(call github,google,leveldb,$(LEVELDB_VERSION))
+LEVELDB_VERSION = 1.20
+LEVELDB_SITE = $(call github,google,leveldb,v$(LEVELDB_VERSION))
 LEVELDB_LICENSE = BSD-3-Clause
 LEVELDB_LICENSE_FILES = LICENSE
 LEVELDB_INSTALL_STAGING = YES
diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index a913023e21..902bd10332 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 61754aa60bb8052ea64175794df2afae8baacca5420e06eb150230681e71ff5e  libatomic_ops-v7.6.6.tar.gz
+sha256 61754aa60bb8052ea64175794df2afae8baacca5420e06eb150230681e71ff5e  libatomic_ops-7.6.6.tar.gz
 sha256 f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index 100ad70257..b298be1ea5 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = v7.6.6
-LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,$(LIBATOMIC_OPS_VERSION))
+LIBATOMIC_OPS_VERSION = 7.6.6
+LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
 # From doc/LICENSING.txt: "Our intent is to make it easy to use
diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index deb94ecd6d..9bed8ff59b 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 f7e26dc232c177336474a14487771037a8fb32e311f5ccd076a00dc04b6d7b7a libcoap-v4.1.2.tar.gz
+sha256 f7e26dc232c177336474a14487771037a8fb32e311f5ccd076a00dc04b6d7b7a libcoap-4.1.2.tar.gz
 sha256 28b61fbf3c5477611d7f6ead97d15348934496d27dca815b34d45e622730e72e COPYING
 sha256 d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388 LICENSE.GPL
 sha256 9d5aeec17bdf82369bbe6e89efb07b7b35abefa044ea1d25cb2feeb70df1c208 LICENSE.BSD
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 4f87886ba0..a703f45e60 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = v4.1.2
-LIBCOAP_SITE = $(call github,obgm,libcoap,$(LIBCOAP_VERSION))
+LIBCOAP_VERSION = 4.1.2
+LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = GPL-2.0+ or BSD-2-Clause
 LIBCOAP_LICENSE_FILES = COPYING LICENSE.GPL LICENSE.BSD
diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 7a77034e68..e056a17de3 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f67ac44099916ae260a6c9e290a90809e7d782d96cdd462cac656ebc5b685726  libconfig-v1.7.2.tar.gz
+sha256  f67ac44099916ae260a6c9e290a90809e7d782d96cdd462cac656ebc5b685726  libconfig-1.7.2.tar.gz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 699f593385..a127f9bcc8 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = v1.7.2
-LIBCONFIG_SITE = $(call github,hyperrealm,libconfig,$(LIBCONFIG_VERSION))
+LIBCONFIG_VERSION = 1.7.2
+LIBCONFIG_SITE = $(call github,hyperrealm,libconfig,v$(LIBCONFIG_VERSION))
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
index bf8dd7c590..b7a9de10e8 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c7c2a5deb4cad036b974e9b7f2ba2e3ae829312894ddfca2fae3a11980fef63e	libcpprestsdk-v2.10.12.tar.gz
+sha256 c7c2a5deb4cad036b974e9b7f2ba2e3ae829312894ddfca2fae3a11980fef63e	libcpprestsdk-2.10.12.tar.gz
 sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 10b5934d05..877f7c4e73 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = v2.10.12
-LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
+LIBCPPRESTSDK_VERSION = 2.10.12
+LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,v$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
diff --git a/package/libcue/libcue.hash b/package/libcue/libcue.hash
index 357807f0c8..b69fb7fa2b 100644
--- a/package/libcue/libcue.hash
+++ b/package/libcue/libcue.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	f27bc3ebb2e892cd9d32a7bee6d84576a60f955f29f748b9b487b173712f1200	libcue-v2.2.1.tar.gz
+sha256	f27bc3ebb2e892cd9d32a7bee6d84576a60f955f29f748b9b487b173712f1200	libcue-2.2.1.tar.gz
 sha256	c388d36583fa54e13b6d73ad924d0b68d073ed8a5771e17cb49104705df4504f	LICENSE
diff --git a/package/libcue/libcue.mk b/package/libcue/libcue.mk
index f2d64439fe..3edb4f3b69 100644
--- a/package/libcue/libcue.mk
+++ b/package/libcue/libcue.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCUE_VERSION = v2.2.1
-LIBCUE_SITE = $(call github,lipnitsk,libcue,$(LIBCUE_VERSION))
+LIBCUE_VERSION = 2.2.1
+LIBCUE_SITE = $(call github,lipnitsk,libcue,v$(LIBCUE_VERSION))
 LIBCUE_LICENSE = GPL-2.0, BSD-2-Clause (rem.c)
 LIBCUE_LICENSE_FILES = LICENSE
 LIBCUE_DEPENDENCIES = host-bison host-flex flex
diff --git a/package/libdcadec/libdcadec.hash b/package/libdcadec/libdcadec.hash
index e2b68cd70f..d3a9ae7d4c 100644
--- a/package/libdcadec/libdcadec.hash
+++ b/package/libdcadec/libdcadec.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44	libdcadec-v0.2.0.tar.gz
+sha256	ed9d207fde3e8d576f3af8b0d1235b3371e315175757173689104efcaebf0d44	libdcadec-0.2.0.tar.gz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LGPLv2.1
diff --git a/package/libdcadec/libdcadec.mk b/package/libdcadec/libdcadec.mk
index a5a98bedc4..a3579ad632 100644
--- a/package/libdcadec/libdcadec.mk
+++ b/package/libdcadec/libdcadec.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBDCADEC_VERSION = v0.2.0
-LIBDCADEC_SITE = $(call github,foo86,dcadec,$(LIBDCADEC_VERSION))
+LIBDCADEC_VERSION = 0.2.0
+LIBDCADEC_SITE = $(call github,foo86,dcadec,v$(LIBDCADEC_VERSION))
 LIBDCADEC_LICENSE = LGPL-2.1+
 LIBDCADEC_LICENSE_FILES = COPYING.LGPLv2.1
 LIBDCADEC_INSTALL_STAGING = YES
diff --git a/package/libebur128/libebur128.hash b/package/libebur128/libebur128.hash
index 2b0d3e34c2..89f6e1aa1c 100644
--- a/package/libebur128/libebur128.hash
+++ b/package/libebur128/libebur128.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 1d0d7e855da04010a2432e11fbc596502caf11b61c3b571ccbcb10095fe44b43  libebur128-v1.2.2.tar.gz
+sha256 1d0d7e855da04010a2432e11fbc596502caf11b61c3b571ccbcb10095fe44b43  libebur128-1.2.2.tar.gz
 sha256 d6b4754bb67bdd08b97d5d11b2d7434997a371585a78fe77007149df3af8d09c  COPYING
diff --git a/package/libebur128/libebur128.mk b/package/libebur128/libebur128.mk
index 24c2f2429a..7210e4f447 100644
--- a/package/libebur128/libebur128.mk
+++ b/package/libebur128/libebur128.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBEBUR128_VERSION = v1.2.2
-LIBEBUR128_SITE = $(call github,jiixyj,libebur128,$(LIBEBUR128_VERSION))
+LIBEBUR128_VERSION = 1.2.2
+LIBEBUR128_SITE = $(call github,jiixyj,libebur128,v$(LIBEBUR128_VERSION))
 LIBEBUR128_LICENSE = MIT
 LIBEBUR128_LICENSE_FILES = COPYING
 LIBEBUR128_INSTALL_STAGING = YES
diff --git a/package/libfastjson/libfastjson.hash b/package/libfastjson/libfastjson.hash
index 72fb9856a0..07ea88f11e 100644
--- a/package/libfastjson/libfastjson.hash
+++ b/package/libfastjson/libfastjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7e49057b26a5a9e3c6623e024f95f9fd9a14b571b9150aeb89d6d475fc3633e3  libfastjson-v0.99.8.tar.gz
+sha256  7e49057b26a5a9e3c6623e024f95f9fd9a14b571b9150aeb89d6d475fc3633e3  libfastjson-0.99.8.tar.gz
 sha256  b29370bbfa98816e1fca0901f18149d920736771bfd68b4ee0eb00c78b38d245  COPYING
diff --git a/package/libfastjson/libfastjson.mk b/package/libfastjson/libfastjson.mk
index 565cdd0ec8..ecca72f56c 100644
--- a/package/libfastjson/libfastjson.mk
+++ b/package/libfastjson/libfastjson.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBFASTJSON_VERSION = v0.99.8
-LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,$(LIBFASTJSON_VERSION))
+LIBFASTJSON_VERSION = 0.99.8
+LIBFASTJSON_SITE = $(call github,rsyslog,libfastjson,v$(LIBFASTJSON_VERSION))
 LIBFASTJSON_INSTALL_STAGING = YES
 LIBFASTJSON_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 # From git
diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 97deb988e6..d8d2d2629a 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	db41cfb9ec8052fcd116a94c12237303c4447af4844d50e4fea7163661e31743  libffi-v3.3-rc0.tar.gz
+sha256	db41cfb9ec8052fcd116a94c12237303c4447af4844d50e4fea7163661e31743  libffi-3.3-rc0.tar.gz
 # License files, locally calculated
 sha256	0f4d7a0bfb83c37465d42dc305f124189196cc0cc2cc8d6f8461103682aebbc5  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index b21d12cbd4..fb8e18a456 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = v3.3-rc0
-LIBFFI_SITE = $(call github,libffi,libffi,$(LIBFFI_VERSION))
+LIBFFI_VERSION = 3.3-rc0
+LIBFFI_SITE = $(call github,libffi,libffi,v$(LIBFFI_VERSION))
 LIBFFI_LICENSE = MIT
 LIBFFI_LICENSE_FILES = LICENSE
 LIBFFI_INSTALL_STAGING = YES
diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 29b829291c..54e309172a 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	8313873d49dc01e8b880ec334d7430ae67496a89aaa8c6e7bbd3affb47a00c76  libgit2-v0.27.8.tar.gz
+sha256	8313873d49dc01e8b880ec334d7430ae67496a89aaa8c6e7bbd3affb47a00c76  libgit2-0.27.8.tar.gz
 sha256	d9a8038088df84fde493fa33a0f1e537252eeb9642122aa4b862690197152813  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 6c64aa67c8..b8880fea81 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = v0.27.8
-LIBGIT2_SITE = $(call github,libgit2,libgit2,$(LIBGIT2_VERSION))
+LIBGIT2_VERSION = 0.27.8
+LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception
 LIBGIT2_LICENSE_FILES = COPYING
 LIBGIT2_INSTALL_STAGING = YES
diff --git a/package/libhttpparser/libhttpparser.hash b/package/libhttpparser/libhttpparser.hash
index b7df9ca602..13405a8182 100644
--- a/package/libhttpparser/libhttpparser.hash
+++ b/package/libhttpparser/libhttpparser.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 ef26268c54c8084d17654ba2ed5140bffeffd2a040a895ffb22a6cca3f6c613f  libhttpparser-v2.9.0.tar.gz
+sha256 ef26268c54c8084d17654ba2ed5140bffeffd2a040a895ffb22a6cca3f6c613f  libhttpparser-2.9.0.tar.gz
 sha256 79e6ba8b687cb54786207342b9b6fcee0ac10218453ed9009b84d949b2233cc0  LICENSE-MIT
diff --git a/package/libhttpparser/libhttpparser.mk b/package/libhttpparser/libhttpparser.mk
index 8c0afe2807..97fd3812dd 100644
--- a/package/libhttpparser/libhttpparser.mk
+++ b/package/libhttpparser/libhttpparser.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBHTTPPARSER_VERSION = v2.9.0
-LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,$(LIBHTTPPARSER_VERSION))
+LIBHTTPPARSER_VERSION = 2.9.0
+LIBHTTPPARSER_SITE = $(call github,nodejs,http-parser,v$(LIBHTTPPARSER_VERSION))
 LIBHTTPPARSER_INSTALL_STAGING = YES
 LIBHTTPPARSER_LICENSE = MIT
 LIBHTTPPARSER_LICENSE_FILES = LICENSE-MIT
diff --git a/package/libiqrf/libiqrf.hash b/package/libiqrf/libiqrf.hash
index 12d526c83c..b7f3b9bf2c 100644
--- a/package/libiqrf/libiqrf.hash
+++ b/package/libiqrf/libiqrf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8111031dd9dd6093a1927eb32dd7476fe22cfee9190043aa8e4c88003c104b16  libiqrf-v0.1.2.tar.gz
+sha256 8111031dd9dd6093a1927eb32dd7476fe22cfee9190043aa8e4c88003c104b16  libiqrf-0.1.2.tar.gz
diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index f403a5e364..cd03373dec 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBIQRF_VERSION = v0.1.2
-LIBIQRF_SITE = $(call github,nandra,libiqrf,$(LIBIQRF_VERSION))
+LIBIQRF_VERSION = 0.1.2
+LIBIQRF_SITE = $(call github,nandra,libiqrf,v$(LIBIQRF_VERSION))
 LIBIQRF_INSTALL_STAGING = YES
 LIBIQRF_DEPENDENCIES = libusb
 LIBIQRF_LICENSE = LGPL-2.1+
diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index aac01fd36d..01859f0a21 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 bd5d08066f3e53cc8967beb6f0620286aad7a24d49fb730caa1c6d09a26bb705  libite-v2.0.2.tar.gz
+sha256 bd5d08066f3e53cc8967beb6f0620286aad7a24d49fb730caa1c6d09a26bb705  libite-2.0.2.tar.gz
 sha256 0e97ab27b60e20a7ddb8e9638189ad159124e51d2c12e12735b05423df224da5  LICENSE
 sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  src/chomp.c
 sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index bcda5f3f0c..7fe6ce33b8 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBITE_VERSION = v2.0.2
-LIBITE_SITE = $(call github,troglobit,libite,$(LIBITE_VERSION))
+LIBITE_VERSION = 2.0.2
+LIBITE_SITE = $(call github,troglobit,libite,v$(LIBITE_VERSION))
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
 LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
 LIBITE_INSTALL_STAGING = YES
diff --git a/package/liblog4c-localtime/liblog4c-localtime.hash b/package/liblog4c-localtime/liblog4c-localtime.hash
index c638d7325f..d14b79594d 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.hash
+++ b/package/liblog4c-localtime/liblog4c-localtime.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a1f68d8251509c0171f8bfea42f9e2a5255a4185f7dcbe67f584aa09709b2496  liblog4c-localtime-v1.0.tar.gz
+sha256 a1f68d8251509c0171f8bfea42f9e2a5255a4185f7dcbe67f584aa09709b2496  liblog4c-localtime-1.0.tar.gz
 sha256 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
index fba0d4faae..4ec390d733 100644
--- a/package/liblog4c-localtime/liblog4c-localtime.mk
+++ b/package/liblog4c-localtime/liblog4c-localtime.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBLOG4C_LOCALTIME_VERSION = v1.0
-LIBLOG4C_LOCALTIME_SITE = $(call github,rcmadruga,log4c-localtime,$(LIBLOG4C_LOCALTIME_VERSION))
+LIBLOG4C_LOCALTIME_VERSION = 1.0
+LIBLOG4C_LOCALTIME_SITE = $(call github,rcmadruga,log4c-localtime,v$(LIBLOG4C_LOCALTIME_VERSION))
 LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
 LIBLOG4C_LOCALTIME_CONF_OPTS = --disable-expattest
 LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
diff --git a/package/libndp/libndp.hash b/package/libndp/libndp.hash
index 1861e0b4dd..fd28dce825 100644
--- a/package/libndp/libndp.hash
+++ b/package/libndp/libndp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 565d6c4167f83ec697c762ea002f23e8f0b00828d0749b1ce928f068543e5aad  libndp-v1.6.tar.gz
+sha256 565d6c4167f83ec697c762ea002f23e8f0b00828d0749b1ce928f068543e5aad  libndp-1.6.tar.gz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index 3fd8ac7bf9..50a1cc9581 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = v1.6
-LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
+LIBNDP_VERSION = 1.6
+LIBNDP_SITE = $(call github,jpirko,libndp,v$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPL-2.1+
 LIBNDP_LICENSE_FILES = COPYING
 LIBNDP_AUTORECONF = YES
diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index f8a63f523e..f856ddad2d 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 08670017fd0bb36594f14197f60bebea27b895511251c7c64df6cd33fc667d34  libopenh264-v1.8.0.tar.gz
+sha256 08670017fd0bb36594f14197f60bebea27b895511251c7c64df6cd33fc667d34  libopenh264-1.8.0.tar.gz
 sha256 dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 96979a9d43..a1796fc131 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = v1.8.0
-LIBOPENH264_SITE = $(call github,cisco,openh264,$(LIBOPENH264_VERSION))
+LIBOPENH264_VERSION = 1.8.0
+LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
 LIBOPENH264_INSTALL_STAGING = YES
diff --git a/package/libpagekite/libpagekite.hash b/package/libpagekite/libpagekite.hash
index 262adc7aab..9923ae8771 100644
--- a/package/libpagekite/libpagekite.hash
+++ b/package/libpagekite/libpagekite.hash
@@ -1,7 +1,7 @@
 # Locally calculated
-sha256  df95bfe95c04b6908e835e13444c1c1883765926f1265e0d2223c42d3c59a4c2  libpagekite-v0.91.171102.tar.gz
+sha256  df95bfe95c04b6908e835e13444c1c1883765926f1265e0d2223c42d3c59a4c2  libpagekite-0.91.171102.tar.gz
 
 # License files, locally calculated
 sha256  ba443b9c9d4273d06aae3e147e9ad1ec199cc9c23455f486a039536d47f57eed  doc/COPYING.md
 sha256  4a271d0bb6bb6e0bac880efddb46da73e6df3dcf0d9ca08a945a232f8ab882ef  doc/LICENSE-2.0.txt
-sha256  8e0f770cabe772d67d36469f6bf413afd2dcfa6ac37acfc65f770cf3a134106d  doc/AGPLv3.txt
+sha256  8e0f770cabe772d67d36469f6bf413afd2dcfa6ac37acfc65f770cf3a134106d  doc/AGPL3.txt
diff --git a/package/libpagekite/libpagekite.mk b/package/libpagekite/libpagekite.mk
index 2c143ba022..aa43b11cb5 100644
--- a/package/libpagekite/libpagekite.mk
+++ b/package/libpagekite/libpagekite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBPAGEKITE_VERSION = v0.91.171102
-LIBPAGEKITE_SITE = $(call github,pagekite,libpagekite,$(LIBPAGEKITE_VERSION))
+LIBPAGEKITE_VERSION = 0.91.171102
+LIBPAGEKITE_SITE = $(call github,pagekite,libpagekite,v$(LIBPAGEKITE_VERSION))
 
 # pkrelay is AGPL-3.0+ but is not built
 LIBPAGEKITE_LICENSE = Apache-2.0 or AGPL-3.0+
diff --git a/package/libpam-tacplus/libpam-tacplus.hash b/package/libpam-tacplus/libpam-tacplus.hash
index ba014347ec..a40c6a014b 100644
--- a/package/libpam-tacplus/libpam-tacplus.hash
+++ b/package/libpam-tacplus/libpam-tacplus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 6e1ce4e3194a4d7823a0f0b352485d5028790e4a0974b9a9619f71b07f79a5fa  libpam-tacplus-v1.5.0-beta.2.tar.gz
+sha256 6e1ce4e3194a4d7823a0f0b352485d5028790e4a0974b9a9619f71b07f79a5fa  libpam-tacplus-1.5.0-beta.2.tar.gz
 sha256 b2b961f07e97c4fb78074276da304ea36b85dc299aae5efb79080cedaea3d5ac  COPYING
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index eebe297f79..9922199420 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBPAM_TACPLUS_VERSION = v1.5.0-beta.2
-LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,$(LIBPAM_TACPLUS_VERSION))
+LIBPAM_TACPLUS_VERSION = 1.5.0-beta.2
+LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,v$(LIBPAM_TACPLUS_VERSION))
 LIBPAM_TACPLUS_LICENSE = GPL-2.0+
 LIBPAM_TACPLUS_LICENSE_FILES = COPYING
 LIBPAM_TACPLUS_DEPENDENCIES = linux-pam
diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index 63e14b1059..4367c92b5d 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 e67b9520ee84f7239be6e948795803bd95495091cc00bf6d0e8c6976032a4af1  librsync-v2.0.2.tar.gz
+sha256 e67b9520ee84f7239be6e948795803bd95495091cc00bf6d0e8c6976032a4af1  librsync-2.0.2.tar.gz
 sha256 5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 3b38e0a27a..1c408c3b17 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = v2.0.2
-LIBRSYNC_SITE = $(call github,librsync,librsync,$(LIBRSYNC_VERSION))
+LIBRSYNC_VERSION = 2.0.2
+LIBRSYNC_SITE = $(call github,librsync,librsync,v$(LIBRSYNC_VERSION))
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
diff --git a/package/librtas/librtas.hash b/package/librtas/librtas.hash
index 0f3d902226..086d0d7cbc 100644
--- a/package/librtas/librtas.hash
+++ b/package/librtas/librtas.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 a79fd9cdb2f03e7401027fb80a07f14e29b86cc2d363126d527b211fea85d025 librtas-v2.0.1.tar.gz
+sha256 a79fd9cdb2f03e7401027fb80a07f14e29b86cc2d363126d527b211fea85d025 librtas-2.0.1.tar.gz
 sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c COPYING.LESSER
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
index f89394a6af..48c8d0143f 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBRTAS_VERSION = v2.0.1
-LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,$(LIBRTAS_VERSION))
+LIBRTAS_VERSION = 2.0.1
+LIBRTAS_SITE = $(call github,ibm-power-utilities,librtas,v$(LIBRTAS_VERSION))
 LIBRTAS_LICENSE = LGPL-2.1+
 LIBRTAS_LICENSE_FILES = COPYING.LESSER
 LIBRTAS_INSTALL_STAGING = YES
diff --git a/package/libscrypt/libscrypt.hash b/package/libscrypt/libscrypt.hash
index bf3f441192..4e35489492 100644
--- a/package/libscrypt/libscrypt.hash
+++ b/package/libscrypt/libscrypt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	68e377e79745c10d489b759b970e52d819dbb80dd8ca61f8c975185df3f457d3	libscrypt-v1.21.tar.gz
+sha256	68e377e79745c10d489b759b970e52d819dbb80dd8ca61f8c975185df3f457d3	libscrypt-1.21.tar.gz
diff --git a/package/libscrypt/libscrypt.mk b/package/libscrypt/libscrypt.mk
index 6086ea95c9..fa89ed31bc 100644
--- a/package/libscrypt/libscrypt.mk
+++ b/package/libscrypt/libscrypt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSCRYPT_VERSION = v1.21
-LIBSCRYPT_SITE = $(call github,technion,libscrypt,$(LIBSCRYPT_VERSION))
+LIBSCRYPT_VERSION = 1.21
+LIBSCRYPT_SITE = $(call github,technion,libscrypt,v$(LIBSCRYPT_VERSION))
 LIBSCRYPT_LICENSE = BSD-2-Clause
 LIBSCRYPT_LICENSE_FILES = LICENSE
 LIBSCRYPT_INSTALL_STAGING = YES
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index 0823903c36..c4ed713880 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b7ee0299157fb7a6a81c99f2e0d7e64429b7d7c0eae43c3a6ef91e87eeed2868 libseccomp-v2.4.0.tar.gz
+sha256 b7ee0299157fb7a6a81c99f2e0d7e64429b7d7c0eae43c3a6ef91e87eeed2868 libseccomp-2.4.0.tar.gz
 sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 90b981f042..4480375f5b 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = v2.4.0
-LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,$(LIBSECCOMP_VERSION))
+LIBSECCOMP_VERSION = 2.4.0
+LIBSECCOMP_SITE = $(call github,seccomp,libseccomp,v$(LIBSECCOMP_VERSION))
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_INSTALL_STAGING = YES
diff --git a/package/libserial/libserial.hash b/package/libserial/libserial.hash
index e82809c71b..30005e39a9 100644
--- a/package/libserial/libserial.hash
+++ b/package/libserial/libserial.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 063142d6bfe08898316e9a6055f2ddeedef56de06f7cfc8dcdfecc6efabf4bdd libserial-v1.0.0.tar.gz
+sha256 063142d6bfe08898316e9a6055f2ddeedef56de06f7cfc8dcdfecc6efabf4bdd libserial-1.0.0.tar.gz
 sha256 c42fdfe17c192cfdb900e22d40ef246db1b473f99165e405eda62b41be27f4bf LICENSE.txt
diff --git a/package/libserial/libserial.mk b/package/libserial/libserial.mk
index 8da7d1cddd..bac0382ba8 100644
--- a/package/libserial/libserial.mk
+++ b/package/libserial/libserial.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSERIAL_VERSION = v1.0.0
-LIBSERIAL_SITE = $(call github,crayzeewulf,libserial,$(LIBSERIAL_VERSION))
+LIBSERIAL_VERSION = 1.0.0
+LIBSERIAL_SITE = $(call github,crayzeewulf,libserial,v$(LIBSERIAL_VERSION))
 LIBSERIAL_INSTALL_STAGING = YES
 LIBSERIAL_LICENSE = BSD-3-Clause
 LIBSERIAL_LICENSE_FILES = LICENSE.txt
diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 1a88673c81..d4b7b54d03 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 44fd7497bce78767e96b54a11bca520adb2ad32effd515f04bce602b60a1a50b  libsrtp-v2.2.0.tar.gz
+sha256 44fd7497bce78767e96b54a11bca520adb2ad32effd515f04bce602b60a1a50b  libsrtp-2.2.0.tar.gz
 sha256 8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index 8af463928b..f816f4c3e0 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = v2.2.0
-LIBSRTP_SITE = $(call github,cisco,libsrtp,$(LIBSRTP_VERSION))
+LIBSRTP_VERSION = 2.2.0
+LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
 LIBSRTP_LICENSE_FILES = LICENSE
diff --git a/package/libtpl/libtpl.hash b/package/libtpl/libtpl.hash
index 7df62f204c..9a455bed97 100644
--- a/package/libtpl/libtpl.hash
+++ b/package/libtpl/libtpl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0b3750bf62f56be4c42f83c89d8449b24f1c5f1605a104801d70f2f3c06fb2ff  libtpl-v1.6.1.tar.gz
+sha256 0b3750bf62f56be4c42f83c89d8449b24f1c5f1605a104801d70f2f3c06fb2ff  libtpl-1.6.1.tar.gz
diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index ed3bfb57bb..ead87a6b6d 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBTPL_VERSION = v1.6.1
-LIBTPL_SITE = $(call github,troydhanson,tpl,$(LIBTPL_VERSION))
+LIBTPL_VERSION = 1.6.1
+LIBTPL_SITE = $(call github,troydhanson,tpl,v$(LIBTPL_VERSION))
 LIBTPL_INSTALL_STAGING = YES
 LIBTPL_LICENSE = BSD-like
 LIBTPL_LICENSE_FILES = LICENSE
diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 81ba5b2672..373c156ca5 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bdde1140087ce97080ea323c3598553ece00a24ae63ac568be78bef3e97f3e25  libuv-v1.29.1.tar.gz
+sha256  bdde1140087ce97080ea323c3598553ece00a24ae63ac568be78bef3e97f3e25  libuv-1.29.1.tar.gz
 sha256  6d20216ae022fbeed23916f48508fd807ece3d8464992330643b0e64e5c0c24b  LICENSE
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index cbf6e384bc..17db3480e8 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.29.1
-LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
+LIBUV_VERSION = 1.29.1
+LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index bcf643b073..dde2f98a63 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256 86df18c694e1c06cc8f83d2d816e9270747a0ce6abe316e93a4f4095689373f6  libvpx-v1.8.0.tar.gz
+sha256 86df18c694e1c06cc8f83d2d816e9270747a0ce6abe316e93a4f4095689373f6  libvpx-1.8.0.tar.gz
 sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256 cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 265fcee1cf..73fe2057de 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = v1.8.0
-LIBVPX_SITE = $(call github,webmproject,libvpx,$(LIBVPX_VERSION))
+LIBVPX_VERSION = 1.8.0
+LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
 LIBVPX_INSTALL_STAGING = YES
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index ea7c8ca6ba..8e33b07316 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	73012d7fcf428dedccc816e83a63a01462e27819d5537b8e0d0c7264bfacfad6    libwebsockets-v2.4.2.tar.gz
+sha256	73012d7fcf428dedccc816e83a63a01462e27819d5537b8e0d0c7264bfacfad6    libwebsockets-2.4.2.tar.gz
 sha256  078fbbbeab357fc6d4f8090e95e9022fa4cb9eac1efd77b2f1387e9ccc51917a    LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 81e398bedd..efdde6de7e 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v2.4.2
-LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
+LIBWEBSOCKETS_VERSION = 2.4.2
+LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
index ecee47447c..d0041ab665 100644
--- a/package/liquid-dsp/liquid-dsp.hash
+++ b/package/liquid-dsp/liquid-dsp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 b136343d644bc1441f7854f2d292bfa054e8d040c0b745879b205f6836dca0f0  liquid-dsp-v1.3.0.tar.gz
+sha256 b136343d644bc1441f7854f2d292bfa054e8d040c0b745879b205f6836dca0f0  liquid-dsp-1.3.0.tar.gz
diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
index 64c403e87f..1dd9921ecd 100644
--- a/package/liquid-dsp/liquid-dsp.mk
+++ b/package/liquid-dsp/liquid-dsp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIQUID_DSP_VERSION = v1.3.0
-LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,$(LIQUID_DSP_VERSION))
+LIQUID_DSP_VERSION = 1.3.0
+LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,v$(LIQUID_DSP_VERSION))
 LIQUID_DSP_LICENSE = MIT
 LIQUID_DSP_LICENSE_FILES = LICENSE
 LIQUID_DSP_INSTALL_STAGING = YES
diff --git a/package/ljsyscall/ljsyscall.hash b/package/ljsyscall/ljsyscall.hash
index 114aa8420d..cb3bea455c 100644
--- a/package/ljsyscall/ljsyscall.hash
+++ b/package/ljsyscall/ljsyscall.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6e29503609bd966fed33dec1a1571b36bbdbc37bf1a828af6722ed0ead192ff1  ljsyscall-v0.12.tar.gz
+sha256 6e29503609bd966fed33dec1a1571b36bbdbc37bf1a828af6722ed0ead192ff1  ljsyscall-0.12.tar.gz
diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index 45e9e82b87..30b5cde22a 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LJSYSCALL_VERSION = v0.12
-LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,$(LJSYSCALL_VERSION))
+LJSYSCALL_VERSION = 0.12
+LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,v$(LJSYSCALL_VERSION))
 LJSYSCALL_LICENSE = MIT
 LJSYSCALL_LICENSE_FILES = COPYRIGHT
 
diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index 40728252b4..d41af2745f 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	f671c1d63a4cd8581b3a4a775fd7864a740b15ad046fe92038bcff5c5134d7e0	lm-sensors-V3-5-0.tar.gz
+sha256	f671c1d63a4cd8581b3a4a775fd7864a740b15ad046fe92038bcff5c5134d7e0	lm-sensors-3-5-0.tar.gz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index cebfcdf427..f8059be47e 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = V3-5-0
-LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,$(LM_SENSORS_VERSION))
+LM_SENSORS_VERSION = 3-5-0
+LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)
diff --git a/package/lua-sdl2/lua-sdl2.hash b/package/lua-sdl2/lua-sdl2.hash
index 80aa1cccb1..690ff147e2 100644
--- a/package/lua-sdl2/lua-sdl2.hash
+++ b/package/lua-sdl2/lua-sdl2.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	cee7875106062fbc00cf8acb3b2738e336e2327df73ede011968cb060c094bfb  lua-sdl2-v2.0.5-6.0.tar.gz
+sha256	cee7875106062fbc00cf8acb3b2738e336e2327df73ede011968cb060c094bfb  lua-sdl2-2.0.5-6.0.tar.gz
diff --git a/package/lua-sdl2/lua-sdl2.mk b/package/lua-sdl2/lua-sdl2.mk
index 31375997b3..a1e54bfded 100644
--- a/package/lua-sdl2/lua-sdl2.mk
+++ b/package/lua-sdl2/lua-sdl2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LUA_SDL2_VERSION = v2.0.5-6.0
-LUA_SDL2_SITE = $(call github,Tangent128,luasdl2,$(LUA_SDL2_VERSION))
+LUA_SDL2_VERSION = 2.0.5-6.0
+LUA_SDL2_SITE = $(call github,Tangent128,luasdl2,v$(LUA_SDL2_VERSION))
 LUA_SDL2_LICENSE = ISC
 LUA_SDL2_LICENSE_FILES = LICENSE
 LUA_SDL2_DEPENDENCIES = luainterpreter sdl2
diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 691ec6c42a..5477cb6395 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256 33af5936ac06536805f9745e0b6d61da606a1f8b4cc5c04dd3cbaca3b9b4fc43  lz4-v1.8.3.tar.gz
+sha256 33af5936ac06536805f9745e0b6d61da606a1f8b4cc5c04dd3cbaca3b9b4fc43  lz4-1.8.3.tar.gz
 sha256 d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index a7152cb531..70e193c51a 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LZ4_VERSION = v1.8.3
-LZ4_SITE = $(call github,lz4,lz4,$(LZ4_VERSION))
+LZ4_VERSION = 1.8.3
+LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
 LZ4_LICENSE_FILES = lib/LICENSE programs/COPYING
diff --git a/package/mfgtools/mfgtools.hash b/package/mfgtools/mfgtools.hash
index 4932a80dba..0b215f5295 100644
--- a/package/mfgtools/mfgtools.hash
+++ b/package/mfgtools/mfgtools.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-v0.02.tar.gz
+sha256  055d71227d18883d6e8bc9e854c076015f9a7749820a94272e19071bf0b25c89  mfgtools-0.02.tar.gz
 sha256  2655559a6bb1179eae514f5c7166f4ede4f2453efa9cf4dc3c045cab5d57dede  LICENSE
 sha256  0963b6e5086bf454265b0f57821a02b681d1211e40ad74c310231cb4d94815c9  README.txt
diff --git a/package/mfgtools/mfgtools.mk b/package/mfgtools/mfgtools.mk
index e4663a8af9..48ce5dda28 100644
--- a/package/mfgtools/mfgtools.mk
+++ b/package/mfgtools/mfgtools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MFGTOOLS_VERSION = v0.02
-MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,$(MFGTOOLS_VERSION))
+MFGTOOLS_VERSION = 0.02
+MFGTOOLS_SITE = $(call github,codeauroraforum,mfgtools,v$(MFGTOOLS_VERSION))
 MFGTOOLS_SUBDIR = MfgToolLib
 MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
 MFGTOOLS_LICENSE_FILES = LICENSE README.txt
diff --git a/package/micropython-lib/micropython-lib.hash b/package/micropython-lib/micropython-lib.hash
index f63c52cf0c..1ba662ac8d 100644
--- a/package/micropython-lib/micropython-lib.hash
+++ b/package/micropython-lib/micropython-lib.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd57183c7  micropython-lib-v1.9.3.tar.gz
+sha256 66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd57183c7  micropython-lib-1.9.3.tar.gz
diff --git a/package/micropython-lib/micropython-lib.mk b/package/micropython-lib/micropython-lib.mk
index 3c46b92429..78ac0d3b35 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MICROPYTHON_LIB_VERSION = v1.9.3
-MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,$(MICROPYTHON_LIB_VERSION))
+MICROPYTHON_LIB_VERSION = 1.9.3
+MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-lib,v$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python-2.0 (some modules), MIT (everything else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
 
diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 88068a60f3..d0052ba299 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,2 @@
 #locally computed
-sha256 9a66205d0ba3dff6dcc98119f104cd59c15855c6c030a190ca02354be52836c1  micropython-v1.9.4.tar.gz
+sha256 9a66205d0ba3dff6dcc98119f104cd59c15855c6c030a190ca02354be52836c1  micropython-1.9.4.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index cff8b17b14..cd6f674094 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.9.4
-MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
+MICROPYTHON_VERSION = 1.9.4
+MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
diff --git a/package/mini-snmpd/mini-snmpd.hash b/package/mini-snmpd/mini-snmpd.hash
index 19118b7f96..de72bb59eb 100644
--- a/package/mini-snmpd/mini-snmpd.hash
+++ b/package/mini-snmpd/mini-snmpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 59f84e94ef7c9ff36d243c7974a100903a4a9a0bb529b67cf6f0d3352138a86b mini-snmpd-v1.4.tar.gz
+sha256 59f84e94ef7c9ff36d243c7974a100903a4a9a0bb529b67cf6f0d3352138a86b mini-snmpd-1.4.tar.gz
 sha256 8a43b895972a24567297f44f35dab0f5f9ed3b7db6dac0bf6094075b27ab9d56 COPYING
diff --git a/package/mini-snmpd/mini-snmpd.mk b/package/mini-snmpd/mini-snmpd.mk
index ebcbcce1ce..f2480e3168 100644
--- a/package/mini-snmpd/mini-snmpd.mk
+++ b/package/mini-snmpd/mini-snmpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MINI_SNMPD_VERSION = v1.4
-MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,$(MINI_SNMPD_VERSION))
+MINI_SNMPD_VERSION = 1.4
+MINI_SNMPD_SITE = $(call github,troglobit,mini-snmpd,v$(MINI_SNMPD_VERSION))
 MINI_SNMPD_LICENSE = GPL-2.0
 MINI_SNMPD_LICENSE_FILES = COPYING
 MINI_SNMPD_AUTORECONF = YES
diff --git a/package/mraa/mraa.hash b/package/mraa/mraa.hash
index cbd70a4606..abe6d9f84a 100644
--- a/package/mraa/mraa.hash
+++ b/package/mraa/mraa.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 e4501e6936afb426c75b7d406c1a7a27b514297f640e887de4d88a2d9687f37b  mraa-v0.9.1.tar.gz
+sha256 e4501e6936afb426c75b7d406c1a7a27b514297f640e887de4d88a2d9687f37b  mraa-0.9.1.tar.gz
diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
index 42cc2e3356..5077859fa5 100644
--- a/package/mraa/mraa.mk
+++ b/package/mraa/mraa.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MRAA_VERSION = v0.9.1
-MRAA_SITE = $(call github,intel-iot-devkit,mraa,$(MRAA_VERSION))
+MRAA_VERSION = 0.9.1
+MRAA_SITE = $(call github,intel-iot-devkit,mraa,v$(MRAA_VERSION))
 MRAA_LICENSE = MIT
 MRAA_LICENSE_FILES = COPYING
 MRAA_INSTALL_STAGING = YES
diff --git a/package/ne10/ne10.hash b/package/ne10/ne10.hash
index db5b6f1277..a9635e4011 100644
--- a/package/ne10/ne10.hash
+++ b/package/ne10/ne10.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-v1.2.0.tar.gz
+sha256 450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-1.2.0.tar.gz
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index cb303bd7b2..2af664be39 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NE10_VERSION = v1.2.0
-NE10_SITE = $(call github,projectNe10,Ne10,$(NE10_VERSION))
+NE10_VERSION = 1.2.0
+NE10_SITE = $(call github,projectNe10,Ne10,v$(NE10_VERSION))
 NE10_LICENSE = BSD-3-Clause or Apache-2.0
 NE10_LICENSE_FILES = doc/LICENSE
 NE10_INSTALL_STAGING = YES
diff --git a/package/nginx-dav-ext/nginx-dav-ext.hash b/package/nginx-dav-ext/nginx-dav-ext.hash
index a711f8c6ff..fbed87f0c0 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.hash
+++ b/package/nginx-dav-ext/nginx-dav-ext.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a  nginx-dav-ext-v0.1.0.tar.gz
+sha256 6b004eed8ea16ad8de4d304027bf0413cc323a95914e58625a7dc066481aae3a  nginx-dav-ext-0.1.0.tar.gz
 sha256 40581cf424621965adaf1461e97129520ff4fcfb62ed9965ec6fd50b7f4ddfca  LICENSE
diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
index 436bc295ad..695287ee2c 100644
--- a/package/nginx-dav-ext/nginx-dav-ext.mk
+++ b/package/nginx-dav-ext/nginx-dav-ext.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NGINX_DAV_EXT_VERSION = v0.1.0
-NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,$(NGINX_DAV_EXT_VERSION))
+NGINX_DAV_EXT_VERSION = 0.1.0
+NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,v$(NGINX_DAV_EXT_VERSION))
 NGINX_DAV_EXT_LICENSE = BSD-2-Clause
 NGINX_DAV_EXT_LICENSE_FILES = LICENSE
 NGINX_DAV_EXT_DEPENDENCIES = expat
diff --git a/package/nilfs-utils/nilfs-utils.hash b/package/nilfs-utils/nilfs-utils.hash
index bf80367068..3383bfc9d8 100644
--- a/package/nilfs-utils/nilfs-utils.hash
+++ b/package/nilfs-utils/nilfs-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha512	8a73b807bbdb2dc56b100ab8fbffe8129c9db31a6cbceecf267bdeb726fc13dd6844ce8ef96690bd7786709cb884881a3cd6d3cf24290248c5abc457976e9487  nilfs-utils-v2.2.7.tar.gz
+sha512	8a73b807bbdb2dc56b100ab8fbffe8129c9db31a6cbceecf267bdeb726fc13dd6844ce8ef96690bd7786709cb884881a3cd6d3cf24290248c5abc457976e9487  nilfs-utils-2.2.7.tar.gz
 sha512	4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
index 3fde94fd4f..d740589ee5 100644
--- a/package/nilfs-utils/nilfs-utils.mk
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NILFS_UTILS_VERSION = v2.2.7
-NILFS_UTILS_SITE = $(call github,nilfs-dev,nilfs-utils,$(NILFS_UTILS_VERSION))
+NILFS_UTILS_VERSION = 2.2.7
+NILFS_UTILS_SITE = $(call github,nilfs-dev,nilfs-utils,v$(NILFS_UTILS_VERSION))
 NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 NILFS_UTILS_LICENSE_FILES = COPYING
 
diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index cc49907e3b..f0b69e7f87 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 5d7ec75828f8d3fd1a0c2f31b5b0cea780cdfe1031359228c428c1a48bfcd5b9 ninja-v1.9.0.tar.gz
+sha256 5d7ec75828f8d3fd1a0c2f31b5b0cea780cdfe1031359228c428c1a48bfcd5b9 ninja-1.9.0.tar.gz
 sha256 eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index f29ab0a930..4897012150 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NINJA_VERSION = v1.9.0
-NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
+NINJA_VERSION = 1.9.0
+NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index d93af1a7bb..2536d94754 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7c3e819c2bdeb883de68bafe88776a01356f7ef565e75ba866c4b49a087c6bdf        numactl-v2.0.12.tar.gz
+sha256 7c3e819c2bdeb883de68bafe88776a01356f7ef565e75ba866c4b49a087c6bdf        numactl-2.0.12.tar.gz
 sha256 e2b738b1303c088421b09933a78c1326fe43692e2c05a7c510a2eb7e7a8eb575        README.md
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 9efbcb5f67..07c8a806bd 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = v2.0.12
-NUMACTL_SITE = $(call github,numactl,numactl,$(NUMACTL_VERSION))
+NUMACTL_VERSION = 2.0.12
+NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
 NUMACTL_LICENSE_FILES = README.md
 NUMACTL_INSTALL_STAGING = YES
diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
index 1f7be5aef9..0092c9a6ed 100644
--- a/package/nvme/nvme.hash
+++ b/package/nvme/nvme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 3a139d40ffff48d2f0b06339fd3be3ed219241ce6838f0ea173d7459c9984ea2 nvme-v1.7.tar.gz
+sha256 3a139d40ffff48d2f0b06339fd3be3ed219241ce6838f0ea173d7459c9984ea2 nvme-1.7.tar.gz
 sha256 a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753 LICENSE
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 1762a756c6..1a9061fc21 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NVME_VERSION = v1.7
-NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
+NVME_VERSION = 1.7
+NVME_SITE = $(call github,linux-nvme,nvme-cli,v$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
 
diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index da4c59a6e7..a167d88fa9 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e64c8fe083832ffbc1459ab6c72f71d53afd3b36e8497c922a15a06b72e9002f  openblas-v0.3.6.tar.gz
+sha256 e64c8fe083832ffbc1459ab6c72f71d53afd3b36e8497c922a15a06b72e9002f  openblas-0.3.6.tar.gz
 sha256 190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 963295ef94..c2e9e77794 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = v0.3.6
-OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,$(OPENBLAS_VERSION))
+OPENBLAS_VERSION = 0.3.6
+OPENBLAS_SITE = $(call github,xianyi,OpenBLAS,v$(OPENBLAS_VERSION))
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
index c5085ba9ce..591c0e4a0a 100644
--- a/package/opentracing-cpp/opentracing-cpp.hash
+++ b/package/opentracing-cpp/opentracing-cpp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 015c4187f7a6426a2b5196f0ccd982aa87f010cf61f507ae3ce5c90523f92301 opentracing-cpp-v1.5.1.tar.gz
+sha256 015c4187f7a6426a2b5196f0ccd982aa87f010cf61f507ae3ce5c90523f92301 opentracing-cpp-1.5.1.tar.gz
 sha256 076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717 LICENSE
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
index a61993f7f2..d466a80237 100644
--- a/package/opentracing-cpp/opentracing-cpp.mk
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENTRACING_CPP_VERSION = v1.5.1
-OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,$(OPENTRACING_CPP_VERSION))
+OPENTRACING_CPP_VERSION = 1.5.1
+OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
 OPENTRACING_CPP_LICENSE = Apache-2.0
 OPENTRACING_CPP_LICENSE_FILES = LICENSE
 
diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
index 154a6443c0..897973c8d0 100644
--- a/package/openzwave/openzwave.hash
+++ b/package/openzwave/openzwave.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	3b11dffa7608359c8c848451863e0287e17f5f101aeee7c2e89b7dc16f87050b	openzwave-v1.6.tar.gz
+sha256	3b11dffa7608359c8c848451863e0287e17f5f101aeee7c2e89b7dc16f87050b	openzwave-1.6.tar.gz
 sha256	c8db08727d03bea1213cdb29459b4b489b0d68a0866765df40ff205c6cd7224b	license/license.txt
 sha256	4da452226e9064b597020ad404e1c78d8175bc31ad7c1908485a92c0a4d70284	license/lgpl.txt
 sha256	33ffdead480674d5f33e2934822a3b93c93e3f8c894667a3bf30bd1195b38f83	license/gpl.txt
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 3f9e177198..d343f9aadf 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENZWAVE_VERSION = v1.6
-OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
+OPENZWAVE_VERSION = 1.6
+OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,v$(OPENZWAVE_VERSION))
 OPENZWAVE_LICENSE = LGPL-3.0+, GPL-3.0 (examples), Apache-2.0 (sh2ju.sh)
 OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
 	license/gpl.txt license/Apache-License-2.0.txt
diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index d628d06611..5171c8caa4 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  87cf846b02dde6328b84832287d8725d91f12f41366eecb4d59eeda1d6c7efdf  paho-mqtt-c-v1.3.0.tar.gz
+sha256  87cf846b02dde6328b84832287d8725d91f12f41366eecb4d59eeda1d6c7efdf  paho-mqtt-c-1.3.0.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 9e8ae29999..6b4fc2be03 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = v1.3.0
-PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,$(PAHO_MQTT_C_VERSION))
+PAHO_MQTT_C_VERSION = 1.3.0
+PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
 PAHO_MQTT_C_INSTALL_STAGING = YES
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
index 20374e9dc1..d4af11b830 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  9f78afb988e9ce9bb7cb74805053221efbb073b74683e222d1d087633178b51f  paho-mqtt-cpp-v1.0.0.tar.gz
+sha256  9f78afb988e9ce9bb7cb74805053221efbb073b74683e222d1d087633178b51f  paho-mqtt-cpp-1.0.0.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 694d30d0eb..16e524a96c 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PAHO_MQTT_CPP_VERSION = v1.0.0
-PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,$(PAHO_MQTT_CPP_VERSION))
+PAHO_MQTT_CPP_VERSION = 1.0.0
+PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
 PAHO_MQTT_CPP_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
 PAHO_MQTT_CPP_INSTALL_STAGING = YES
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 2f11ad5996..35a26edddd 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 da65ebbd9a710555e9684472ee36fff37e897111034fcc2c07172cc39016d169 pdbg-v2.0.tar.gz
+sha256 da65ebbd9a710555e9684472ee36fff37e897111034fcc2c07172cc39016d169 pdbg-2.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index ba3b0b8877..c92920a6d6 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PDBG_VERSION = v2.0
-PDBG_SITE = $(call github,open-power,pdbg,$(PDBG_VERSION))
+PDBG_VERSION = 2.0
+PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
 PDBG_AUTORECONF = YES
diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
index 3df55fafff..50384f9fb3 100644
--- a/package/pigpio/pigpio.hash
+++ b/package/pigpio/pigpio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	ec980f5e672e8e9395b801fecec3fbbbc5c04182b16ee72eb9ca25a453e38062  pigpio-V68.tar.gz
+sha256	ec980f5e672e8e9395b801fecec3fbbbc5c04182b16ee72eb9ca25a453e38062  pigpio-68.tar.gz
 sha256	6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 3071036db4..dc60204aab 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PIGPIO_VERSION = V68
-PIGPIO_SITE = $(call github,joan2937,pigpio,$(PIGPIO_VERSION))
+PIGPIO_VERSION = 68
+PIGPIO_SITE = $(call github,joan2937,pigpio,V$(PIGPIO_VERSION))
 PIGPIO_LICENSE = Unlicense
 PIGPIO_LICENSE_FILES = UNLICENCE
 
diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index 843fd4fba8..ec75b4e530 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52  pigz-v2.4.tar.gz
+sha256  e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52  pigz-2.4.tar.gz
 sha256	dc8f78258cdb4478b5922f4c00eb63d3cbac06c171dc829648fd414bb0cf4493  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index ac4f94027c..b4f28c048e 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PIGZ_VERSION = v2.4
-PIGZ_SITE = $(call github,madler,pigz,$(PIGZ_VERSION))
+PIGZ_VERSION = 2.4
+PIGZ_SITE = $(call github,madler,pigz,v$(PIGZ_VERSION))
 PIGZ_DEPENDENCIES = zlib
 PIGZ_LICENSE = Zlib
 PIGZ_LICENSE_FILES = README
diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index b493be086b..0e86d8ccae 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 77efe3978ac9c251c4728a35b9aebd6076583939a8e26cc7f07ffa86432a8bf0 powerpc-utils-v1.3.5.tar.gz
+sha256 77efe3978ac9c251c4728a35b9aebd6076583939a8e26cc7f07ffa86432a8bf0 powerpc-utils-1.3.5.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index a3bd8832ff..221e5b04e6 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = v1.3.5
-POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,$(POWERPC_UTILS_VERSION))
+POWERPC_UTILS_VERSION = 1.3.5
+POWERPC_UTILS_SITE = $(call github,ibm-power-utilities,powerpc-utils,v$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib
 POWERPC_UTILS_AUTORECONF = YES
 POWERPC_UTILS_LICENSE = GPL-2.0+
diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index e22a9f1c33..03c2e70e96 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 fd8f6f5d6927330cf2b8b4ec8332de8b1ee2b8f2480b52ee3f221aad6de2082c protobuf-c-v1.3.0.tar.gz
+sha256 fd8f6f5d6927330cf2b8b4ec8332de8b1ee2b8f2480b52ee3f221aad6de2082c protobuf-c-1.3.0.tar.gz
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 34f8294412..74fe295640 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = v1.3.0
-PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
+PROTOBUF_C_VERSION = 1.3.0
+PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,v$(PROTOBUF_C_VERSION))
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
 PROTOBUF_C_MAKE = $(MAKE1)
diff --git a/package/python-configshell-fb/python-configshell-fb.hash b/package/python-configshell-fb/python-configshell-fb.hash
index 7bf4d347ca..58f0564ccc 100644
--- a/package/python-configshell-fb/python-configshell-fb.hash
+++ b/package/python-configshell-fb/python-configshell-fb.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  3685446d6ee02881930bb2fdc5fdd254938da66ce9843a5b3676c4246b058e4b  python-configshell-fb-v1.1.fb18.tar.gz
+sha256  3685446d6ee02881930bb2fdc5fdd254938da66ce9843a5b3676c4246b058e4b  python-configshell-fb-1.1.fb18.tar.gz
diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index a2e9cae157..94b6fed5ab 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -6,8 +6,8 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and targetcli-fb at the same time.
-PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb18
-PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,$(PYTHON_CONFIGSHELL_FB_VERSION))
+PYTHON_CONFIGSHELL_FB_VERSION = 1.1.fb18
+PYTHON_CONFIGSHELL_FB_SITE = $(call github,open-iscsi,configshell-fb,v$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
 PYTHON_CONFIGSHELL_FB_SETUP_TYPE = setuptools
diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 27f2e6c7a2..ccc388d932 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 from https://pypi.org/project/pyDAL/#files
-sha256 763ed017f431fc3d9fa9243f6be2519ff49b8a260d15763c4733762d9c086904  python-pydal-v18.09.tar.gz
+sha256 763ed017f431fc3d9fa9243f6be2519ff49b8a260d15763c4733762d9c086904  python-pydal-18.09.tar.gz
 sha256 ae7d7b6888bb72f26af2bcbee69ae6f8a49e12f66c99e78f2a8b806effc5219d  LICENSE
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 4ff58def69..8ef06bc036 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = v18.09
-PYTHON_PYDAL_SITE = $(call github,web2py,pydal,$(PYTHON_PYDAL_VERSION))
+PYTHON_PYDAL_VERSION = 18.09
+PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
 PYTHON_PYDAL_SETUP_TYPE = setuptools
diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index c930795eb1..25f8586752 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  e33bd0dfbd2cbd4dbc686ca87f809aebb7d72e940eb5846d5d38bb0f3371b26a  python-pymodbus-v1.4.0.tar.gz
+sha256  e33bd0dfbd2cbd4dbc686ca87f809aebb7d72e940eb5846d5d38bb0f3371b26a  python-pymodbus-1.4.0.tar.gz
 sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  doc/LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 40470fe92e..0040afd894 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = v1.4.0
-PYTHON_PYMODBUS_SITE = $(call github,riptideio,pymodbus,$(PYTHON_PYMODBUS_VERSION))
+PYTHON_PYMODBUS_VERSION = 1.4.0
+PYTHON_PYMODBUS_SITE = $(call github,riptideio,pymodbus,v$(PYTHON_PYMODBUS_VERSION))
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = doc/LICENSE
diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
index 11995fb8f4..0bca6e6d2c 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a9ec181bf3c7c0635862413fc86cb0950b5af957541535f530ea86a0f9d14e73  python-pyparted-v3.11.0.tar.gz
+sha256  a9ec181bf3c7c0635862413fc86cb0950b5af957541535f530ea86a0f9d14e73  python-pyparted-3.11.0.tar.gz
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index 0378830807..c4783459ab 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PYPARTED_VERSION = v3.11.0
-PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,$(PYTHON_PYPARTED_VERSION))
+PYTHON_PYPARTED_VERSION = 3.11.0
+PYTHON_PYPARTED_SITE = $(call github,rhinstaller,pyparted,v$(PYTHON_PYPARTED_VERSION))
 PYTHON_PYPARTED_SETUP_TYPE = distutils
 PYTHON_PYPARTED_LICENSE = GPL-2.0+
 PYTHON_PYPARTED_LICENSE_FILES = COPYING
diff --git a/package/python-remi/python-remi.hash b/package/python-remi/python-remi.hash
index 870e882b73..248772f866 100644
--- a/package/python-remi/python-remi.hash
+++ b/package/python-remi/python-remi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 bb82f3f329aef387b3823e7e9b9d06b85a7deb0a4dc9078a4323812e26abb459  python-remi-v1.1.tar.gz
+sha256 bb82f3f329aef387b3823e7e9b9d06b85a7deb0a4dc9078a4323812e26abb459  python-remi-1.1.tar.gz
 sha256 bc198f9846c1da3a1c1b1fa2b12909b021365d1e7fe9b4039245edfcec3b7f7f  LICENSE
diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
index b6c50a3733..1e1910c811 100644
--- a/package/python-remi/python-remi.mk
+++ b/package/python-remi/python-remi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_REMI_VERSION = v1.1
-PYTHON_REMI_SITE = $(call github,dddomodossola,remi,$(PYTHON_REMI_VERSION))
+PYTHON_REMI_VERSION = 1.1
+PYTHON_REMI_SITE = $(call github,dddomodossola,remi,v$(PYTHON_REMI_VERSION))
 PYTHON_REMI_LICENSE = Apache-2.0
 PYTHON_REMI_LICENSE_FILES = LICENSE
 PYTHON_REMI_SETUP_TYPE = setuptools
diff --git a/package/python-rtslib-fb/python-rtslib-fb.hash b/package/python-rtslib-fb/python-rtslib-fb.hash
index fd0618581e..80f4450fd9 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.hash
+++ b/package/python-rtslib-fb/python-rtslib-fb.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  d5d81a78046b4c228d29ba88d9950e0f63858e5fcf601e3d0f8bf107fbaadc03  python-rtslib-fb-v2.1.fb57.tar.gz
+sha256  d5d81a78046b4c228d29ba88d9950e0f63858e5fcf601e3d0f8bf107fbaadc03  python-rtslib-fb-2.1.fb57.tar.gz
diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index 8236fb8eb1..421fbed0ae 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -6,9 +6,9 @@
 
 # When upgrading the version, be sure to also upgrade
 # python-configshell-fb and targetcli-fb at the same time.
-PYTHON_RTSLIB_FB_VERSION = v2.1.fb57
+PYTHON_RTSLIB_FB_VERSION = 2.1.fb57
 # Do not switch site to PyPI: it does not contain the latest version.
-PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
+PYTHON_RTSLIB_FB_SITE = $(call github,open-iscsi,rtslib-fb,v$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
 PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
 PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
diff --git a/package/python-scapy3k/python-scapy3k.hash b/package/python-scapy3k/python-scapy3k.hash
index 36d5dfed3c..57a636dd35 100644
--- a/package/python-scapy3k/python-scapy3k.hash
+++ b/package/python-scapy3k/python-scapy3k.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  a4c68ef2f787d82a3aec8640cac8dbab6f5b9e31ae4d89a1877efbb9150a9e25  python-scapy3k-v0.18.tar.gz
+sha256  a4c68ef2f787d82a3aec8640cac8dbab6f5b9e31ae4d89a1877efbb9150a9e25  python-scapy3k-0.18.tar.gz
diff --git a/package/python-scapy3k/python-scapy3k.mk b/package/python-scapy3k/python-scapy3k.mk
index e858dcc728..63f081e3fc 100644
--- a/package/python-scapy3k/python-scapy3k.mk
+++ b/package/python-scapy3k/python-scapy3k.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_SCAPY3K_VERSION = v0.18
-PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,$(PYTHON_SCAPY3K_VERSION))
+PYTHON_SCAPY3K_VERSION = 0.18
+PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,v$(PYTHON_SCAPY3K_VERSION))
 PYTHON_SCAPY3K_SETUP_TYPE = distutils
 PYTHON_SCAPY3K_LICENSE = GPL-2.0+
 
diff --git a/package/qdecoder/qdecoder.hash b/package/qdecoder/qdecoder.hash
index 181cbd7aab..0c95d2c27b 100644
--- a/package/qdecoder/qdecoder.hash
+++ b/package/qdecoder/qdecoder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 01d4852b9343757abe98bbdb9d4bf0dc142ccb602ec921906ddde32c16164376  qdecoder-v12.0.7.tar.gz
+sha256 01d4852b9343757abe98bbdb9d4bf0dc142ccb602ec921906ddde32c16164376  qdecoder-12.0.7.tar.gz
 sha256 17e647523e5c5c75fd02861dcf3ea91a146d918ab303460ee58135c9dd70904e  COPYING
diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 1112f0707b..ab95885c32 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QDECODER_VERSION = v12.0.7
-QDECODER_SITE = $(call github,wolkykim,qdecoder,$(QDECODER_VERSION))
+QDECODER_VERSION = 12.0.7
+QDECODER_SITE = $(call github,wolkykim,qdecoder,v$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2
 QDECODER_LICENSE_FILES = COPYING
 QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
diff --git a/package/qlibc/qlibc.hash b/package/qlibc/qlibc.hash
index 8fa0cf6503..616194f8d9 100644
--- a/package/qlibc/qlibc.hash
+++ b/package/qlibc/qlibc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 93512e2203aaadda7aa62039b29500d9236b878e16f070328c58dc9d23da94d7  qlibc-v2.4.4.tar.gz
+sha256 93512e2203aaadda7aa62039b29500d9236b878e16f070328c58dc9d23da94d7  qlibc-2.4.4.tar.gz
 sha256 7c9d03656af4c0acf0a35e29459086498dd64080eac6d2945bc1c064aaf18132  LICENSE
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index b186dfd32f..1b234f7e47 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QLIBC_VERSION = v2.4.4
-QLIBC_SITE = $(call github,wolkykim,qlibc,$(QLIBC_VERSION))
+QLIBC_VERSION = 2.4.4
+QLIBC_SITE = $(call github,wolkykim,qlibc,v$(QLIBC_VERSION))
 QLIBC_LICENSE = BSD-2-Clause
 QLIBC_LICENSE_FILES = LICENSE
 
diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
index 0af88774e6..19fd1cf064 100644
--- a/package/rabbitmq-c/rabbitmq-c.hash
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 316c0d156452b488124806911a62e0c2aa8a546d38fc8324719cd29aaa493024 rabbitmq-c-v0.9.0.tar.gz
+sha256 316c0d156452b488124806911a62e0c2aa8a546d38fc8324719cd29aaa493024 rabbitmq-c-0.9.0.tar.gz
 sha256 94a12c906acb31a66c2c8a6c1b6e46cab52bc5694c5ada2a06d86b05d3d3f422 LICENSE-MIT
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 6385ccb6b6..63e05099d9 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RABBITMQ_C_VERSION = v0.9.0
-RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,$(RABBITMQ_C_VERSION))
+RABBITMQ_C_VERSION = 0.9.0
+RABBITMQ_C_SITE = $(call github,alanxz,rabbitmq-c,v$(RABBITMQ_C_VERSION))
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
 RABBITMQ_C_INSTALL_STAGING = YES
diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
index a4b02cffb9..e8b2c4d547 100644
--- a/package/rapidjson/rapidjson.hash
+++ b/package/rapidjson/rapidjson.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e  rapidjson-v1.1.0.tar.gz
+sha256 bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e  rapidjson-1.1.0.tar.gz
 sha256 a140e5d46fe734a1c78f1a3c3ef207871dd75648be71fdda8e309b23ab8b1f32  license.txt
diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index 4d69bc3450..9f1c82ce40 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RAPIDJSON_VERSION = v1.1.0
-RAPIDJSON_SITE = $(call github,miloyip,rapidjson,$(RAPIDJSON_VERSION))
+RAPIDJSON_VERSION = 1.1.0
+RAPIDJSON_SITE = $(call github,miloyip,rapidjson,v$(RAPIDJSON_VERSION))
 RAPIDJSON_LICENSE = MIT
 RAPIDJSON_LICENSE_FILES = license.txt
 
diff --git a/package/reaver/reaver.hash b/package/reaver/reaver.hash
index 9a75215282..fad81fe326 100644
--- a/package/reaver/reaver.hash
+++ b/package/reaver/reaver.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256 e6761d2d4ef9cb2b45fe0a60d6b94048ce4442e4ac209904fe89506ff1e94c44 reaver-v1.6.5.tar.gz
+sha256 e6761d2d4ef9cb2b45fe0a60d6b94048ce4442e4ac209904fe89506ff1e94c44 reaver-1.6.5.tar.gz
 sha256 bb40cfd5e9ca6e8465ea3c236f3f2293e8300af1bfe87e72fabe482ae6cc995a docs/LICENSE
diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
index 42b2aaa955..093ac935af 100644
--- a/package/reaver/reaver.mk
+++ b/package/reaver/reaver.mk
@@ -6,8 +6,8 @@
 
 # Older repos for this project will not cross-compile easily
 # while this one works right away
-REAVER_VERSION = v1.6.5
-REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,$(REAVER_VERSION))
+REAVER_VERSION = 1.6.5
+REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,v$(REAVER_VERSION))
 REAVER_LICENSE = GPL-2.0+
 REAVER_LICENSE_FILES = docs/LICENSE
 
diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 969bb0bfb3..4f663affc4 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	efe4ff9bbe49b19074346d65c914d809c0a3e90d062ea9619fe240f931f0b700  runc-v1.0.0-rc8.tar.gz
+sha256	efe4ff9bbe49b19074346d65c914d809c0a3e90d062ea9619fe240f931f0b700  runc-1.0.0-rc8.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 55097e5a17..b858742905 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RUNC_VERSION = v1.0.0-rc8
-RUNC_SITE = $(call github,opencontainers,runc,$(RUNC_VERSION))
+RUNC_VERSION = 1.0.0-rc8
+RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index 2a6fe86a53..af5674da06 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	51f66832853322a4fbe677e196ab4c68317261829edb5e56725ed96a07ea50e6	safeclib-v03032018.tar.gz
+sha256	51f66832853322a4fbe677e196ab4c68317261829edb5e56725ed96a07ea50e6	safeclib-03032018.tar.gz
 sha256	c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b	COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index e4aaa3ff57..2dffa7229a 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = v03032018
-SAFECLIB_SITE = $(call github,rurban,safeclib,$(SAFECLIB_VERSION))
+SAFECLIB_VERSION = 03032018
+SAFECLIB_SITE = $(call github,rurban,safeclib,v$(SAFECLIB_VERSION))
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
index 6e19207066..634aa73454 100644
--- a/package/shellinabox/shellinabox.hash
+++ b/package/shellinabox/shellinabox.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 27a5ec6c3439f87aee238c47cc56e7357a6249e5ca9ed0f044f0057ef389d81e  shellinabox-v2.20.tar.gz
+sha256 27a5ec6c3439f87aee238c47cc56e7357a6249e5ca9ed0f044f0057ef389d81e  shellinabox-2.20.tar.gz
 sha256 04ef60ab9b83cde6f0862ea18474454477efb34c52ebce1f8d8260a398a39362  COPYING
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL-2
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
index 70db551e3c..be36804cb7 100644
--- a/package/shellinabox/shellinabox.mk
+++ b/package/shellinabox/shellinabox.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SHELLINABOX_VERSION = v2.20
-SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,$(SHELLINABOX_VERSION))
+SHELLINABOX_VERSION = 2.20
+SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,v$(SHELLINABOX_VERSION))
 SHELLINABOX_LICENSE = GPL-2.0 with OpenSSL exception
 SHELLINABOX_LICENSE_FILES = COPYING GPL-2
 
diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index f751a14632..a751d95394 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -2,5 +2,5 @@
 md5 094e76786b118258bac69e1514aac826  sngrep-1.4.6.tar.gz
 
 # Locally computed
-sha256 638d6557dc68db401b07d73b2e7f8276800281f021fe0c942992566d6b59a48a sngrep-v1.4.6.tar.gz
+sha256 638d6557dc68db401b07d73b2e7f8276800281f021fe0c942992566d6b59a48a sngrep-1.4.6.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index c6d2a292b3..1cb3814c9e 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SNGREP_VERSION = v1.4.6
-SNGREP_SITE = $(call github,irontec,sngrep,$(SNGREP_VERSION))
+SNGREP_VERSION = 1.4.6
+SNGREP_SITE = $(call github,irontec,sngrep,v$(SNGREP_VERSION))
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
 SNGREP_AUTORECONF = YES
diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index fdbbbca39d..986aac859b 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 fbf6e04c4451d0cb1555c3a53c178b5453c7d761119f82fd693538c9f115fecb softether-v4.28-9669-beta.tar.gz
+sha256 fbf6e04c4451d0cb1555c3a53c178b5453c7d761119f82fd693538c9f115fecb softether-4.28-9669-beta.tar.gz
 sha256 0a889e7e7a277397d0a2d56c37814eefd8c6b6129d8b74ee2d27fc3415fad561 LICENSE
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 1a31abd4bd..a7a10c79c8 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = v4.28-9669-beta
-SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN_stable,$(SOFTETHER_VERSION))
+SOFTETHER_VERSION = 4.28-9669-beta
+SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,v$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
 SOFTETHER_DEPENDENCIES = host-pkgconf host-softether libopenssl readline
diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index 9216668536..7ebfc23f75 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2f803017378c7479cb791be59b7bad8392a15acddbcc094e4433581fe421f4ca  sqlcipher-v4.0.1.tar.gz
+sha256  2f803017378c7479cb791be59b7bad8392a15acddbcc094e4433581fe421f4ca  sqlcipher-4.0.1.tar.gz
 sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index a16d94d1dc..d4f7a19973 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = v4.0.1
-SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,$(SQLCIPHER_VERSION))
+SQLCIPHER_VERSION = 4.0.1
+SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,v$(SQLCIPHER_VERSION))
 SQLCIPHER_LICENSE = BSD-3-Clause
 SQLCIPHER_LICENSE_FILES = LICENSE
 SQLCIPHER_DEPENDENCIES = host-pkgconf openssl host-tcl
diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
index efb2b54d9c..aba3fe6a71 100644
--- a/package/sunxi-tools/sunxi-tools.hash
+++ b/package/sunxi-tools/sunxi-tools.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	da5d762608517b4b2e9bd392bd9a63afae3973d9c8264cbcfb757ddac8120d1b  sunxi-tools-v1.4.1.tar.gz
+sha256	da5d762608517b4b2e9bd392bd9a63afae3973d9c8264cbcfb757ddac8120d1b  sunxi-tools-1.4.1.tar.gz
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index ee590fb95c..35254263cf 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = v1.4.1
-SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
+SUNXI_TOOLS_VERSION = 1.4.1
+SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,v$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPL-2.0+
 SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
diff --git a/package/synergy/synergy.hash b/package/synergy/synergy.hash
index 664855fa33..8a053cf941 100644
--- a/package/synergy/synergy.hash
+++ b/package/synergy/synergy.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 06d1cb1d43251b0b624212652e9c0ab2657d124ac4f7e7d0c7f3e448c953c2a8  synergy-v2.0.12-beta.tar.gz
+sha256 06d1cb1d43251b0b624212652e9c0ab2657d124ac4f7e7d0c7f3e448c953c2a8  synergy-2.0.12-beta.tar.gz
 sha256 4921009cd76e7d38a8e873c362b25dbaf032c320bbb36a40dec775ddbdcbe1d8  LICENSE
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 46c4fbb1ef..63c6e5cbc1 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SYNERGY_VERSION = v2.0.12-beta
-SYNERGY_SITE = $(call github,symless,synergy-core,$(SYNERGY_VERSION))
+SYNERGY_VERSION = 2.0.12-beta
+SYNERGY_SITE = $(call github,symless,synergy-core,v$(SYNERGY_VERSION))
 SYNERGY_LICENSE = GPL-2.0
 SYNERGY_LICENSE_FILES = LICENSE
 SYNERGY_DEPENDENCIES = xlib_libX11 xlib_libXtst
diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
index 50cb3e3f62..339e848499 100644
--- a/package/targetcli-fb/targetcli-fb.hash
+++ b/package/targetcli-fb/targetcli-fb.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  0f32ab6f3ecd234280d55be5e89ce2b3a02f9c82c8dccaae66e26464cff8901a  targetcli-fb-v2.1.fb41.tar.gz
+sha256  0f32ab6f3ecd234280d55be5e89ce2b3a02f9c82c8dccaae66e26464cff8901a  targetcli-fb-2.1.fb41.tar.gz
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 4057592564..75643446d2 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -6,8 +6,8 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and python-configshell-fb at the same time.
-TARGETCLI_FB_VERSION = v2.1.fb41
-TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,$(TARGETCLI_FB_VERSION))
+TARGETCLI_FB_VERSION = 2.1.fb41
+TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_SETUP_TYPE = setuptools
diff --git a/package/tegrarcm/tegrarcm.hash b/package/tegrarcm/tegrarcm.hash
index 3849f0f6c7..38ff28093d 100644
--- a/package/tegrarcm/tegrarcm.hash
+++ b/package/tegrarcm/tegrarcm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  08329ee0247499b28ec37b0cc639f35443792dfb9bc4a8a182eea63dae6f64ea  tegrarcm-v1.8.tar.gz
+sha256  08329ee0247499b28ec37b0cc639f35443792dfb9bc4a8a182eea63dae6f64ea  tegrarcm-1.8.tar.gz
 sha256  5f20d276321cb37346d911712a813cb7ce4c8e3a570bffc919bec820eeef13f6  LICENSE
diff --git a/package/tegrarcm/tegrarcm.mk b/package/tegrarcm/tegrarcm.mk
index c84cf7f644..3ec5ea9425 100644
--- a/package/tegrarcm/tegrarcm.mk
+++ b/package/tegrarcm/tegrarcm.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TEGRARCM_VERSION = v1.8
-TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,$(TEGRARCM_VERSION))
+TEGRARCM_VERSION = 1.8
+TEGRARCM_SITE = $(call github,NVIDIA,tegrarcm,v$(TEGRARCM_VERSION))
 TEGRARCM_LICENSE = BSD-3-Clause / NVIDIA Software License (src/miniloader)
 TEGRARCM_LICENSE_FILES = LICENSE
 TEGRARCM_AUTORECONF = YES
diff --git a/package/tini/tini.hash b/package/tini/tini.hash
index 34f919f068..7c548183b6 100644
--- a/package/tini/tini.hash
+++ b/package/tini/tini.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256	e5f46bca81266bdd511cf08018d66866870531794569c04f9b45f50dd23c28b0	LICENSE
-sha256	1097675352d6317b547e73f9dc7c6839fd0bb0d96dafc2e5c95506bb324049a2  tini-v0.18.0.tar.gz
+sha256	1097675352d6317b547e73f9dc7c6839fd0bb0d96dafc2e5c95506bb324049a2  tini-0.18.0.tar.gz
diff --git a/package/tini/tini.mk b/package/tini/tini.mk
index 132bfc99dd..5dd98777f9 100644
--- a/package/tini/tini.mk
+++ b/package/tini/tini.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TINI_VERSION = v0.18.0
-TINI_SITE = $(call github,krallin,tini,$(TINI_VERSION))
+TINI_VERSION = 0.18.0
+TINI_SITE = $(call github,krallin,tini,v$(TINI_VERSION))
 TINI_LICENSE = MIT
 TINI_LICENSE_FILES = LICENSE
 
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 6a7282dcba..007eac6490 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	dfa2a4550eb145a5f62ffff39e36accf2704987922c194e8e845124175c00441	tinycbor-v0.5.2.tar.gz
+sha256	dfa2a4550eb145a5f62ffff39e36accf2704987922c194e8e845124175c00441	tinycbor-0.5.2.tar.gz
 sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 40a828d545..9506e0d89c 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = v0.5.2
-TINYCBOR_SITE = $(call github,intel,tinycbor,$(TINYCBOR_VERSION))
+TINYCBOR_VERSION = 0.5.2
+TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
 
diff --git a/package/tinymembench/tinymembench.hash b/package/tinymembench/tinymembench.hash
index 59ca70dcb2..c0b767e939 100644
--- a/package/tinymembench/tinymembench.hash
+++ b/package/tinymembench/tinymembench.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e37a2682065b2778f2fa7f22bd59472f5ca2191be48503952ae020b8f023f23d  tinymembench-v0.4.tar.gz
+sha256 e37a2682065b2778f2fa7f22bd59472f5ca2191be48503952ae020b8f023f23d  tinymembench-0.4.tar.gz
 sha256 8ba473aced4630aee2808efe17b53e904a9d68a9b3361de491717f9a4e75da39  LICENSE
diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
index b2ccc749fe..016d680ce7 100644
--- a/package/tinymembench/tinymembench.mk
+++ b/package/tinymembench/tinymembench.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TINYMEMBENCH_VERSION = v0.4
-TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,$(TINYMEMBENCH_VERSION))
+TINYMEMBENCH_VERSION = 0.4
+TINYMEMBENCH_SITE = $(call github,ssvb,tinymembench,v$(TINYMEMBENCH_VERSION))
 TINYMEMBENCH_LICENSE = MIT
 TINYMEMBENCH_LICENSE_FILES = LICENSE
 
diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index c2a6044498..164bb6139b 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a2c30534706fb475545b17a017c63479e93e5e9bf1f5ed88c0db22bb4ea7b4b1 turbolua-v2.1.2.tar.gz
+sha256 a2c30534706fb475545b17a017c63479e93e5e9bf1f5ed88c0db22bb4ea7b4b1 turbolua-2.1.2.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index 49a5559eff..58d66c5070 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = v2.1.2
-TURBOLUA_SITE = $(call github,kernelsauce,turbo,$(TURBOLUA_VERSION))
+TURBOLUA_VERSION = 2.1.2
+TURBOLUA_SITE = $(call github,kernelsauce,turbo,v$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
 TURBOLUA_LICENSE_FILES = LICENSE
diff --git a/package/uccp420wlan/uccp420wlan.hash b/package/uccp420wlan/uccp420wlan.hash
index 41f60a4675..90f4948ac9 100644
--- a/package/uccp420wlan/uccp420wlan.hash
+++ b/package/uccp420wlan/uccp420wlan.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 1d4de62fc842dbab739708cf0d9ebce270fcdf63c1c13ac676cbc253acdaa3bb uccp420wlan-v6.9.1.tar.gz
+sha256 1d4de62fc842dbab739708cf0d9ebce270fcdf63c1c13ac676cbc253acdaa3bb uccp420wlan-6.9.1.tar.gz
diff --git a/package/uccp420wlan/uccp420wlan.mk b/package/uccp420wlan/uccp420wlan.mk
index bd89e0700f..7256b92774 100644
--- a/package/uccp420wlan/uccp420wlan.mk
+++ b/package/uccp420wlan/uccp420wlan.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UCCP420WLAN_VERSION = v6.9.1
-UCCP420WLAN_SITE = $(call github,CreatorDev,uccp420wlan,$(UCCP420WLAN_VERSION))
+UCCP420WLAN_VERSION = 6.9.1
+UCCP420WLAN_SITE = $(call github,CreatorDev,uccp420wlan,v$(UCCP420WLAN_VERSION))
 UCCP420WLAN_LICENSE = GPL-2.0 (kernel module), proprietary (firmware blob)
 UCCP420WLAN_LICENSE_FILES = COPYING firmware/LICENSE.imagination
 
diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index 3724f3fbf9..613414af46 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e uhubctl-v2.0.0.tar.gz
+sha256 4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e uhubctl-2.0.0.tar.gz
 sha256 3260a6cd23e2677be1fa0815785cd5fa499d363a033f58cc299e12220662d486 LICENSE
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index 3d2adb347e..a4f3160e6c 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = v2.0.0
-UHUBCTL_SITE = $(call github,mvp,uhubctl,$(UHUBCTL_VERSION))
+UHUBCTL_VERSION = 2.0.0
+UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE
 UHUBCTL_DEPENDENCIES = libusb
diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index 0598be486f..fa1a165c11 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	6d2c27a69d982bf39d7330b92f084fd0388beef486879320ccf263e4716cd549  v4l2loopback-v0.12.2.tar.gz
+sha256	6d2c27a69d982bf39d7330b92f084fd0388beef486879320ccf263e4716cd549  v4l2loopback-0.12.2.tar.gz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index 15c1ed6100..5c9158bc92 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = v0.12.2
-V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,$(V4L2LOOPBACK_VERSION))
+V4L2LOOPBACK_VERSION = 0.12.2
+V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
 
diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index ffa1281797..cd34ecb8c9 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,2 +1,2 @@
 # Locally Computed:
-sha256  d22c1f8fe27d43e5a27aad1d3cbe9f1318ec28ccfa913e615663ed2bd6a5d063  valijson-v0.1.tar.gz
+sha256  d22c1f8fe27d43e5a27aad1d3cbe9f1318ec28ccfa913e615663ed2bd6a5d063  valijson-0.1.tar.gz
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index e1b816ddd7..a804334732 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = v0.1
-VALIJSON_SITE = $(call github,tristanpenman,valijson,$(VALIJSON_VERSION))
+VALIJSON_VERSION = 0.1
+VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
 VALIJSON_INSTALL_STAGING = YES
diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
index 595b1dc8cb..21c62fae1d 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d5989461541a91fe4de4ca9c396d4e7b2f4a8663fc9d6155d0830d2b143fce4d  vdr-plugin-vnsiserver-v1.8.0.tar.gz
+sha256 d5989461541a91fe4de4ca9c396d4e7b2f4a8663fc9d6155d0830d2b143fce4d  vdr-plugin-vnsiserver-1.8.0.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
index 20644d3f6b..eeab0c879b 100644
--- a/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
+++ b/package/vdr-plugin-vnsiserver/vdr-plugin-vnsiserver.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VDR_PLUGIN_VNSISERVER_VERSION = v1.8.0
-VDR_PLUGIN_VNSISERVER_SITE = $(call github,FernetMenta,vdr-plugin-vnsiserver,$(VDR_PLUGIN_VNSISERVER_VERSION))
+VDR_PLUGIN_VNSISERVER_VERSION = 1.8.0
+VDR_PLUGIN_VNSISERVER_SITE = $(call github,FernetMenta,vdr-plugin-vnsiserver,v$(VDR_PLUGIN_VNSISERVER_VERSION))
 VDR_PLUGIN_VNSISERVER_LICENSE = GPL-2.0+
 VDR_PLUGIN_VNSISERVER_LICENSE_FILES = COPYING
 VDR_PLUGIN_VNSISERVER_DEPENDENCIES = vdr
diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index bfbd55d1a5..9ec3dd0589 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a6dab137949097fbe0b67aafedf4c24a3b0d9c41716db35f5beb4834924d7b00  vim-v8.1.0133.tar.gz
+sha256 a6dab137949097fbe0b67aafedf4c24a3b0d9c41716db35f5beb4834924d7b00  vim-8.1.0133.tar.gz
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index c19d835632..5a5408ff6b 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VIM_VERSION = v8.1.0133
-VIM_SITE = $(call github,vim,vim,$(VIM_VERSION))
+VIM_VERSION = 8.1.0133
+VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
 VIM_CONF_ENV = \
diff --git a/package/vmtouch/vmtouch.hash b/package/vmtouch/vmtouch.hash
index 2b98891d1c..451bf56868 100644
--- a/package/vmtouch/vmtouch.hash
+++ b/package/vmtouch/vmtouch.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 d57b7b3ae1146c4516429ab7d6db6f2122401db814ddd9cdaad10980e9c8428c  vmtouch-v1.3.1.tar.gz
+sha256 d57b7b3ae1146c4516429ab7d6db6f2122401db814ddd9cdaad10980e9c8428c  vmtouch-1.3.1.tar.gz
 
 # Hash for license files:
 sha256 13258709ed29c17394e0a3ba8c8b9360af35b85231db514f11a0ba385cecd08e  LICENSE
diff --git a/package/vmtouch/vmtouch.mk b/package/vmtouch/vmtouch.mk
index 856835acd4..0aa7bfb442 100644
--- a/package/vmtouch/vmtouch.mk
+++ b/package/vmtouch/vmtouch.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-VMTOUCH_VERSION = v1.3.1
-VMTOUCH_SITE = $(call github,hoytech,vmtouch,$(VMTOUCH_VERSION))
+VMTOUCH_VERSION = 1.3.1
+VMTOUCH_SITE = $(call github,hoytech,vmtouch,v$(VMTOUCH_VERSION))
 VMTOUCH_LICENSE = BSD-3-Clause
 VMTOUCH_LICENSE_FILES = LICENSE
 
diff --git a/package/waffle/waffle.hash b/package/waffle/waffle.hash
index 5dfb976f2f..f496927e32 100644
--- a/package/waffle/waffle.hash
+++ b/package/waffle/waffle.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 d662f6743f688dc5ea4b7d29f558eb54bd8f57350080f04a006693d22e5d1d5b  waffle-v1.5.2.tar.gz
+sha256 d662f6743f688dc5ea4b7d29f558eb54bd8f57350080f04a006693d22e5d1d5b  waffle-1.5.2.tar.gz
 sha256 630844d1911c8a1b7b888a1de9097c4860b7e381362fd5aa64141d58ab7ecc9b  LICENSE.txt
diff --git a/package/waffle/waffle.mk b/package/waffle/waffle.mk
index c6dd0d5451..280e295cb3 100644
--- a/package/waffle/waffle.mk
+++ b/package/waffle/waffle.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WAFFLE_VERSION = v1.5.2
-WAFFLE_SITE = $(call github,waffle-gl,waffle,$(WAFFLE_VERSION))
+WAFFLE_VERSION = 1.5.2
+WAFFLE_SITE = $(call github,waffle-gl,waffle,v$(WAFFLE_VERSION))
 WAFFLE_INSTALL_STAGING = YES
 WAFFLE_LICENSE = BSD-2-Clause
 WAFFLE_LICENSE_FILES = LICENSE.txt
diff --git a/package/wampcc/wampcc.hash b/package/wampcc/wampcc.hash
index 162dcab0ec..0e47ea6992 100644
--- a/package/wampcc/wampcc.hash
+++ b/package/wampcc/wampcc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b3c3633b4c6a74d7ac8a676a7ea30fbfde7ae19aa1fc37de3b8aa3a553b674a2  wampcc-v1.6.tar.gz
+sha256  b3c3633b4c6a74d7ac8a676a7ea30fbfde7ae19aa1fc37de3b8aa3a553b674a2  wampcc-1.6.tar.gz
 sha256  bd185b1ec8a292d42b42346757ff6e198073e13c1e080e9ea548d34dd42d30d8  LICENSE
diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
index dcd65f49d5..5e7ee03651 100644
--- a/package/wampcc/wampcc.mk
+++ b/package/wampcc/wampcc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WAMPCC_VERSION = v1.6
-WAMPCC_SITE = $(call github,darrenjs,wampcc,$(WAMPCC_VERSION))
+WAMPCC_VERSION = 1.6
+WAMPCC_SITE = $(call github,darrenjs,wampcc,v$(WAMPCC_VERSION))
 WAMPCC_DEPENDENCIES = host-pkgconf libuv jansson openssl
 WAMPCC_INSTALL_STAGING = YES
 WAMPCC_LICENSE = MIT
diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 798e2973ce..6509376784 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5823ef9459d6147a457b390b6744a77465584e93d37c2809fa7a0be557070166  wavemon-v0.9.0.tar.gz
+sha256  5823ef9459d6147a457b390b6744a77465584e93d37c2809fa7a0be557070166  wavemon-0.9.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 864e0709d1..9f5fce55b1 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = v0.9.0
-WAVEMON_SITE = $(call github,uoaerg,wavemon,$(WAVEMON_VERSION))
+WAVEMON_VERSION = 0.9.0
+WAVEMON_SITE = $(call github,uoaerg,wavemon,v$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
 WAVEMON_LICENSE_FILES = COPYING
 WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
diff --git a/package/xdotool/xdotool.hash b/package/xdotool/xdotool.hash
index f8adcd5953..5f32ca5f39 100644
--- a/package/xdotool/xdotool.hash
+++ b/package/xdotool/xdotool.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 b097ef0e3897d1a24e3f45f0faed58329742d3d9434b9b46eb97eb1040f999bf  xdotool-v3.20150503.1.tar.gz
+sha256 b097ef0e3897d1a24e3f45f0faed58329742d3d9434b9b46eb97eb1040f999bf  xdotool-3.20150503.1.tar.gz
diff --git a/package/xdotool/xdotool.mk b/package/xdotool/xdotool.mk
index c18885c500..93d7d64a45 100644
--- a/package/xdotool/xdotool.mk
+++ b/package/xdotool/xdotool.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XDOTOOL_VERSION = v3.20150503.1
-XDOTOOL_SITE = $(call github,jordansissel,xdotool,$(XDOTOOL_VERSION))
+XDOTOOL_VERSION = 3.20150503.1
+XDOTOOL_SITE = $(call github,jordansissel,xdotool,v$(XDOTOOL_VERSION))
 XDOTOOL_LICENSE = BSD-3-Clause
 XDOTOOL_LICENSE_FILES = COPYRIGHT
 XDOTOOL_DEPENDENCIES = xlib_libXtst xlib_libXinerama libxkbcommon xlib_libX11
diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 22955b0f78..8fa607f00e 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ff5a0806fecc58c7b9cbc625117a4521c0546522a5f5951ffb6eebdab998610f  xl2tp-v1.3.14.tar.gz
+sha256  ff5a0806fecc58c7b9cbc625117a4521c0546522a5f5951ffb6eebdab998610f  xl2tp-1.3.14.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index a75b2abda8..6d40779a06 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XL2TP_VERSION = v1.3.14
-XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
+XL2TP_VERSION = 1.3.14
+XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
 XL2TP_LICENSE_FILES = LICENSE
diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 8a00a427f8..7e068bd145 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  19030315f4fc1b4b2cdb9d7a317069a109f90e39d1fe4c9159b7aaa39030eb95  xxhash-v0.6.5.tar.gz
+sha256  19030315f4fc1b4b2cdb9d7a317069a109f90e39d1fe4c9159b7aaa39030eb95  xxhash-0.6.5.tar.gz
 sha256  86ec6953794503942b70fcd4f35b565d44f63f703b7037ce44dad965c4aaae91  LICENSE
 sha256  8e449f232e2cd984e1d286711653960b4a9a555d90b4dc05fe4f0d7a1838fe1b  xxhsum.c
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 9bb259a280..f9e207a1a6 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XXHASH_VERSION = v0.6.5
-XXHASH_SITE = $(call github,Cyan4973,xxHash,$(XXHASH_VERSION))
+XXHASH_VERSION = 0.6.5
+XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause, GPL-2.0+
 XXHASH_LICENSE_FILES = LICENSE xxhsum.c
 
diff --git a/package/ympd/ympd.hash b/package/ympd/ympd.hash
index 6d45d63862..1157267c9a 100644
--- a/package/ympd/ympd.hash
+++ b/package/ympd/ympd.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d9f68920cd93d1cfa971e1d7b9162a2b1724909bc9753c1338cecb3688d234d5  ympd-v1.3.0.tar.gz
+sha256  d9f68920cd93d1cfa971e1d7b9162a2b1724909bc9753c1338cecb3688d234d5  ympd-1.3.0.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE
diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index 6c0f3224cc..027dc1ca08 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-YMPD_VERSION = v1.3.0
-YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
+YMPD_VERSION = 1.3.0
+YMPD_SITE = $(call github,notandy,ympd,v$(YMPD_VERSION))
 YMPD_LICENSE = GPL-2.0
 YMPD_LICENSE_FILES = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 95b2270981..75780d5132 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 d6e1559e4cdb7c4226767d4ddc990bff5f9aab77085ff0d0490c828b025e2eea zstd-v1.3.5.tar.gz
+sha256 d6e1559e4cdb7c4226767d4ddc990bff5f9aab77085ff0d0490c828b025e2eea zstd-1.3.5.tar.gz
 
 # License files (locally computed as well)
 sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a1a11f9ab2..9e79990dec 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZSTD_VERSION = v1.3.5
-ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
+ZSTD_VERSION = 1.3.5
+ZSTD_SITE = $(call github,facebook,zstd,v$(ZSTD_VERSION))
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
diff --git a/package/zyre/zyre.hash b/package/zyre/zyre.hash
index 8cc860232a..7c934cbe14 100644
--- a/package/zyre/zyre.hash
+++ b/package/zyre/zyre.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b978a999947ddb6722d956db2427869b313225e50518c4fbbf960a68109e3e91 zyre-v2.0.0.tar.gz
+sha256 b978a999947ddb6722d956db2427869b313225e50518c4fbbf960a68109e3e91 zyre-2.0.0.tar.gz
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 82a0f517ce..21224d6bb4 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZYRE_VERSION = v2.0.0
-ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
+ZYRE_VERSION = 2.0.0
+ZYRE_SITE = $(call github,zeromq,zyre,v$(ZYRE_VERSION))
 ZYRE_LICENSE = MPL-2.0
 ZYRE_LICENSE_FILES = LICENSE
 ZYRE_INSTALL_STAGING = YES
-- 
2.21.0
