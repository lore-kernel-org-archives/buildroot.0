From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 10:57:36 +0200
Subject: [Buildroot] [PATCH] package/python-sentry-sdk: drop asyncio
 files for python 2.x to fix pycompile issue
In-Reply-To: <20201011130203.21796-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 11 Oct 2020 15:02:03 +0200")
References: <20201011130203.21796-1-peter@korsgaard.com>
Message-ID: <87lfgbstxb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > sentry-sdk has a set of optional "integrations", some of which use asyncio.
 > pycompile unfortunately errors out on these files when running under Python
 > 2.x:

 > ../scripts/pycompile.py ..
 > error:   File "/usr/lib/python2.7/site-packages/sentry_sdk/integrations/sanic.py", line 64
 >     async def sentry_handle_request(self, request, *args, **kwargs):
 >             ^
 > SyntaxError: invalid syntax

 > As a workaround, simply drop the unusable files from TARGET_DIR if building
 > for python 2.x.

 > Fixes:
 > http://autobuild.buildroot.net/results/9e4/9e47ee2a56153379e4e7bc839be5972a2302ba9f/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
