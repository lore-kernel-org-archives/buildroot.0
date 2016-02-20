From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 20 Feb 2016 16:53:36 +0100
Subject: [Buildroot] [PATCH v5 19/20] python-autobahn: new package
In-Reply-To: <20160220150553.1da70aab@free-electrons.com>
References: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
 <1455188328-7595-2-git-send-email-mc5686@mclink.it>
 <20160220150553.1da70aab@free-electrons.com>
Message-ID: <CAGm1_ksj0CetgAFvrnRty5Tz+wRX77XxOZ_VFKvFn1na=D58Kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Feb 20, 2016 at 3:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Mauro,
>
> On Thu, 11 Feb 2016 11:58:47 +0100, Mauro Condarelli wrote:
>
>> diff --git a/package/python-autobahn/Config.in b/package/python-autobahn/Config.in
>> new file mode 100644
>> index 0000000..9f5da46
>> --- /dev/null
>> +++ b/package/python-autobahn/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_PYTHON_AUTOBAHN
>> +     bool "python-autobahn"
>> +     depends on !BR2_PACKAGE_PYTHON_PYC_ONLY
>
> I did a build with BR2_PACKAGE_PYTHON_PYC_ONLY=y, and tested at runtime
> "import autobahn", and it worked perfectly fine.
>
> So, I've removed this dependency, and applied your patch to the next
> branch. If you think the dependency is really needed, please send a
> follow-up patch on top of the next branch to re-add it, with a proper
> justification.

Try to compile autobahn with PYC only and twisted and
python-pynacl-1.0.1 enabled. I get:

>>> python-autobahn 0.12.1 Building
(cd /home/user/Documents/versioned/buildroot/testing/build/python-autobahn-0.12.1//;
PATH="/home/user/Documents/versioned/buildroot/testing/host/bin:/home/user/Documents/versioned/buildroot/testing/host/sbin:/home/user/Documents/versioned/buildroot/testing/host/usr/bin:/home/user/Documents/versioned/buildroot/testing/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
PYTHONPATH="/home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/sysconfigdata/:/home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/"
_python_sysroot=/home/user/Documents/versioned/buildroot/testing/host/usr/arm-buildroot-linux-gnueabi/sysroot
_python_prefix=/usr _python_exec_prefix=/usr
/home/user/Documents/versioned/buildroot/testing/host/usr/bin/python
setup.py build  )
running build
running build_py
creating build
creating build/lib
creating build/lib/autobahn
copying autobahn/__init__.py -> build/lib/autobahn
copying autobahn/util.py -> build/lib/autobahn
creating build/lib/autobahn/wamp
copying autobahn/wamp/__init__.py -> build/lib/autobahn/wamp
copying autobahn/wamp/keyring.py -> build/lib/autobahn/wamp
copying autobahn/wamp/component.py -> build/lib/autobahn/wamp
copying autobahn/wamp/message.py -> build/lib/autobahn/wamp
copying autobahn/wamp/websocket.py -> build/lib/autobahn/wamp
copying autobahn/wamp/serializer.py -> build/lib/autobahn/wamp
copying autobahn/wamp/auth.py -> build/lib/autobahn/wamp
copying autobahn/wamp/cryptosign.py -> build/lib/autobahn/wamp
copying autobahn/wamp/protocol.py -> build/lib/autobahn/wamp
copying autobahn/wamp/types.py -> build/lib/autobahn/wamp
copying autobahn/wamp/exception.py -> build/lib/autobahn/wamp
copying autobahn/wamp/role.py -> build/lib/autobahn/wamp
copying autobahn/wamp/uri.py -> build/lib/autobahn/wamp
copying autobahn/wamp/interfaces.py -> build/lib/autobahn/wamp
copying autobahn/wamp/request.py -> build/lib/autobahn/wamp
creating build/lib/autobahn/wamp/test
copying autobahn/wamp/test/__init__.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_auth.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_protocol.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_uri_pattern.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_component.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_message.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_runner.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_protocol_peer.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_websocket.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_serializer.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_exception.py -> build/lib/autobahn/wamp/test
copying autobahn/wamp/test/test_user_handler_errors.py ->
build/lib/autobahn/wamp/test
creating build/lib/autobahn/websocket
copying autobahn/websocket/__init__.py -> build/lib/autobahn/websocket
copying autobahn/websocket/utf8validator.py -> build/lib/autobahn/websocket
copying autobahn/websocket/compress_base.py -> build/lib/autobahn/websocket
copying autobahn/websocket/compress_bzip2.py -> build/lib/autobahn/websocket
copying autobahn/websocket/compress_deflate.py -> build/lib/autobahn/websocket
copying autobahn/websocket/compress.py -> build/lib/autobahn/websocket
copying autobahn/websocket/protocol.py -> build/lib/autobahn/websocket
copying autobahn/websocket/types.py -> build/lib/autobahn/websocket
copying autobahn/websocket/compress_snappy.py -> build/lib/autobahn/websocket
copying autobahn/websocket/interfaces.py -> build/lib/autobahn/websocket
copying autobahn/websocket/xormasker.py -> build/lib/autobahn/websocket
creating build/lib/autobahn/websocket/test
copying autobahn/websocket/test/__init__.py -> build/lib/autobahn/websocket/test
copying autobahn/websocket/test/test_protocol.py ->
build/lib/autobahn/websocket/test
copying autobahn/websocket/test/test_websocket_url.py ->
build/lib/autobahn/websocket/test
copying autobahn/websocket/test/test_websocket.py ->
build/lib/autobahn/websocket/test
creating build/lib/autobahn/asyncio
copying autobahn/asyncio/__init__.py -> build/lib/autobahn/asyncio
copying autobahn/asyncio/wamp.py -> build/lib/autobahn/asyncio
copying autobahn/asyncio/websocket.py -> build/lib/autobahn/asyncio
creating build/lib/autobahn/twisted
copying autobahn/twisted/__init__.py -> build/lib/autobahn/twisted
copying autobahn/twisted/forwarder.py -> build/lib/autobahn/twisted
copying autobahn/twisted/wamp.py -> build/lib/autobahn/twisted
copying autobahn/twisted/resource.py -> build/lib/autobahn/twisted
copying autobahn/twisted/component.py -> build/lib/autobahn/twisted
copying autobahn/twisted/websocket.py -> build/lib/autobahn/twisted
copying autobahn/twisted/choosereactor.py -> build/lib/autobahn/twisted
copying autobahn/twisted/util.py -> build/lib/autobahn/twisted
copying autobahn/twisted/rawsocket.py -> build/lib/autobahn/twisted
package init file 'twisted/plugins/__init__.py' not found (or not a
regular file)
creating build/lib/twisted
creating build/lib/twisted/plugins
copying twisted/plugins/autobahn_endpoints.py -> build/lib/twisted/plugins
copying twisted/plugins/autobahn_twistd.py -> build/lib/twisted/plugins
Twisted found (default reactor is <class
'twisted.internet.epollreactor.EPollReactor'>)
Unhandled Error
Traceback (most recent call last):
  File "setup.py", line 256, in <module>
    list(getPlugins(IPlugin))
  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/twisted/plugin.py",
