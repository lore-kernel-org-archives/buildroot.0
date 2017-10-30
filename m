From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Mon, 30 Oct 2017 09:24:33 -0500
Subject: [Buildroot] [PATCH v2 2/2] package/libssh2: Update to newest
	version
In-Reply-To: <20171028142205.GF3280@scaer>
References: <1509054225-19795-1-git-send-email-sam.voss@rockwellcollins.com>
 <1509054225-19795-2-git-send-email-sam.voss@rockwellcollins.com>
 <20171028142205.GF3280@scaer>
Message-ID: <CAH=K+6m_byJ=nvfrvs1b2PLE7wKOG+O2jTupD8Z27TZtsW3edw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Sat, Oct 28, 2017 at 9:22 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[..]
>> +LIBSSH2_AUTORECONF = YES
>
> ... [0] here state why we need to autoreconf:

Can do

>
>     # From the git tree; does not have generated autotools files.
>     LIBSSH2_AUTORECONF = YES
>
>> +
>> +define LIBSSH2_AUTORECONF_CMDS
>> +     cp $(@D)/src/libssh2_config.h.in $(@D)/example/libssh2_config.h.in
>> +endef
>> +LIBSSH2_PRE_CONFIGURE_HOOKS += LIBSSH2_AUTORECONF_CMDS
>
> Do we really need to copy that header, since we do not build the
> examples (explicitly disabled, above)?

It seems that, although we explicitly do not build the examples,
autoconf can't take that into account at the time of running
buildconf. I'll double check and make sure there isn't a way around
this.


Sam
