From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Feb 2017 15:20:24 +0100
Subject: [Buildroot] [PATCH/autobuild] get_toolchain_configs: be robust
	against network errors
In-Reply-To: <20170214213607.21736-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 14 Feb 2017 22:36:07 +0100")
References: <20170214213607.21736-1-peter@korsgaard.com>
Message-ID: <87fujfh6xj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Once in a while some of my autobuilder instances hangs with an exception
 > from urllib:

 > Process Process-1:
 > Traceback (most recent call last):
 >   File "/home/peko/host/usr/lib/python2.7/multiprocessing/process.py", line 258, in _bootstrap
 >     self.run()
 >   File "/home/peko/host/usr/lib/python2.7/multiprocessing/process.py", line 114, in run
 >     self._target(*self._args, **self._kwargs)
 >   File "/home/peko/buildroot-test/scripts/autobuild-run", line 804, in run_instance
 >     ret = gen_config(**kwargs)
 >   File "/home/peko/buildroot-test/scripts/autobuild-run", line 526, in gen_config
 >     configs = get_toolchain_configs()
 >   File "/home/peko/buildroot-test/scripts/autobuild-run", line 291, in get_toolchain_configs
 >     with urlopen_closing(config["url"]) as r:
 >   File "/home/peko/buildroot-test/scripts/autobuild-run", line 146, in <lambda>
 >     urlopen_closing = lambda uri: contextlib.closing(urlopen(uri))
 >   File "/home/peko/host/usr/lib/python2.7/urllib2.py", line 127, in urlopen
 >     return _opener.open(url, data, timeout)
 >   File "/home/peko/host/usr/lib/python2.7/urllib2.py", line 404, in open
 >     response = self._open(req, data)
 >   File "/home/peko/host/usr/lib/python2.7/urllib2.py", line 422, in _open
 >     '_open', req)
 >   File "/home/peko/host/usr/lib/python2.7/urllib2.py", line 382, in _call_chain
 >     result = func(*args)
 >   File "/home/peko/host/usr/lib/python2.7/urllib2.py", line 1214, in http_open
 >     return self.do_open(httplib.HTTPConnection, req)
 >   File "/home/peko/host/usr/lib/python2.7/urllib2.py", line 1184, in do_open
 >     raise URLError(err)
 > URLError: <urlopen error [Errno -2] Name or service not known>

 > If this happens, simply ignore the configuration and try again.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
