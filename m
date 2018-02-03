From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat, 3 Feb 2018 22:21:44 +0100
Subject: [Buildroot] [PATCH] package/gpsd: add config option for
 Spectratime iSync and build fix patch
In-Reply-To: <CANQCQpZY02Kj1UPetVDdg+sXfhEHOnTpmC4p0W8LX=0LNgpdUA@mail.gmail.com>
References: <1517422787-12753-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <CANQCQpZY02Kj1UPetVDdg+sXfhEHOnTpmC4p0W8LX=0LNgpdUA@mail.gmail.com>
Message-ID: <51742709-ec9b-4cf8-76a7-993d0402124a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew,


On 02/03/2018 06:42 PM, Matthew Weber wrote:
> Zoltan,
>
> On Wed, Jan 31, 2018 at 7:19 PM, Zoltan Gyarmati
> <mr.zoltan.gyarmati@gmail.com> wrote:
>>  As in the inital 3.17 version bump patch the iSync config option was not
>> added, the iSync driver was implicitly enabled in the gpsd config as default,
>> and due to a bug in the gpsd build setup, this caused several autobuild issues
>> which are fixed by this. This commit adds both the Buildroot config option and
>> the gpsd patch which was also sent to and accepted in upstream.
>>
>> Fixes:
>>     http://autobuild.buildroot.net/results/555b4bdd1707aa21e6d3014e30b635c96c5efffc
>>     http://autobuild.buildroot.net/results/cfc14a2c471c63ecc4c95c12b8e00ed7656acfd2
>>     http://autobuild.buildroot.net/results/2104e15526bd6f467f0d56dee10b5fa46e2c71dd
>>     http://autobuild.buildroot.net/results/610b3f898b396c1def682b809482408c2c4555bc
>>     ... and many more.
> Are all of the current gpsd failures this one?

According to my wget/grep fu, yes, all of the gpsd 3.17 autobuild errors
caused by this.

>
>> --- /dev/null
>> +++ b/package/gpsd/0002-Fix-isync-build-when-ublox-not-selected-too.patch
>> @@ -0,0 +1,32 @@
>> +From 98c8f5f4429ac3bfc09eee235fee08b9aaff8c52 Mon Sep 17 00:00:00 2001
>> +From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
>> +Date: Tue, 30 Jan 2018 19:58:54 -0800
>> +Subject: [PATCH] Fix isync build when ublox not selected too.
>> +
>> +The isync support uses the ublox driver, but if the ublox support is
>> +disabled while isync is enabled, the build will fail.
>> +
> Please add a link to your upstream submission "Upstream: <link>"

Good point, will send a V2.

>
> Matt
Thanks for the review, regards,

Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180203/2718e52a/attachment.asc>
