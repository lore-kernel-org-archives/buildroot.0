From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 18 May 2015 09:03:54 -0500
Subject: [Buildroot] [PATCH v5 07/24] refpolicy: new package
In-Reply-To: <CAHXCMMJ+FYp+awTJFq1QmsgpEfMRR01Yfimr6AekmVFvoXjChg@mail.gmail.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-8-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMMJ+FYp+awTJFq1QmsgpEfMRR01Yfimr6AekmVFvoXjChg@mail.gmail.com>
Message-ID: <CANn-YGTSEtGBcCgoQdeOXw378rs5n9x-QmU4KhMZz-+n-+CQ6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

>> +# Pointing to the host compiler to build a sort application during the build.
>> +# The host compiler tools are not used for any part of the refpolicy build.
>> +# Note, the TEST_TOOLCHAIN option will also set the
>> +# LD_LIBRARY_PATH at run time.
>> +REFPOLICY_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
>> +       TEST_TOOLCHAIN="$(HOST_DIR)"
>> +
>> +# Build requies python2 to run
> s/requies/requires/

Good catch.

>> +define REFPOLICY_INSTALL_STAGING_CMDS
>> +       $(REFPOLICY_MAKE_ENV) $(REFPOLICY_MAKE) -C $(@D) install-src install-headers \
>> +               $(if $(BR2_HAVE_DOCUMENTATION),install-docs) \
> No need for conditional target. BR2_HAVE_DOCUMENTATION is already
> deprecated and will be removed sooner or later.
> So for staging install, choose either to always or never install the doc.

I will change the staging install step to always install the
documentation since it can be handy for policy debugging.


Thanks,
Clayton
