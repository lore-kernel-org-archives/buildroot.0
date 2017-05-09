From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 9 May 2017 11:20:19 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-08
In-Reply-To: <20170509093537.5560182b@free-electrons.com>
References: <20170509062824.6D04D208E1@mail.free-electrons.com>
 <20170509093537.5560182b@free-electrons.com>
Message-ID: <CAGm1_ktz8-x5g=bHt9-Hi88Vo3eb_VyR2TmaamLcKwNzB5PGWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 9, 2017 at 9:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Alexey, Yegor, Bernd, Yann, Vicente, Fabrice, Frank, Floris, Peter,
> J?r?me, there are some questions/issues for you below :-)
>
> On Tue,  9 May 2017 08:28:24 +0200 (CEST), Thomas Petazzoni wrote:
>
>> Build statistics for 2017-05-08
>> ================================
>>
>>       successes : 217
>>        failures : 23
>
> We're doing quite well for a beginning of the debugging cycle, so it'd
> be great to reduce even further the number of build failures. Let's
> analyze a few of them.
>
> On 23 issues:
>
>    13 issues that have no solution yet
>    10 issues that have a solution committed, or close to be committed
>
>>       xtensa |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/436f6173bb29a945abc75899a6b74e1266362fc9 |
>
> error: Name clash for '<pstage/lib>libboost_system.a'
>
> Yegor, you are in the DEVELOPERS file for Boost, could you have a look ?

OMG I'm the only one registered as DEVELOPER for boost.

This situation seems to occur, when both iconv and icu are selected:

    - iconv (libc)             : yes
    - icu                      : yes

Need to dig further.

Yegor
