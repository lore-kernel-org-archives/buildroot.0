From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 5 Nov 2017 12:34:59 -0500
Subject: [Buildroot] [PATCH 1/1] refpolicy: bump to 2.20170805
In-Reply-To: <20171103185619.3de8abde@windsurf>
References: <20171103125856.16518-1-aduskett@gmail.com>
 <20171103185619.3de8abde@windsurf>
Message-ID: <CAFSsvmqDWvMtg5hYYugd6VKSO3YUNFWB8dKp6t1M73SOwPWm2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello;

On Fri, Nov 3, 2017 at 1:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri,  3 Nov 2017 08:58:56 -0400, Adam Duskett wrote:
>
>> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
>> +REFPOLICY_DEPENDENCIES += host-python3
>> +REFPOLICY_PYTHON="$(HOST_DIR)/bin/python(PYTHON3_VERSION_MAJOR)"
>> +else
>> +REFPOLICY_DEPENDENCIES += host-python
>> +REFPOLICY_PYTHON="$(HOST_DIR)/bin/python(PYTHON_VERSION_MAJOR)"
>> +endif
>
> I'm not sure why this is needed. Indeed, if BR2_PACKAGE_PYTHON3=y,
> $(HOST_DIR)/bin/python points to python3, and if
> BR2_PACKAGE_PYTHON=y, $(HOST_DIR)/bin/python points to python2.
>
Huh, didn't know that.  I will change that asap!

> Therefore, you should be able to just use $(HOST_DIR)/bin/python.
>
> Could you try that instead?
>
> Also, please answer Matt's concerns before sending a v2. Thanks!
>
We talked on IRC. :)  The contrib module is included in the tarball as
Arnout has said.
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
