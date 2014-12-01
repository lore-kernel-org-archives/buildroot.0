From: =?UTF-8?Q?Andr=C3=A9_Erdmann?= <dywi@mailerd.de>
Date: Mon, 1 Dec 2014 22:19:31 +0100
Subject: [Buildroot] [PATCH 1/2] skeleton: make /run a directory
In-Reply-To: <547CD9A3.3080603@zacarias.com.ar>
References: <1417106898-14444-1-git-send-email-gustavo@zacarias.com.ar>
 <CAGrucu1AtrSqG8_9Z6J0u4dR-Des_9W4xHH-HwguLpoen3vY3A@mail.gmail.com>
 <CAHXCMM+J7M99tGUykrxi8MrruVsb34qa3CjHMTsf9XpesHS5vw@mail.gmail.com>
 <547CD9A3.3080603@zacarias.com.ar>
Message-ID: <CAGrucu0UjiXt22U-CFKda+Da8fNMjhszXbh=yixZLTMJ5uTN1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-12-01 22:12 GMT+01:00 Gustavo Zacarias <gustavo@zacarias.com.ar>:
> On 12/01/2014 06:01 PM, Samuel Martin wrote:
>
>>> Shouldn't we link /var/lock to (../)run/lock then?
>>
>> I think we shuould.
>
> It's not a prerequisite for this patch to get applied.
> And that would fail badly for the systemd scenario, you want to use
> tmpfiles.d for that since /run will be empty and no inittab/script will
> fill that up.
> Regards.
>

There are already tmpfiles.d rules for that, /usr/lib/tmpfiles.d/legacy.conf:

d /run/lock 0755 root root -
L /var/lock - - - - ../run/lock

To make it work properly for systemd, /var/lock needs to be removed
from the skeleton or point to /run/lock (or replace the "L" with "L+"
in the tmpfiles.d rule).


-- 
Andr?
