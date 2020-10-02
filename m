From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 10:58:42 +0200
Subject: [Buildroot] [PATCH v2] package/python-txtorcon.mk: drop _py3
 file for python 2.x to fix pycompile issue
In-Reply-To: <20200930073157.24001-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 30 Sep 2020 09:31:57 +0200")
References: <20200930073157.24001-1-peter@korsgaard.com>
Message-ID: <87sgax0zst.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/76b580000e6311e88584874f942517badd6fadf6/

 > python-txtorcon DOES support python 2.x, but it contains some optional
 > python 3 / async code in controller_py3.py which is conditionally used from
 > controller.py:

 > try:
 >     from .controller_py3 import _AsyncOnionAuthContext
 >     HAVE_ASYNC = True
 > except Exception:
 >     HAVE_ASYNC = False

 > pycompile unfortunately errors out on the async code:

 > ../scripts/pycompile.py ..
 > error:   File "/usr/lib/python2.7/site-packages/txtorcon/controller_py3.py", line 13
 >     async def __aenter__(self):
 >             ^
 > SyntaxError: invalid syntax

 > As a workaround, simply drop the unusable _py3 file from TARGET_DIR if
 > building for python 2.x.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
