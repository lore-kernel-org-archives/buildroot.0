From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Fri, 6 Mar 2015 19:33:45 -0500
Subject: [Buildroot] [PATCH 3/7] lttng-libust: bump to version 2.6.0
In-Reply-To: <20150306232431.1faa871b@free-electrons.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
 <1425663357-22541-4-git-send-email-eeppeliteloop@gmail.com>
 <20150306232431.1faa871b@free-electrons.com>
Message-ID: <CAB4xu_1wD-Y_vBM9PVxWN6Ag_fpxVWde=M_wAdHQa-vZGOhqMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 6, 2015 at 5:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Philippe Proulx,
>
> On Fri,  6 Mar 2015 12:35:53 -0500, Philippe Proulx wrote:
>
>
>>  LTTNG_LIBUST_INSTALL_STAGING = YES
>>  LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
>>
>> -ifeq ($(BR2_PACKAGE_PYTHON),y)
>> -LTTNG_LIBUST_DEPENDENCIES += python
>> -else ifeq ($(BR2_PACKAGE_PYTHON3),y)
>> -LTTNG_LIBUST_DEPENDENCIES += python3
>> -else
>> -LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
>> -endif
>
> Why? This sort of change should at least be described in the commit
> log, since it's clearly not a simple mechanical bump to 2.6.0.

That's actually a mistake. I thought Python was required for tests, but I
forgot about a small Python script that's packaged with LTTng-UST,
called lttng-gen-tp, which helps create tracepoint providers (C files
containing event definitions).

I will resubmit without this.

Phil
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
