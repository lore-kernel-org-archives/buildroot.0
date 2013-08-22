From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 23 Aug 2013 00:33:44 +0100
Subject: [Buildroot] [PATCH] python-setuptools: Add missing
 $(TARGET_DIR) to PYTHONPATH.
In-Reply-To: <52169D95.9030701@mind.be>
References: <1377204777-8904-1-git-send-email-markos.chandras@imgtec.com>
 <52169D95.9030701@mind.be>
Message-ID: <CAG2jQ8i4r8c+fYHT3P2xUQFXfbBCC5zOsZF3sJ1Xe5gvkTFvoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23 August 2013 00:24, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 22/08/13 22:52, Markos Chandras wrote:
>>
>> The $(TARGET_DIR) variable is required when building
>> python-setuptools for the target otherwise the build system detects
>> the host installation which leads to permission error problems
>> like these:
>>
>> Setuptools installation detected at /usr/lib64/python2.7/site-packages
>> Renaming
>> /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info to
>>
>> /usr/lib64/python2.7/site-packages/setuptools-0.9.8-py2.7.egg-info.OLD.1377005697.88
>> OSError: [Errno 13] Permission denied
>>
>> Moreover, remove the PYTHONPATH variable for host variant since it's
>> not needed.
>>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>   package/python-setuptools/python-setuptools.mk | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/python-setuptools/python-setuptools.mk
>> b/package/python-setuptools/python-setuptools.mk
>> index cd5ee4d..3044b4d 100644
>> --- a/package/python-setuptools/python-setuptools.mk
>> +++ b/package/python-setuptools/python-setuptools.mk
>> @@ -20,19 +20,18 @@ endef
>>
>>   define PYTHON_SETUPTOOLS_BUILD_CMDS
>>         (cd $(@D); \
>> -       PYTHONPATH="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
>> \
>> +
>> PYTHONPATH="$(TARGET_DIR))/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
>> \
>
>
>  Double ) there...
>

Sorry about that. I guess whoever commit this can fix it on the fly :)

-- 
Regards,
Markos Chandras
