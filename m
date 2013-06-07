From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Jun 2013 11:52:07 +0200
Subject: [Buildroot] [PATCHv3 ] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <20130607085719.GH14209@lukather>
References: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAHXCMMJgpbTstcZyUOnz2dsAFpWvZNhGgSdHggPNfHfR3tMPjA@mail.gmail.com>
 <20130529171711.412e5b4c@skate> <20130607085719.GH14209@lukather>
Message-ID: <CAHXCMMKsjheubMqTfZ4QS+heh-AGMDB+a_i0taxi+kx59=v3JA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Maxime, all,

2013/6/7 Maxime Ripard <maxime.ripard@free-electrons.com>:
> Hi Thomas,
>
> On Wed, May 29, 2013 at 05:17:11PM +0200, Thomas Petazzoni wrote:
>> On Wed, 29 May 2013 16:56:47 +0200, Samuel Martin wrote:
>> > I've run few builds (same config, with all or no modules selected,
>> > with/without this patch applied):
>> > -rw-r--r-- 1 sam sam 64M May 29 12:39
>> > br-output/python-without-patch/images/rootfs.tar
>> > -rw-r--r-- 1 sam sam 29M May 29 12:50
>> > br-output/python-with-patch-v3-no-modules/images/rootfs.tar
>> > -rw-r--r-- 1 sam sam 32M May 29 12:49
>> > br-output/python-with-patch-v3-all-modules/images/rootfs.tar
>>
>> I would have expected this 32M to be much closer to the 64M. Normally,
>> with all modules enabled, we should have the same size as the Python
>> interpreter without Maxime's patch.
>>
>> Or am I missing something?
Certainly ;)

>
> To be honest, I don't recall much about this 6-monthes-old patch.
>
> What I recall however is that it removed a significant size notably
> because we don't integrate the python unittests *at all*. And they were
> taking a significant space.
>
> I'd say that this patch reduces drastically the size of the interpreter
> without adding extra bugs (at least none that we caught so far). So
> maybe we can just merge this patch, close the bug, and if someone's
> willing to improve the situation, he can still step up and send
> additional patches.
>
> Maxime

Here are few diffs on the target dirs of the builds I run few days ago [1,2].

As you can see, in [2], most of the diff is due to the removal of:
- tk/idle
- 2to3 stuff
- tests

Regards,


[1] http://code.bulix.org/7tri5g-83719
[2] http://code.bulix.org/gzt98n-83720

-- 
Samuel
