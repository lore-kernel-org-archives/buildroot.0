From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 6 Jul 2016 14:51:26 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: fix wrong install
	step
In-Reply-To: <20160706144623.4015111f@free-electrons.com>
References: <1467756127-30393-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160706144623.4015111f@free-electrons.com>
Message-ID: <CA+TH9Vk4NMSP67dBpKjYTs9KRCrSBviZeCeo4NGXZzCdTxcWYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2016-07-06 14:46 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed,  6 Jul 2016 00:02:07 +0200, Angelo Compagnucci wrote:
>
>> -PYTHON_PILLOW_INSTALL_TARGET_CMDS = $(PYTHON_PILLOW_BUILD_CMDS) install
>> +PYTHON_PILLOW_INSTALL_TARGET_CMDS = cd $(PYTHON_PILLOW_BUILDDIR); \
>> +             $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
>> +             $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
>
> What are you doing the build_ext target again here?

python pillow build command is:

python setup.py build_ext --enable-[feature]

and installation command is:

python setup.py build_ext --enable-[feature] install

It doesn't work either way, see the documentation here [1].

>> +             $(PYTHON_PILLOW_BUILD_OPTS) install \
>> +             $(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
>> +             $(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
>
> Also, please use define ... endef for those commands (ditto for the
> build command, I missed that when applying the patch).

Define what? They are the manadtory build and installation commands,
why make them conditional?

[1] https://pillow.readthedocs.io/en/3.3.x/installation.html#build-options

>
> Thanks,
>
> Thomas

Sincerely, Angelo

> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
