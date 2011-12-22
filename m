From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 22 Dec 2011 15:04:44 +0100
Subject: [Buildroot] [PATCH v4 4/5] New package: python-setuptools
In-Reply-To: <20111222131741.4b15d2fe@skate>
References: <1324555715-32123-1-git-send-email-yegorslists@googlemail.com>
 <1324555715-32123-5-git-send-email-yegorslists@googlemail.com>
 <20111222131741.4b15d2fe@skate>
Message-ID: <CAGm1_kvTtHHH=gFnpDaXrGtizM_JPiFRC3oUBgU1-QeM23d6ng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 22, 2011 at 1:17 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Thu, 22 Dec 2011 13:08:34 +0100,
> yegorslists at googlemail.com a ?crit :
>
>> +PYTHON_SETUPTOOLS_DEPENDENCIES = host-python
>
> Shouldn't this be:
>
> PYTHON_SETUPTOOLS_DEPENDENCIES = python
>
> HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python

ACK

>> +define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
>> + ? ? (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
>> +endef
>> +
>> +define HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS
>> + ? ? (cd $(@D); PYTHONPATH="$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
>> + ? ? $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
>> +endef
>> +
>> +define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
>> + ? ? (cd $(@D); PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"\
>> + ? ? $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
>> +endef
>
> You have build/install for the host case, but only install for the
> target case. Does it really work?

I don't get any errors and I can see setuptools files in both host and
target site-packages folder. But I've added build commands for target
now.

Yegor
