From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 15 Jan 2018 15:52:46 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: new package
In-Reply-To: <276755364.2420280.1516020636845@mail.yahoo.com>
References: <20180112140107.15301-1-laurent_pubs@yahoo.com>
 <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
 <20180112220436.677e3084@windsurf.lan>
 <CAGm1_ksP2c_gLsSCJjN=Sr7gK0OR0Bdxd-jidXVhjgwOCFyiwQ@mail.gmail.com>
 <20180112233842.388e29a0@windsurf.lan>
 <276755364.2420280.1516020636845@mail.yahoo.com>
Message-ID: <CAGm1_ktPX4fMyRO-A2dAcAR3ygj7kFxsbV+wex6imWxn--bMpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 15, 2018 at 1:50 PM, Laurent Charpentier
<laurent_pubs@yahoo.com> wrote:
> Hi Thomas and Yegor,
>
> On Fri, 12 Jan 2018 22:29:44 +0100, Yegor Yefremov wrote:
>
>> > So instead, please keep <pkg>_AUTORECONF = YES, and if the missing m4
>> > folder is the only problem (but I doubt it because the bootstrap.sh
>> > script doesn't create it), then add a post-extract hook that creates
>> > the m4 file.
>>
>> bootstrap.sh doesn't create m4 folder, but if you just clone the
>> open-lldp repo and invoke "autoreconf -i", it would just complain
>> about missing m4 folder, but create it. In BR environment we get an
>> error. We had similar situation earlier with some other package
>> (libsoc) and I coudn't find the case of the problem, so I just added
>> m4 upstream and now it is working.
>
> Here are some experiments on my side.
> (1) AUTORECONF=yes (no use of ./bootstrap.sh)
> -> ./configure fails

use this variant and create a LIBFOO_PRE_CONFIGURE_HOOKS in order to
create m4 folder via "mkdir -p". That's all. This way you'll preserve
depedency on host-autoconf, host-automake and host-libtool.

Yegor
