From: Lionel Orry <lionel.orry@gmail.com>
Date: Mon, 3 Mar 2014 07:51:45 +0100
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.0.1
In-Reply-To: <20140301232520.4ee4b22b@skate>
References: <1381509097-5424-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140301232520.4ee4b22b@skate>
Message-ID: <CAKAx1cj3DKFEcSjtw2-d1y3sZSO9y6kpvE6ZGjRdycnNAAugMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy and Thomas,

On Sat, Mar 1, 2014 at 11:25 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Jerzy Grzegorek,
>
> On Fri, 11 Oct 2013 18:31:37 +0200, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>> ---
>>  package/zeromq/zeromq.mk |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
>> index a624b52..d40bed5 100644
>> --- a/package/zeromq/zeromq.mk
>> +++ b/package/zeromq/zeromq.mk
>> @@ -4,7 +4,7 @@
>>  #
>>  ################################################################################
>>
>> -ZEROMQ_VERSION = 3.2.4
>> +ZEROMQ_VERSION = 4.0.1
>>  ZEROMQ_SITE = http://download.zeromq.org/
>>  ZEROMQ_INSTALL_STAGING = YES
>>  ZEROMQ_DEPENDENCIES = util-linux
>
> I tried to apply this patch, but unfortunately, it apparently breaks
> the build of mongrel2:
>
> src/superpoll.c: In function 'SuperPoll_poll':
> src/superpoll.c:229:53: error: 'ZMQ_POLL_MSEC' undeclared (first use in this function)
> src/superpoll.c:229:53: note: each undeclared identifier is reported only once for each function it appears in
>
> I've checked the other reverse dependencies of zeromq, and they seem to
> build fine.
>
> Can you find a solution to the mongrel2 problem, and resubmit the
> appropriate patch?

Such a patch would fix compilation, but the fact is this version of
Mongrel2 was not tested with ZeroMQ v4 and greater
and I don't know if we can simply bump its version like that. Maybe we
can but I am not 100% sure.

On another hand, mongrel2 development is becoming active again and
they are trying to prepare a release, so I will try to check there if
they ensure zeromq4 compliance and tested it. I will get back to you
when I can on this subject.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Best regards,
Lionel
