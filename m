From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 27 Apr 2012 16:30:10 +0200
Subject: [Buildroot] setup.py: issue with python path
In-Reply-To: <4F9AA263.2060907@atmel.com>
References: <4F9AA263.2060907@atmel.com>
Message-ID: <CAGm1_ktsb3D_jPdLO44bXeKU3CMXOEfDM1o2Ham10tecAGxO3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 27, 2012 at 3:42 PM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:
> Hello,
>
> I want to add a new package to buildroot: lava-test. Installation is done by
> setup.py.
> Having a look to what was done for some packages as python setuptools, I did
> this:
>
> LAVA_TEST_VERSION = 0.7
> LAVA_TEST_SOURCE = lava-test-$(LAVA_TEST_VERSION)-2012.04.tar.gz
> LAVA_TEST_SITE = https://launchpad.net/lava-test/trunk/2012.04/+download/
> LAVA_TEST_DEPENDENCIES = python-setuptools
>
> define LAVA_TEST_INSTALL_TARGET_CMDS
> ?(cd $(@D);
> PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
> ?$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
> endef
>
> $(eval $(call GENTARGETS))
>
> My files are correctly installed on the target but I have this issue:
>
> # lava-test reset
> -sh: lava-test: not found
> # cat /usr/bin/lava-test
> #!/home/ldesroches/workspace/buildroot/output/host/usr/bin/python
> # EASY-INSTALL-ENTRY-SCRIPT: 'lava-test==0.7','console_scripts','lava-test'
> __requires__ = 'lava-test==0.7'
> import sys
> from pkg_resources import load_entry_point
>
> sys.exit(
> ? load_entry_point('lava-test==0.7', 'console_scripts', 'lava-test')()
> )
> #
>
> Do you know how changing this python path? Is it possible to give the target
> python path instead of using PYTHON_PATH.

Could you provide the whole patch?

Yegor
