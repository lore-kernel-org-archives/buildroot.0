From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sat, 30 Jan 2016 12:30:11 +0100
Subject: [Buildroot] [PATCH v2 15/17] openal: add missing
 BR2_TOOLCHAIN_HAS_SYNC_4 dependency
In-Reply-To: <20160130000635.018f59fa@free-electrons.com>
References: <1453934861-26364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453934861-26364-16-git-send-email-thomas.petazzoni@free-electrons.com>
 <56ABB0C2.9070203@dawncrow.de> <20160130000635.018f59fa@free-electrons.com>
Message-ID: <56AC9EC3.9030706@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 30.01.2016 um 00:06 schrieb Thomas Petazzoni:
> Andr?,
> 
> On Fri, 29 Jan 2016 19:34:42 +0100, Andr? Hentschel wrote:
>> Hi Thomas,
>>
>> Isn't openal looking for the atomic functions and not for the sync ones?
>> As seen in the URL you provided:
>>
>> libopenal.so.1.17.1: undefined reference to `__atomic_fetch_sub_4'
>> libopenal.so.1.17.1: undefined reference to `__atomic_compare_exchange_4'
>> libopenal.so.1.17.1: undefined reference to `__atomic_fetch_add_4'
> 
> Hum, you are right indeed. I will look into this again, but if it's a
> dependency on __atomic functions, then it should depend on gcc >= 4.7
> *and* link with libatomic.

I looked a bit closer and openal has its own checks for availability of sync/atomic functions...
So the dependecy is something like (gcc >= 4.7 || has_sync_4)
Not sure how to make it link to libatomic without patching...
