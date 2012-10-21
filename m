From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 21 Oct 2012 23:04:52 +0200
Subject: [Buildroot] [PATCH v4 1/2] dependencies: build a host python2
 if no suitable one can be found
In-Reply-To: <1342474686-10167-1-git-send-email-s.martin49@gmail.com>
References: <1342474686-10167-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMMLfMKnDsT1TFh5pxp_8q4DFjGCDQycvMW+tOJJ268PZjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Reviving an old thread...

2012/7/16 Samuel Martin <s.martin49@gmail.com>:
> Some distros choose to change the /usr/bin/python binary, making it pointed
> to python3 instead of python2.
>
> This may have some bad consequences for packages that uses some
> non-python3-compliant python scripts in their build system (eg. in install
> or post-install scripts).
>
> This patch checks for a suitable python2 version (2.6 or 2.7) on the host
> system, and declares the following variables:
> - PYTHON2: pointing to the host python2 binary;
> - NEED_PYTHON2: sets to "host-python" if no python2 binary has been found.
>
> This way, a package using some python2 scripts must:
> - adds $(NEED_PYTHON2) to its dependency list;
> - sets $(PYTHON2) as the python binary to be used.
>
> A side effect of this patch is getting rid of any host python. Buildroot
> can runs on a host without python, or with a too old python2 version, or
> with only python3; in such case, $(NEED_PYTHON2) should be added to the
> dependency list. So, we can get rid of the python dependency check.
>

Just to let you know that this patch may also fix some issues with
scons, which does not seem to support python3 yet.
Any comment about this?


Regards,

-- 
Sam
