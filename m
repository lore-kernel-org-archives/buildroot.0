From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:59:40 +0200
Subject: [Buildroot] [PATCH 2/2] python-engineio: drop asyncio files for
 python 2.x to fix pycompile issue
In-Reply-To: <20201004214903.32309-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 4 Oct 2020 23:49:02 +0200")
References: <20201004214903.32309-1-peter@korsgaard.com>
 <20201004214903.32309-2-peter@korsgaard.com>
Message-ID: <87362ler0j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/72c/72cfdffeb4d0fb7c3032b52f0a26a4758eea6762/

 > engineio has conditional logic to load asyncio files when running under
 > Python 3.x:

 > if sys.version_info >= (3, 5):  # pragma: no cover
 >     from .asyncio_server import AsyncServer
 >     from .asyncio_client import AsyncClient
 >     from .async_drivers.asgi import ASGIApp
 >     try:
 >         from .async_drivers.tornado import get_tornado_handler
 >     except ImportError:
 >         get_tornado_handler = None
 > else:  # pragma: no cover
 >     AsyncServer = None
 >     AsyncClient = None
 >     get_tornado_handler = None
 >     ASGIApp = None

 > pycompile unfortunately errors out on these files when running under Python
 > 2.x:

 > ../scripts/pycompile.py ..
 > error:   File "/usr/lib/python2.7/site-packages/engineio/asyncio_socket.py", line 13
 >     async def poll(self):
 >             ^
 > SyntaxError: invalid syntax

 > As a workaround, simply drop the unusable file from TARGET_DIR if building
 > for python 2.x.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
