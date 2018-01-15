From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 15 Jan 2018 16:21:13 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: new package
In-Reply-To: <1209491448.2489150.1516029313233@mail.yahoo.com>
References: <20180112140107.15301-1-laurent_pubs@yahoo.com>
 <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
 <20180112220436.677e3084@windsurf.lan>
 <CAGm1_ksP2c_gLsSCJjN=Sr7gK0OR0Bdxd-jidXVhjgwOCFyiwQ@mail.gmail.com>
 <20180112233842.388e29a0@windsurf.lan>
 <276755364.2420280.1516020636845@mail.yahoo.com>
 <CAGm1_ktPX4fMyRO-A2dAcAR3ygj7kFxsbV+wex6imWxn--bMpw@mail.gmail.com>
 <1209491448.2489150.1516029313233@mail.yahoo.com>
Message-ID: <CAGm1_kstjv26G48Kmb=SEWMhn7S032voR+5qGk8cvURt0kTNHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 15, 2018 at 4:15 PM, Laurent Charpentier
<laurent_pubs@yahoo.com> wrote:
> Hi Yegor,
>
>>> Here are some experiments on my side.
>>> (1) AUTORECONF=yes (no use of ./bootstrap.sh)
>>> -> ./configure fails
>>
>> use this variant and create a LIBFOO_PRE_CONFIGURE_HOOKS in order to
>> create m4 folder via "mkdir -p". That's all. This way you'll preserve
>> depedency on host-autoconf, host-automake and host-libtool.
>
> I'm not sure to understand everything.
>
> Do you want this?
> define OPEN_LLDP_PRE_CONFIGURE_HOOKS
>         (cd $(@D) && mkdir -p m4)
> endef

Yes.

> Do you also want this? :
> OPEN_LLDP_DEPENDENCIES += host-autoconf host-automake host-libtool

No. AUTORECONF=yes automagically takes care of these dependencies.

Yegor
