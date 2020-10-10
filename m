From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:59:34 +0200
Subject: [Buildroot] [PATCH 1/2] python-socketio: drop asgi/asyncio
 files for python 2.x to fix pycompile issue
In-Reply-To: <20201004214903.32309-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 4 Oct 2020 23:49:01 +0200")
References: <20201004214903.32309-1-peter@korsgaard.com>
Message-ID: <877drxer0p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/455f3e09a590f7a6724ab8cd1b86bdf2bba8071a/

 > socketio has conditional logic to load asgi/asyncio files when running under
 > Python 3.x:

 > if sys.version_info >= (3, 5):  # pragma: no cover
 >     from .asyncio_client import AsyncClient
 >     from .asyncio_server import AsyncServer
 >     from .asyncio_manager import AsyncManager
 >     from .asyncio_namespace import AsyncNamespace, AsyncClientNamespace
 >     from .asyncio_redis_manager import AsyncRedisManager
 >     from .asyncio_aiopika_manager import AsyncAioPikaManager
 >     from .asgi import ASGIApp
 > else:  # pragma: no cover
 >     AsyncClient = None
 >     AsyncServer = None
 >     AsyncManager = None
 >     AsyncNamespace = None
 >     AsyncRedisManager = None
 >     AsyncAioPikaManager = None

 > pycompile unfortunately errors out on these files when running under Python
 > 2.x:

 > ../scripts/pycompile.py ..
 > error:   File "/usr/lib/python2.7/site-packages/socketio/asyncio_server.py", line 84
 >     async def emit(self, event, data=None, to=None, room=None, skip_sid=None,
 >             ^
 > SyntaxError: invalid syntax

 > As a workaround, simply drop the unusable file from TARGET_DIR if building
 > for python 2.x.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
