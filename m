From: Jean-Michel Hautbois <jean-michel.hautbois@veo-labs.com>
Date: Wed, 5 Oct 2016 14:41:08 +0200
Subject: [Buildroot] Xenomai 3.x
In-Reply-To: <0bdd01d21eef$f42d1d20$dc875760$@chordia.co.uk>
References: <CAH-u=80UriOruAmAcS0uiJfXzEXTB6LeM+OwV9=vB0D7+e3xgw@mail.gmail.com>
 <0b8401d21edd$b0d2b3d0$12781b70$@chordia.co.uk>
 <CAH-u=80h6GZDrk9inr751BjR5m_96tH71BWBOOKiKCJ54PGq8A@mail.gmail.com>
 <0bdd01d21eef$f42d1d20$dc875760$@chordia.co.uk>
Message-ID: <CAH-u=817AGbG8SXv=aiCus1vna6Jx2iO=xatLcufKGwuVjKGZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2016-10-05 12:05 GMT+02:00  <jerry@chordia.co.uk>:
> Hi JM
>
>>
>> What do you mean exactly, did you install a PREEMPT_RT kernel and have a
>> Xenomai 3.x on your side or no Xenomai at all, due to a lack of time ?
>
> We ended up working with the PREEMPT_RT patch on its own. Adding Xenomai started to look like a project all of its own.

OK.

> You are welcome.
>
> May I ask about your project? Have you got something that already uses Xenomai or is the interest in RT Linux more generally?

It is an existing product chich runs Xenomai 2.6 and I am upgrading to
Xenomai 3.
The objective is to make it work with PREEMPT_RT, as it eases the
choice of kernel (with Cobalt, you need to have a kernel supported by
Xenomai, and last one is 4.1 now. Or you can try to get it working
with the latest kernel but, not that easy :)).

Right now, I am still hesitating, as I can have one xenomai.mk file
which would be pretty much the same for Cobalt, but needs some
modifications for Mercury. And you get a lot of ifeq() statements
which is not nice.
Or, having one xenomai-2.mk and one xenomai-3.mk (or anything similar).
Or, having one xenomai.mk which would support Xenomai 2.x and Xenomai
3.x Cobalt only, and one xenomai-mercury.mk which would add support
for mercury options.

Not that easy to choose :).
JM
