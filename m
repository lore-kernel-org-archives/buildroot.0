From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 13 Nov 2013 14:15:15 +0100
Subject: [Buildroot] [PATCH v2] infra: introduce github helper function
In-Reply-To: <1384345469-8967-1-git-send-email-mjonker@synopsys.com>
References: <1384345469-8967-1-git-send-email-mjonker@synopsys.com>
Message-ID: <CAAXf6LXddF50q9C=PyTVoOSY1x0wC2=RXxd+n6E5MpakxHonYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mischa,

On Wed, Nov 13, 2013 at 1:24 PM, Mischa Jonker
<Mischa.Jonker@synopsys.com> wrote:
> In order to make it easier to cope with changes in github download-URL's,
> this patch introduces the github helper function. It generates the site
> URL of a github repository. It's usage is $(call github,user,pkg,version).
>
> Cc: Arnout Vandecapelle <arnout@mind.be>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
> ---
> v2:
>   fixed input-event-daemon
>
>  docs/manual/adding-packages-tips.txt             |    5 +++--
>  package/a10disp/a10disp.mk                       |    2 +-
>  package/civetweb/civetweb.mk                     |    2 +-
>  package/cpuload/cpuload.mk                       |    2 +-
>  package/fb-test-app/fb-test-app.mk               |    2 +-
>  package/input-event-daemon/input-event-daemon.mk |    2 +-
>  package/jq/jq.mk                                 |    2 +-
>  package/jsmin/jsmin.mk                           |    2 +-
>  package/knock/knock.mk                           |    2 +-
>  package/libcec/libcec.mk                         |    2 +-
>  package/libcofi/libcofi.mk                       |    2 +-
>  package/libiqrf/libiqrf.mk                       |    2 +-
>  package/liblog4c-localtime/liblog4c-localtime.mk |    2 +-
>  package/libsha1/libsha1.mk                       |    2 +-
>  package/libsoc/libsoc.mk                         |    2 +-
>  package/libtpl/libtpl.mk                         |    2 +-
>  package/linenoise/linenoise.mk                   |    2 +-
>  package/lua-ev/lua-ev.mk                         |    2 +-
>  package/luacrypto/luacrypto.mk                   |    2 +-
>  package/luaexpatutils/luaexpatutils.mk           |    2 +-
>  package/luasql/luasql.mk                         |    2 +-
>  package/mongrel2/mongrel2.mk                     |    2 +-
>  package/mtdev2tuio/mtdev2tuio.mk                 |    2 +-
>  package/neardal/neardal.mk                       |    2 +-
>  package/omap-u-boot-utils/omap-u-boot-utils.mk   |    2 +-
>  package/on2-8170-modules/on2-8170-modules.mk     |    2 +-
>  package/pkg-utils.mk                             |    3 +++
>  package/python-ipy/python-ipy.mk                 |    2 +-
>  package/qjson/qjson.mk                           |    2 +-
>  package/rpi-firmware/rpi-firmware.mk             |    2 +-
>  package/rpi-userland/rpi-userland.mk             |    2 +-
>  package/socketcand/socketcand.mk                 |    2 +-
>  package/sqlcipher/sqlcipher.mk                   |    2 +-
>  package/sunxi-boards/sunxi-boards.mk             |    2 +-
>  package/sunxi-cedarx/sunxi-cedarx.mk             |    2 +-
>  package/sunxi-mali-prop/sunxi-mali-prop.mk       |    2 +-
>  package/sunxi-mali/sunxi-mali.mk                 |    2 +-
>  package/sunxi-tools/sunxi-tools.mk               |    2 +-
>  package/tinymembench/tinymembench.mk             |    2 +-
>  package/tslib/tslib.mk                           |    2 +-
>  package/xl2tp/xl2tp.mk                           |    2 +-
>  package/yajl/yajl.mk                             |    2 +-
>  42 files changed, 46 insertions(+), 42 deletions(-)
>

As Arnout mentioned in his comments on the first version,
adding-packages-generic.txt also give a wrong example of github
integration. I think that should be fixed too, probably adding a
reference to the github section for more details.

Also: are you planning a follow-up patch fixing the packages that are
currently using git://github.com ?

Regarding the defconfigs: Arnout suggested adding the $(call github)
there as well. However, I'm not very fond of that: if you run 'make
savedefconfig' later it will not be preserved.

Best regards,
Thomas
