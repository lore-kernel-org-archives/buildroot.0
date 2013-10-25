From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 25 Oct 2013 10:09:06 +0200
Subject: [Buildroot] [PATCH v8 RESEND 1/8] package: add base dependency
 to every package
In-Reply-To: <CAAXf6LUznsz6=BJi=6i_GAe0YmFOfmXVLJzELgmdFoCV3NQy-Q@mail.gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-2-git-send-email-fabio.porcedda@gmail.com>
 <52683BBC.7070506@mind.be>
 <CAHkwnC_3oA+DKkUxVweB0Xt5wqWt11epFujXvmStEu25hGQNOA@mail.gmail.com>
 <CAAXf6LUznsz6=BJi=6i_GAe0YmFOfmXVLJzELgmdFoCV3NQy-Q@mail.gmail.com>
Message-ID: <CAHkwnC9WU5VtdtCNRKx_V88xODAnjj9qPkuymnJaZua8kJOUPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 24, 2013 at 10:22 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi,
>
> On Thu, Oct 24, 2013 at 9:41 AM, Fabio Porcedda
> <fabio.porcedda@gmail.com> wrote:
>>>
>>>
>>>  Although this is one of the most useful patches of the series, it is also
>>> the one that introduces the circular dependency. So although it looks good,
>>> I'm not ready to ack it.
>>
>> I've found a work around:
>>
>> $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
>>
>> # to prevent circular dependency
>> ifneq ($(1),$(DEPENDENCIES_HOST_PREREQ))
>> $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
>> endif
>>
>> What do you think about that?
>>
>
> I don't think this will work if there are more than one prerequisite:
> $(1) will be one of them, and DEPENDENCIES_HOST_PREREQ will be the
> entire list, so that 'ifneq' will always be true.
> I think you need 'filter' here.
> http://www.gnu.org/software/make/manual/make.html#index-filter-587

Yes it works fine with filter, thanks for suggesting it.


> Best regards,
> Thomas


Thanks and regards
-- 
Fabio Porcedda
