From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 14 Feb 2017 09:27:43 +0100
Subject: [Buildroot] [PATCH] glmark2: bump version
In-Reply-To: <20170213223900.7167f053@free-electrons.com>
References: <20170213200619.10535-1-gary.bisson@boundarydevices.com>
 <20170213223900.7167f053@free-electrons.com>
Message-ID: <CAAMH-yt5ar=Y3zRR-Y3XRMSD-nWXGSfOLbY7WMj_+ZUR1+Eb+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Feb 13, 2017 at 10:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 13 Feb 2017 21:06:19 +0100, Gary Bisson wrote:
>> The package otherwise fails to build with a recent toolchain with GCC6
>> (tested with Linaro ARM 2016.11).
>>
>> It used to fail at sqrt check during package configuration:
>>  Checking for function sqrt               : not found
>>  The configuration failed
>>
>> Bumping version to latest HEAD fixes the issue as explained in the
>> following discussion:
>> https://github.com/glmark2/glmark2/issues/15
>>
>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>>  package/glmark2/glmark2.hash | 2 +-
>>  package/glmark2/glmark2.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks. However, I had to add a reference to an
> autobuilder issue (after checking that I could reproduce the issue, and
> that it was indeed fixed by your patch). Next time, could you make sure
> to include a reference to the autobuilder failure being fixed?

Sure, I didn't know there was an autobuilder issue about it actually.
I just ran into it myself.

BTW, when we have such case, is it possible to drop the faulty
defconfig somewhere so the autobuilder can try it later? Or is the
best option is sending it on the ML or on IRC?

Thanks,
Gary
