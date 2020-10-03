From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2020 08:58:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-fire.mk: drop
 test_components_py3.py file for python 2.x to fix pyfile issue
In-Reply-To: <20201002134048.24473-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 2 Oct 2020 15:40:48 +0200")
References: <20201002134048.24473-1-peter@korsgaard.com>
 <20201002134048.24473-2-peter@korsgaard.com>
Message-ID: <874knbyeww.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/72e0cc78194a1b93bf26a50742e59a1e93bde1d1/

 > fire has conditional logic to load test_components_py3.py when running under
 > Python 3.x:

 > if six.PY3:
 >   from fire import test_components_py3 as py3

 > pycompile unfortunately errors out on it:

 > ../scripts/pycompile.py ..

 > error:   File "/usr/lib/python2.7/site-packages/fire/test_components_py3.py", line 18
 >     def identity(arg1, arg2: int, arg3=10, arg4: int = 20, *arg5,
 >                            ^
 > SyntaxError: invalid syntax

 > As a workaround, simply drop the unusable _py3 file from TARGET_DIR if
 > building for python 2.x.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
