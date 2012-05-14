From: ludovic.desroches <ludovic.desroches@atmel.com>
Date: Mon, 14 May 2012 09:46:27 +0200
Subject: [Buildroot] [PATCH] New: add lava-test package
In-Reply-To: <CAGm1_ku0voiSVZE=QoKyYkJfTQRa-=s=UnfD645pW7gLXfW3XQ@mail.gmail.com>
References: <CAGm1_ktsb3D_jPdLO44bXeKU3CMXOEfDM1o2Ham10tecAGxO3g@mail.gmail.com>
 <1335539086-10206-1-git-send-email-ludovic.desroches@atmel.com>
 <4F9AB75A.8040607@visionsystems.de> <4F9ABCD4.4050400@atmel.com>
 <CAGm1_kvzhyHAxOxWkj3FtaJ6LqCSR3XgFR1PujbEU1aB_MaWMg@mail.gmail.com>
 <4FAB6EAF.8020607@atmel.com>
 <CAGm1_ku0voiSVZE=QoKyYkJfTQRa-=s=UnfD645pW7gLXfW3XQ@mail.gmail.com>
Message-ID: <4FB0B853.9040707@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 05/10/2012 09:39 AM, Yegor Yefremov a ?crit :
> On Thu, May 10, 2012 at 9:30 AM, ludovic.desroches
> <ludovic.desroches@atmel.com>  wrote:
>> Hi Yegor,
>>
>> Le 05/07/2012 04:08 PM, Yegor Yefremov a ?crit :
>>
>>> On Fri, Apr 27, 2012 at 5:35 PM, Ludovic Desroches
>>> <ludovic.desroches@atmel.com>    wrote:
>>>>
>>>> Le 04/27/2012 05:12 PM, Yegor Yefremov a ?crit :
>>>>
>>>>> Am 27.04.2012 17:04, schrieb ludovic.desroches at atmel.com:
>>>>>>
>>>>>>
>>>>>> From: Ludovic Desroches<ludovic.desroches@atmel.com>
>>>>>>
>>>>>> Signed-off-by: Ludovic Desroches<ludovic.desroches@atmel.com>
>>>>>> ---
>>>>>>   package/Config.in              |    1 +
>>>>>>   package/lava-test/Config.in    |    8 ++++++++
>>>>>>   package/lava-test/lava-test.mk |   11 +++++++++++
>>>>>>   3 files changed, 20 insertions(+), 0 deletions(-)
>>>>>>   create mode 100644 package/lava-test/Config.in
>>>>>>   create mode 100644 package/lava-test/lava-test.mk
>>>>>>
>>>>>> diff --git a/package/Config.in b/package/Config.in
>>>>>> index 3e5f708..79f9aaf 100644
>>>>>> --- a/package/Config.in
>>>>>> +++ b/package/Config.in
>>>>>> @@ -22,6 +22,7 @@ source "package/dhrystone/Config.in"
>>>>>>   source "package/dstat/Config.in"
>>>>>>   source "package/dmalloc/Config.in"
>>>>>>   source "package/kexec/Config.in"
>>>>>> +source "package/lava-test/Config.in"
>>>>>>   source "package/lmbench/Config.in"
>>>>>>   source "package/lsof/Config.in"
>>>>>>   source "package/ltp-testsuite/Config.in"
>>>>>> diff --git a/package/lava-test/Config.in b/package/lava-test/Config.in
>>>>>> new file mode 100644
>>>>>> index 0000000..d13dfd7
>>>>>> --- /dev/null
>>>>>> +++ b/package/lava-test/Config.in
>>>>>> @@ -0,0 +1,8 @@
>>>>>> +config BR2_PACKAGE_LAVA_TEST
>>>>>> +       bool "lava-test"
>>>>>> +       help
>>>>>> +         LAVA Test is a test execution framework designed to make it
>>>>>> easy to
>>>>>> +        install and run supported tests. Results from testing can be
>>>>>> +        optionally uploaded to a dashboard running lava-dashboard.
>>>>>> +
>>>>>> +        https://launchpad.net/lava-test
>>>>>> diff --git a/package/lava-test/lava-test.mk
>>>>>> b/package/lava-test/lava-test.mk
>>>>>> new file mode 100644
>>>>>> index 0000000..f6df4a2
>>>>>> --- /dev/null
>>>>>> +++ b/package/lava-test/lava-test.mk
>>>>>> @@ -0,0 +1,11 @@
>>>>>> +LAVA_TEST_VERSION = 0.7
>>>>>> +LAVA_TEST_SOURCE = lava-test-$(LAVA_TEST_VERSION)-2012.04.tar.gz
>>>>>> +LAVA_TEST_SITE =
>>>>>> https://launchpad.net/lava-test/trunk/2012.04/+download/
>>>>>> +LAVA_TEST_DEPENDENCIES = python-setuptools
>>>>>> +
>>>>>> +define LAVA_TEST_INSTALL_TARGET_CMDS
>>>>>> +  (cd $(@D);
>>>>>>
>>>>>> PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
>>>>>> +  $(HOST_DIR)/usr/bin/python setup.py install
>>>>>> --prefix=$(TARGET_DIR)/usr)
>>>>>> +endef
>>>>>> +
>>>>>> +$(eval $(call GENTARGETS))
>>>>>
>>>>>
>>>>>
>>>>> Thank you for the patch. I'll look at it next week.
>>>>>
>>>>> Yegor
>>>>>
>>>>>
>>>>
>>>> Ok, thanks.
>>>
>>>
>>> Unfortunately I found no solution so far. I described our problem
>>> here:
>>> https://groups.google.com/d/topic/comp.lang.python/0rDWl2d8PDY/discussion
>>> and I hope someone will point to a solution. I looked here, but found
>>> no mention about python executable path:
>>> http://docs.python.org/install/index.html.
>>>
>>> Yegor
>>>
>>
>> Thanks for your help. In my case I can correct it with a post-build script
>> but it's not a proper solution.
>
> Not really. I'm afraid setuptools will have to be changed to support the
> functionality we need to cross-install such scripts. If you could
> contact Chris Lambacher, perhaps he could help (his blog post about
> cross-compiling python extensions
> http://whatschrisdoing.com/blog/2009/10/16/cross-compiling-python-extensions/).
> Unfortunately he is not active on G+  and I don't have his private
> e-mail.
>
> Yegor
>
>

I had a look to his blog and disutilscross. I am not familiar with this 
but I think it's more than I need in this case but yes we'll probably 
need it in other cases.

Maybe virtualenv can help us.

I'll continue to do research about this subject. I'll keep you inform if 
I find something interesting.

Regards

Ludovic
