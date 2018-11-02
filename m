From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Fri, 02 Nov 2018 16:29:38 +0100
Subject: [Buildroot] [PATCH] linux-firmware: bump version to latest
 d877533
In-Reply-To: <20181102093441.617a43a9@windsurf>
References: <20181024103845.19057-1-m.niestroj@grinn-global.com>
 <20181101230022.318b0cfd@windsurf> <20181101220848.GZ28575@scaer>
 <20181102093441.617a43a9@windsurf>
Message-ID: <87r2g3lcpp.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> Hello,
>
> On Thu, 1 Nov 2018 23:08:48 +0100, Yann E. MORIN wrote:
>
>> > I don't get the same hash here:
>> > 
>> > ERROR: linux-firmware-d87753369b82c5f362250c197d04a1e1ef5bf698.tar.gz has wrong sha256 hash:
>> > ERROR: expected: 48f02db163bd1320cafa0c878f0c38d2184afa726f02622309be69416e420032
>> > ERROR: got     : 3c5ba0e3b282e44d5cef3d34a547caf3633c90b83807469357e92cca1fff8a38
>> > 
>> > And apparently Yann E. Morin also calculated the same hash as me after
>> > applying your version bump. Could you check what is happening ?  
>> 
>> If using a recent distribution that has tar 1.30 (e.g. Fedroa 28+,
>> Arch, or other rolling-release distros), you may have fallen in the
>> download dependencies trap, where host-tar would not be built when doing
>> a 'make source' from a clean tree.
>
> Which has just been fixed as of
> https://git.buildroot.org/buildroot/commit/?id=5b5feea8753520320d11896a24b970c60331bcdc,
> so Marcin, you may see automagically the new/correct hash if you retry
> on the latest Buildroot master (I merged this host-tar fix from Yann
> yesterday evening).

I have rebased my patch on master and I still get the same hash as
previously. That is logical, because I had host-tar already built when I
tested patch before submission. Can you confirm that problem was
actually on your side (i.e. my hash is correct)? After that I will
bump linux-firmware version to newest, extend commit message and send
PATCH v2.

>
> Thanks,
>
> Thomas


-- 
Regards,
Marcin