line 213, in getPlugins

--- <exception caught here> ---
  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/twisted/plugin.py",
line 171, in getCache

  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/twisted/python/modules.py",
line 389, in load

  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/twisted/python/reflect.py",
line 303, in namedAny

  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/twisted/python/reflect.py",
line 250, in _importAndCheckStack

  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/twisted/python/compat.py",
line 380, in reraise

  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/twisted/plugins/autobahn_endpoints.py",
line 46, in <module>

  File "/home/user/Documents/versioned/buildroot/testing/build/python-autobahn-0.12.1/autobahn/twisted/__init__.py",
line 51, in <module>
    from autobahn.twisted.wamp import ApplicationSession
  File "/home/user/Documents/versioned/buildroot/testing/build/python-autobahn-0.12.1/autobahn/twisted/wamp.py",
line 35, in <module>
    from autobahn.wamp import protocol
  File "/home/user/Documents/versioned/buildroot/testing/build/python-autobahn-0.12.1/autobahn/wamp/protocol.py",
line 42, in <module>
    from autobahn.wamp.keyring import EncryptedPayload
  File "/home/user/Documents/versioned/buildroot/testing/build/python-autobahn-0.12.1/autobahn/wamp/keyring.py",
line 61, in <module>
    from nacl.public import PrivateKey, PublicKey, Box
  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/nacl/public.py",
line 18, in <module>

  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/nacl/bindings/__init__.py",
line 17, in <module>

  File "home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/nacl/bindings/crypto_box.py",
line 17, in <module>

builtins.ImportError:
/home/user/Documents/versioned/buildroot/testing/target/usr/lib/python3.4/site-packages/nacl/_sodium.cpython-34m.so:
wrong ELF class: ELFCLASS32

Yegor
