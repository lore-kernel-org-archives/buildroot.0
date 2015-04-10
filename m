From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 10 Apr 2015 09:49:12 -0400
Subject: [Buildroot] [PATCH v2 04/25] psplash: move systemd service
 files to /usr/lib
In-Reply-To: <20150409215759.0fd7e64f@free-electrons.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
 <1426878856-15747-5-git-send-email-mike@mikebwilliams.com>
 <20150320203611.463c682a@free-electrons.com>
 <20150409215759.0fd7e64f@free-electrons.com>
Message-ID: <CANPyyuPHSADQvRXtY4DVLx1w5+QbosTFPV9xwxgQ_42eBJAZww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I'll take a look at all of those patches with comments next week, I'm
working on another project for a bit.

Thanks,
Mike

On Thu, Apr 9, 2015 at 3:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Mike,
>
> Ping ?
>
> Thomas
>
> On Fri, 20 Mar 2015 20:36:11 +0100, Thomas Petazzoni wrote:
>> Dear Mike Williams,
>>
>> On Fri, 20 Mar 2015 15:13:55 -0400, Mike Williams wrote:
>>
>> >  define PSPLASH_INSTALL_INIT_SYSTEMD
>> > +   mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> > +
>> >     $(INSTALL) -D -m 644 package/psplash/psplash-start.service \
>> > -           $(TARGET_DIR)/etc/systemd/system/psplash-start.service
>> > -   $(INSTALL) -d $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
>> > -   ln -sf  ../psplash-start.service \
>> > +           $(TARGET_DIR)/usr/lib/systemd/system/psplash-start.service
>> > +   $(INSTALL) -d $(TARGET_DIR)/usr/lib/systemd/system/sysinit.target.wants
>>
>> Why are we creating this directory?
>>
>> Thanks,
>>
>> Thomas
>
>
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
