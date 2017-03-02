From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 2 Mar 2017 18:46:21 +0100
Subject: [Buildroot] [PATCH] package/can-utils: add license information
In-Reply-To: <20170302171918.2294335e@free-electrons.com>
References: <58b30e3e-a64e-a608-ee0e-7d616d4c9932@grandegger.com>
 <20170302171918.2294335e@free-electrons.com>
Message-ID: <fc2ff6d9-9f6e-b878-9f48-d48f73913a19@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Am 02.03.2017 um 17:19 schrieb Thomas Petazzoni:
> Hello,
>
> On Thu, 2 Mar 2017 17:06:33 +0100, Wolfgang Grandegger wrote:
>
>>  CAN_UTILS_VERSION = c3305fdd515464153d20199db232b6124bc962c0
>>  CAN_UTILS_SITE = $(call github,linux-can,can-utils,$(CAN_UTILS_VERSION))
>> +CAN_UTILS_LICENSE = GPLv2, GPLv2+, BSD-3c
>
> I think it's actually: some parts are under GPLv2+ only, while some
> other parts are under BSD-3c or GPLv2. So this would be:
>
> CAN_UTILS_LICENSE = GPLv2+, GPLv2 or BSD-3c

Yes:

$ grep -l  "version 2" *.c | xargs grep -l "any later version"
can-calc-bit-timing.c
canfdtest.c
slcand.c
slcanpty.c

The 21 remaining utilities use GPLv2 or BSD-3c.

> but it would be nice to indicate what is under what license, like this:
>
> CAN_UTILS_LICENSE = GPLv2+ (this), GPLv2 or BSD-3c (that)
>
> I haven't looked in details as to what license applies to what part. I
> would suppose that the "library" parts are under GPLv2 or BSD-3c, while
> the programs are under GPLv2+, but this remains to be verified.

There is no libraries.

Wolfgang.
