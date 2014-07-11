From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 11 Jul 2014 18:36:36 +0200
Subject: [Buildroot] autobuild-run update
In-Reply-To: <20140708232244.39817a4c@free-electrons.com>
References: <20140708232244.39817a4c@free-electrons.com>
Message-ID: <CAHkwnC9qytLwyvxAJ5Bkfc--1Cmh_Y9PY7Vq20OYYG1ErpRLDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 8, 2014 at 11:22 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> I've pushed a few updates to the autobuild-run script:
>
>   autobuild-run: don't try to build XBMC
>   http://git.buildroot.net/buildroot-test/commit/?id=8a7fc81cd82ce408e6818ad64b8ab6aab83a30c4
>
>   autobuild-run: do not build lttng-tools with toolchains affected by PR58854
>   http://git.buildroot.net/buildroot-test/commit/?id=ec03a70a7428005219e23fd4c837ac80b3988a89
>
>   autobuild-run: do not build sdl with toolchains affected by PR60155
>   http://git.buildroot.net/buildroot-test/commit/?id=9336e1725e586cd6037e7f61d25dfd089f0d13e5
>
> I've updated the script on the Free Electrons build server with those
> updates. However, while doing so, a few failed builds were generated
> and are visible in the http://autobuild.buildroot.org output. It looks
> like the autobuild-run script needs some improvements to handle clean
> termination of builds. Contributions welcome.

Hi Thomas,
thanks for the great work.

I'm trying to use it on a Ubuntu 14.04 but it fails in few seconds
with this error:

 ./autobuild-run --ninstances 2 --njobs 3
WARN: due to the lack of http login/password details, results will not
be submitted
WARN: tarballs of results will be kept locally only
Process Process-1:
Traceback (most recent call last):
  File "/usr/lib/python2.7/multiprocessing/process.py", line 258, in _bootstrap
    self.run()
  File "/usr/lib/python2.7/multiprocessing/process.py", line 114, in run
    self._target(*self._args, **self._kwargs)
  File "./autobuild-run", line 445, in run_instance
    ret = gen_config(instance, njobs, instance_log)
  File "./autobuild-run", line 269, in gen_config
    configs = get_toolchain_configs()
  File "./autobuild-run", line 125, in get_toolchain_configs
    r = urllib2.urlopen(config["url"])
  File "/usr/lib/python2.7/urllib2.py", line 127, in urlopen
    return _opener.open(url, data, timeout)
  File "/usr/lib/python2.7/urllib2.py", line 410, in open
    response = meth(req, response)
  File "/usr/lib/python2.7/urllib2.py", line 523, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python2.7/urllib2.py", line 448, in error
    return self._call_chain(*args)
  File "/usr/lib/python2.7/urllib2.py", line 382, in _call_chain
    result = func(*args)
  File "/usr/lib/python2.7/urllib2.py", line 531, in http_error_default
    raise HTTPError(req.get_full_url(), code, msg, hdrs, fp)
HTTPError: HTTP Error 404: Not Found
Process Process-2:
Traceback (most recent call last):
  File "/usr/lib/python2.7/multiprocessing/process.py", line 258, in _bootstrap
    self.run()
  File "/usr/lib/python2.7/multiprocessing/process.py", line 114, in run
    self._target(*self._args, **self._kwargs)
  File "./autobuild-run", line 445, in run_instance
    ret = gen_config(instance, njobs, instance_log)
  File "./autobuild-run", line 269, in gen_config
    configs = get_toolchain_configs()
  File "./autobuild-run", line 125, in get_toolchain_configs
    r = urllib2.urlopen(config["url"])
  File "/usr/lib/python2.7/urllib2.py", line 127, in urlopen
    return _opener.open(url, data, timeout)
  File "/usr/lib/python2.7/urllib2.py", line 410, in open
    response = meth(req, response)
  File "/usr/lib/python2.7/urllib2.py", line 523, in http_response
    'http', request, response, code, msg, hdrs)
  File "/usr/lib/python2.7/urllib2.py", line 448, in error
    return self._call_chain(*args)
  File "/usr/lib/python2.7/urllib2.py", line 382, in _call_chain
    result = func(*args)
  File "/usr/lib/python2.7/urllib2.py", line 531, in http_error_default
    raise HTTPError(req.get_full_url(), code, msg, hdrs, fp)
HTTPError: HTTP Error 404: Not Found

Do you have any idea on how to fix this?

Thanks & BR
-- 
Fabio Porcedda
