From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 23:11:56 +0200
Subject: [Buildroot] [PATCH-2020.02.x] package/python-autobahn: drop
 asyncio files for python 2.x to fix pycompile issu
In-Reply-To: <20201011082943.9561-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 11 Oct 2020 10:29:42 +0200")
References: <20201011082943.9561-1-peter@korsgaard.com>
Message-ID: <87imbgv55v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/234/234913f86da45df0708bbe3bf7361169e2398c9f

 > Autobahn contains optional logic using asyncio, which causes pycompile
 > issues when running in python 2.x:

 > pycompile.py --strip-root /srv/storage/autobuild/run/instance-1/output-1/target /srv/storage/autobuild/run/instance-1/output-1/target/usr/lib/python2.7
 > error:   File "/usr/lib/python2.7/site-packages/autobahn/xbr/_blockchain.py", line 97
 >     async def get_market_status(self, market_id):
 >             ^
 > SyntaxError: invalid syntax

 > As a workaround, simply drop the unusable files from TARGET_DIR if building
 > for python 2.x.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Only for 2020.02.x. Newer autobahn versions are python3 only

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
