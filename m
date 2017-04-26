From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 26 Apr 2017 11:47:27 -0700
Subject: [Buildroot] [PATCH 2/9] package/python-traitlets: New package
In-Reply-To: <20170426092624.7687d704@free-electrons.com>
References: <20170425191423.13294-1-andrew.smirnov@gmail.com>
 <20170425191423.13294-3-andrew.smirnov@gmail.com>
 <20170426092624.7687d704@free-electrons.com>
Message-ID: <CAHQ1cqHMMFWWcEtqvrvQcm8jP5Cc6Uqu-jocebEnxZiMsaLimA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 26, 2017 at 12:26 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 25 Apr 2017 12:14:16 -0700, Andrey Smirnov wrote:
>> diff --git a/package/python-traitlets/Config.in b/package/python-traitlets/Config.in
>> new file mode 100644
>> index 0000000..ba79218
>> --- /dev/null
>> +++ b/package/python-traitlets/Config.in
>> @@ -0,0 +1,8 @@
>> +config BR2_PACKAGE_PYTHON_TRAITLETS
>> +     select BR2_PACKAGE_PYTHON_DECORATOR
>> +     select BR2_PACKAGE_PYTHON_ENUM if BR2_PACKAGE_PYTHON
>> +     bool "python-traitlets"
>
> The "bool" should be before the selects. Have you run your packages
> through support/scripts/check-package ?

No, forgot to do that, my bad, sorry. Will do in v2.

>
>> +PYTHON_TRAITLETS_DEPENDENCIES = python-decorator
>> +
>> +ifeq ($(BR2_PACKAGE_PYTHON),y)
>> +PYTHON_TRAITLETS_DEPENDENCIES += python-enum
>> +endif
>
> Are these really build time dependencies, or just runtime dependencies?

I think all of those are runtime dependencies. Will remove code like
this for non build time dependencies globally in v2.

Thanks,
Andrey Smirnov
