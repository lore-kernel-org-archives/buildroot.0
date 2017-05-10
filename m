From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 10 May 2017 11:26:16 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-08
In-Reply-To: <20170509114619.727892c8@free-electrons.com>
References: <20170509062824.6D04D208E1@mail.free-electrons.com>
 <20170509093537.5560182b@free-electrons.com>
 <CAGm1_ktz8-x5g=bHt9-Hi88Vo3eb_VyR2TmaamLcKwNzB5PGWQ@mail.gmail.com>
 <20170509114619.727892c8@free-electrons.com>
Message-ID: <CAGm1_ku7Fu15Tko5LbrUYXKi7OxZ8eS0ki+uRidR6M=5bEautg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 9, 2017 at 11:46 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 9 May 2017 11:20:19 +0200, Yegor Yefremov wrote:
>
>> > error: Name clash for '<pstage/lib>libboost_system.a'
>> >
>> > Yegor, you are in the DEVELOPERS file for Boost, could you have a look ?
>>
>> OMG I'm the only one registered as DEVELOPER for boost.
>
> Good luck :-)
>
> Feel free to find other volunteers to maintain this wonderful package!
>
>> This situation seems to occur, when both iconv and icu are selected:
>>
>>     - iconv (libc)             : yes
>>     - icu                      : yes
>>
>> Need to dig further.
>
> Great, thanks!

Seems like it is a problem of locale, regex modules and static ICU.
See [1] for details. I think we should disable both modules if static
and ICU are selected.

Patch sent.

[1] http://boost.2283326.n4.nabble.com/bjam-Building-Regex-with-static-runtime-linking-td2588874.html

Yegor
