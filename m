From: Steven Noonan <steven@uplinklabs.net>
Date: Mon, 9 Nov 2015 14:07:36 -0800
Subject: [Buildroot] [PATCH] package/python-protobuf: eliminate unneeded
 build-time dependencies
In-Reply-To: <20151109220830.4c64c607@free-electrons.com>
References: <CAKbGBLgXpMNaSOGgGg5nmLLdub=R44pDMWJNRGbMyErRz7NSoQ@mail.gmail.com>
 <1447002489-2373-1-git-send-email-steven@uplinklabs.net>
 <20151109220830.4c64c607@free-electrons.com>
Message-ID: <CAKbGBLgfySFrLfOVySKt4e=NWUkkFOHP06reAuWJRZj9h7Cx0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 9, 2015 at 1:08 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Steven,
>
> On Sun,  8 Nov 2015 09:08:09 -0800, Steven Noonan wrote:
>> This was causing unexpected HTTP requests by the setup.py script for
>> python-protobuf. These "dependencies" aren't actually required for a successful
>> build, and are not staged into the target install directory.
>
> The reference to the autobuild is missing. It should contain:
>
> Fixes:
>
>         http://autobuild.buildroot.org/results/e44/e44694f30e39266491a1040e284e504d6d37ef9e/

OK. I'll add that and rename the patch file later this evening.

>>
>> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> (I have verified that your patch fixes the build problem in the minimal
> chroot I use for Buildroot testing in my autobuilder instance)

Good to hear. :)

>> +++ b/package/python-protobuf/protobuf-2.6.1-disable-unneeded-build-dependencies.patch
>
> This file name is not correct according to our patch naming policy. It
> should be 0001-disable-unneeded-build-dependencies.patch.
>
> Also, can you submit this change upstream ?

Upstream would make use of the lines we're removing. It's intended for
running their unit tests, which we don't use when building it.
