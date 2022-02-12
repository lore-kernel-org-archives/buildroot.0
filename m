Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D951FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9741683E43;
	Sat, 12 Feb 2022 13:52:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMdpia4vTw2t; Sat, 12 Feb 2022 13:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60FCB83E63;
	Sat, 12 Feb 2022 13:52:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E76791BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D61D083E12
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hc5Ajth59DLM for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:51:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEB6F8301F
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:51:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C3E4E825CB; Sat, 12 Feb 2022 13:44:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 14:51:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1081382fcdd09fcd9421d6cbdfd5b1a05e9454b
X-Git-Newrev: a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d
X-Patchwork-Hint: ignore
Message-Id: <20220212134420.C3E4E825CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-*: drop python3 dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All the python packages are inside an if BR2_PACKAGE_PYTHON3, so with the
removal of python2 support, the explicit python3 dependency is redundant.
Remove it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aexpect/Config.in                | 1 -
 package/python-aioblescan/Config.in             | 1 -
 package/python-aiocoap/Config.in                | 1 -
 package/python-aioconsole/Config.in             | 1 -
 package/python-aiodns/Config.in                 | 1 -
 package/python-aiofiles/Config.in               | 1 -
 package/python-aiohttp-cors/Config.in           | 1 -
 package/python-aiohttp-debugtoolbar/Config.in   | 1 -
 package/python-aiohttp-jinja2/Config.in         | 1 -
 package/python-aiohttp-mako/Config.in           | 1 -
 package/python-aiohttp-remotes/Config.in        | 1 -
 package/python-aiohttp-security/Config.in       | 1 -
 package/python-aiohttp-session/Config.in        | 1 -
 package/python-aiohttp-sse/Config.in            | 1 -
 package/python-aiohttp/Config.in                | 1 -
 package/python-aiojobs/Config.in                | 1 -
 package/python-aiologstash/Config.in            | 1 -
 package/python-aiomonitor/Config.in             | 1 -
 package/python-aioprocessing/Config.in          | 1 -
 package/python-aioredis/Config.in               | 1 -
 package/python-aiorwlock/Config.in              | 1 -
 package/python-aiosignal/Config.in              | 1 -
 package/python-aiozipkin/Config.in              | 1 -
 package/python-argon2-cffi-bindings/Config.in   | 1 -
 package/python-arrow/Config.in                  | 1 -
 package/python-asgiref/Config.in                | 1 -
 package/python-async-lru/Config.in              | 1 -
 package/python-async-timeout/Config.in          | 1 -
 package/python-attrs/Config.in                  | 1 -
 package/python-autobahn/Config.in               | 1 -
 package/python-automat/Config.in                | 1 -
 package/python-avro/Config.in                   | 1 -
 package/python-bcrypt/Config.in                 | 1 -
 package/python-beautifulsoup4/Config.in         | 1 -
 package/python-bidict/Config.in                 | 1 -
 package/python-bleak/Config.in                  | 1 -
 package/python-bluezero/Config.in               | 2 --
 package/python-boto3/Config.in                  | 1 -
 package/python-botocore/Config.in               | 1 -
 package/python-cbor2/Config.in                  | 1 -
 package/python-cchardet/Config.in               | 2 --
 package/python-channels-redis/Config.in         | 1 -
 package/python-channels/Config.in               | 1 -
 package/python-charset-normalizer/Config.in     | 1 -
 package/python-cheroot/Config.in                | 1 -
 package/python-cherrypy/Config.in               | 1 -
 package/python-colorlog/Config.in               | 1 -
 package/python-colorzero/Config.in              | 1 -
 package/python-configshell-fb/Config.in         | 1 -
 package/python-crayons/Config.in                | 1 -
 package/python-crontab/Config.in                | 1 -
 package/python-crossbar/Config.in               | 1 -
 package/python-cryptography/Config.in           | 1 -
 package/python-cssselect2/Config.in             | 1 -
 package/python-cssutils/Config.in               | 1 -
 package/python-cycler/Config.in                 | 1 -
 package/python-daphne/Config.in                 | 1 -
 package/python-dataproperty/Config.in           | 1 -
 package/python-dateutil/Config.in               | 1 -
 package/python-dbus-next/Config.in              | 1 -
 package/python-decorator/Config.in              | 1 -
 package/python-dialog3/Config.in                | 1 -
 package/python-django-enumfields/Config.in      | 1 -
 package/python-django/Config.in                 | 1 -
 package/python-dnspython/Config.in              | 1 -
 package/python-docker/Config.in                 | 1 -
 package/python-engineio/Config.in               | 1 -
 package/python-falcon/Config.in                 | 1 -
 package/python-filelock/Config.in               | 1 -
 package/python-flask-babel/Config.in            | 1 -
 package/python-flask-cors/Config.in             | 1 -
 package/python-flask-expects-json/Config.in     | 1 -
 package/python-flask-jsonrpc/Config.in          | 1 -
 package/python-flask-login/Config.in            | 1 -
 package/python-flask-sqlalchemy/Config.in       | 1 -
 package/python-flask-wtf/Config.in              | 1 -
 package/python-flup/Config.in                   | 1 -
 package/python-fonttools/Config.in              | 1 -
 package/python-frozenlist/Config.in             | 1 -
 package/python-git/Config.in                    | 1 -
 package/python-gitdb2/Config.in                 | 1 -
 package/python-gobject/Config.in                | 1 -
 package/python-gpiozero/Config.in               | 1 -
 package/python-gunicorn/Config.in               | 1 -
 package/python-h2/Config.in                     | 1 -
 package/python-hiredis/Config.in                | 1 -
 package/python-hpack/Config.in                  | 1 -
 package/python-httplib2/Config.in               | 1 -
 package/python-humanize/Config.in               | 1 -
 package/python-hyperframe/Config.in             | 1 -
 package/python-hyperlink/Config.in              | 1 -
 package/python-ibmiotf/Config.in                | 1 -
 package/python-idna/Config.in                   | 1 -
 package/python-inflection/Config.in             | 1 -
 package/python-influxdb/Config.in               | 1 -
 package/python-ipdb/Config.in                   | 1 -
 package/python-ipython/Config.in                | 1 -
 package/python-itsdangerous/Config.in           | 1 -
 package/python-janus/Config.in                  | 1 -
 package/python-jaraco-classes/Config.in         | 1 -
 package/python-jaraco-functools/Config.in       | 1 -
 package/python-jedi/Config.in                   | 1 -
 package/python-jinja2/Config.in                 | 1 -
 package/python-jsonmodels/Config.in             | 1 -
 package/python-keyring/Config.in                | 1 -
 package/python-libusb1/Config.in                | 2 --
 package/python-markdown/Config.in               | 1 -
 package/python-markdown2/Config.in              | 1 -
 package/python-markupsafe/Config.in             | 1 -
 package/python-matplotlib/Config.in             | 1 -
 package/python-mbstrdecoder/Config.in           | 1 -
 package/python-memory-profiler/Config.in        | 1 -
 package/python-more-itertools/Config.in         | 1 -
 package/python-mpd2/Config.in                   | 1 -
 package/python-msgfy/Config.in                  | 1 -
 package/python-multidict/Config.in              | 1 -
 package/python-mutagen/Config.in                | 1 -
 package/python-mwclient/Config.in               | 1 -
 package/python-mwscrape/Config.in               | 1 -
 package/python-mwscrape2slob/Config.in          | 2 --
 package/python-networkx/Config.in               | 1 -
 package/python-numpy/Config.in                  | 2 --
 package/python-oauthlib/Config.in               | 1 -
 package/python-opcua-asyncio/Config.in          | 1 -
 package/python-packaging/Config.in              | 1 -
 package/python-paramiko/Config.in               | 1 -
 package/python-parso/Config.in                  | 1 -
 package/python-pathpy/Config.in                 | 1 -
 package/python-pathvalidate/Config.in           | 1 -
 package/python-piexif/Config.in                 | 1 -
 package/python-pillow/Config.in                 | 1 -
 package/python-pip/Config.in                    | 1 -
 package/python-pluggy/Config.in                 | 1 -
 package/python-portend/Config.in                | 1 -
 package/python-priority/Config.in               | 1 -
 package/python-prompt-toolkit/Config.in         | 1 -
 package/python-protobuf/Config.in               | 1 -
 package/python-psycopg2/Config.in               | 2 --
 package/python-pudb/Config.in                   | 1 -
 package/python-py/Config.in                     | 1 -
 package/python-pybind/Config.in                 | 1 -
 package/python-pycairo/Config.in                | 1 -
 package/python-pycares/Config.in                | 1 -
 package/python-pycups/Config.in                 | 1 -
 package/python-pydantic/Config.in               | 1 -
 package/python-pydyf/Config.in                  | 1 -
 package/python-pygments/Config.in               | 1 -
 package/python-pyhamcrest/Config.in             | 1 -
 package/python-pyjwt/Config.in                  | 1 -
 package/python-pymupdf/Config.in                | 3 ---
 package/python-pymysql/Config.in                | 1 -
 package/python-pynacl/Config.in                 | 1 -
 package/python-pyndiff/Config.in                | 1 -
 package/python-pyopenssl/Config.in              | 1 -
 package/python-pyparsing/Config.in              | 1 -
 package/python-pyparted/Config.in               | 2 --
 package/python-pyphen/Config.in                 | 1 -
 package/python-pysftp/Config.in                 | 1 -
 package/python-pytablereader/Config.in          | 1 -
 package/python-pytablewriter/Config.in          | 1 -
 package/python-pytest-asyncio/Config.in         | 1 -
 package/python-pytest/Config.in                 | 1 -
 package/python-pytrie/Config.in                 | 1 -
 package/python-pyusb/Config.in                  | 1 -
 package/python-pyyaml/Config.in                 | 1 -
 package/python-requests-oauthlib/Config.in      | 1 -
 package/python-requests-toolbelt/Config.in      | 1 -
 package/python-requests/Config.in               | 1 -
 package/python-rsa/Config.in                    | 1 -
 package/python-s3transfer/Config.in             | 1 -
 package/python-schedule/Config.in               | 1 -
 package/python-secretstorage/Config.in          | 1 -
 package/python-serial-asyncio/Config.in         | 1 -
 package/python-service-identity/Config.in       | 1 -
 package/python-setproctitle/Config.in           | 1 -
 package/python-simpleaudio/Config.in            | 1 -
 package/python-simplelogging/Config.in          | 1 -
 package/python-simplesqlite/Config.in           | 1 -
 package/python-slob/Config.in                   | 2 --
 package/python-smmap2/Config.in                 | 1 -
 package/python-socketio/Config.in               | 1 -
 package/python-sockjs/Config.in                 | 1 -
 package/python-soupsieve/Config.in              | 1 -
 package/python-sqliteschema/Config.in           | 1 -
 package/python-tabledata/Config.in              | 1 -
 package/python-tempora/Config.in                | 1 -
 package/python-tinycss2/Config.in               | 1 -
 package/python-tinyrpc/Config.in                | 1 -
 package/python-tomako/Config.in                 | 1 -
 package/python-tomli/Config.in                  | 1 -
 package/python-tornado/Config.in                | 1 -
 package/python-traitlets/Config.in              | 1 -
 package/python-treq/Config.in                   | 1 -
 package/python-twisted/Config.in                | 1 -
 package/python-txaio/Config.in                  | 1 -
 package/python-txdbus/Config.in                 | 1 -
 package/python-txtorcon/Config.in               | 1 -
 package/python-typepy/Config.in                 | 1 -
 package/python-ujson/Config.in                  | 1 -
 package/python-unittest-xml-reporting/Config.in | 1 -
 package/python-urwid/Config.in                  | 1 -
 package/python-uvloop/Config.in                 | 1 -
 package/python-validators/Config.in             | 1 -
 package/python-watchdog/Config.in               | 1 -
 package/python-weasyprint/Config.in             | 1 -
 package/python-webpy/Config.in                  | 1 -
 package/python-websockets/Config.in             | 1 -
 package/python-wtforms/Config.in                | 1 -
 package/python-xlib/Config.in                   | 1 -
 package/python-xlsxwriter/Config.in             | 1 -
 package/python-yarl/Config.in                   | 1 -
 package/python-zeroconf/Config.in               | 1 -
 package/python-zopfli/Config.in                 | 1 -
 213 files changed, 223 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
