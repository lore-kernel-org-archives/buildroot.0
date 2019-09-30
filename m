From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 21:58:05 +0200
Subject: [Buildroot] [PATCH 04/08] package/python-daphne: new package
In-Reply-To: <20190930213347.6704553f@windsurf.home>
References: <20190804011631.86261-1-aduskett@gmail.com>
 <20190804011631.86261-5-aduskett@gmail.com>
 <20190930213347.6704553f@windsurf.home>
Message-ID: <20190930215805.35571564@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yegor in the loop.

On Mon, 30 Sep 2019 21:33:47 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Speaking of that, I think asgiref and autobahn also need Python 3.x.
> Indeed, when I try to build python-daphne with Python 2.x, I get this:
> 
> Compiling usr/lib/python2.7/site-packages/asgiref/compatibility.py ...
>   File "usr/lib/python2.7/site-packages/asgiref/compatibility.py", line 32
>     async def new_application(scope, receive, send):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/asgiref/server.py ...
>   File "usr/lib/python2.7/site-packages/asgiref/server.py", line 64
>     async def handle(self):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/asgiref/sync.py ...
>   File "usr/lib/python2.7/site-packages/asgiref/sync.py", line 134
>     async def main_wrap(self, args, kwargs, call_result, source_thread):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/asgiref/testing.py ...
>   File "usr/lib/python2.7/site-packages/asgiref/testing.py", line 24
>     async def wait(self, timeout=1):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/asgiref/timeout.py ...
>   File "usr/lib/python2.7/site-packages/asgiref/timeout.py", line 34
>     timeout: Optional[float],
>            ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/asgiref/wsgi.py ...
>   File "usr/lib/python2.7/site-packages/asgiref/wsgi.py", line 14
>     async def __call__(self, scope, receive, send):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/autobahn/xbr/_buyer.py ...
>   File "usr/lib/python2.7/site-packages/autobahn/xbr/_buyer.py", line 195
>     async def stop(self):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/autobahn/xbr/_interfaces.py ...
>   File "usr/lib/python2.7/site-packages/autobahn/xbr/_interfaces.py", line 141
>     async def start(self, session):
>         ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/autobahn/xbr/_seller.py ...
>   File "usr/lib/python2.7/site-packages/autobahn/xbr/_seller.py", line 447
>     async def balance(self):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/daphne/cli.py ...
>   File "usr/lib/python2.7/site-packages/daphne/cli.py", line 29
>     async def asgi(self, receive, send, scope):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/daphne/server.py ...
>   File "usr/lib/python2.7/site-packages/daphne/server.py", line 213
>     async def handle_reply(self, protocol, message):
>             ^
> SyntaxError: invalid syntax
> 
> Compiling usr/lib/python2.7/site-packages/daphne/testing.py ...
>   File "usr/lib/python2.7/site-packages/daphne/testing.py", line 166
>     async def __call__(self, send, receive):
>             ^
> SyntaxError: invalid syntax

Now that I think more about this: the build should have aborted due to
these compilation failures, but it did not. Due to this, such problems
are not caught by our autobuilders. It probably makes sense to have a
look and see why the build doesn't abort as it should.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
