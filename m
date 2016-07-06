From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 6 Jul 2016 15:09:26 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: fix wrong install
	step
In-Reply-To: <20160706150549.34ff0441@free-electrons.com>
References: <1467756127-30393-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160706144623.4015111f@free-electrons.com>
 <CA+TH9Vk4NMSP67dBpKjYTs9KRCrSBviZeCeo4NGXZzCdTxcWYg@mail.gmail.com>
 <20160706150549.34ff0441@free-electrons.com>
Message-ID: <CA+TH9V=cyeKKhvVtrjM0EowOUVrPqZjE8zADizy8F3Nr0__Eig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2016-07-06 15:05 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed, 6 Jul 2016 14:51:26 +0200, Angelo Compagnucci wrote:
>
>> > What are you doing the build_ext target again here?
>>
>> python pillow build command is:
>>
>> python setup.py build_ext --enable-[feature]
>>
>> and installation command is:
>>
>> python setup.py build_ext --enable-[feature] install
>>
>> It doesn't work either way, see the documentation here [1].
>
> Ah, ok. Thanks for the explanation. I hate to say I dislike what the
> python-pillow package needs to do, but there isn't a better option for
> now with the current python-package infrastructure. We'll live with
> that for now, and potentially improve the python-package infrastructure
> in the future if more packages have similar requirements.

Well, yes, I proposed a solution on a thread months ago, but for now
we a have such a requirement only for this package, so I convey with
you that the problem not arises.

>
>> >> +             $(PYTHON_PILLOW_BUILD_OPTS) install \
>> >> +             $(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
>> >> +             $(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
>> >
>> > Also, please use define ... endef for those commands (ditto for the
>> > build command, I missed that when applying the patch).
>>
>> Define what? They are the manadtory build and installation commands,
>> why make them conditional?
>
> Use:
>
> define PYTHON_PILLOW_BUILD_CMDS
>         ...
> endef
>
> instead of
>
> PYTHON_PILLOW_BUILD_CMDS = ...
>
> Ditto for the install target commands.

Will do!

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
