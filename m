From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 19 Jul 2011 15:59:28 +0200
Subject: [Buildroot] [Bug 3685] ncurses installation hangs due to old
 version of tic
In-Reply-To: <CANPyyuNysycKDHUOJbanqWB4qp0t+NgWKYjk5xyj3bV7BypDJA@mail.gmail.com>
References: <bug-3685-163@https.bugs.busybox.net/>
 <20110719124505.D22168B2ED@busybox.osuosl.org>
 <CANPyyuNysycKDHUOJbanqWB4qp0t+NgWKYjk5xyj3bV7BypDJA@mail.gmail.com>
Message-ID: <CAAXf6LW-QMMyqGr8UyV1sf_woy+6+c4nkrQs_VK56BgqxgW0KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 19, 2011 at 3:23 PM, Mike Williams <mike@mikebwilliams.com> wrote:
> All,
>
>> --- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ?---
>> (In reply to comment #2)
>>> Any specific reason why this has not been included in buildroot yet?
>>>
>>> Thanks,
>>> Thomas
>>
>> No, I just haven't looked at it / forgotten about it / not been able to
>> reproduce it locally. Will take a look at it tonight.
>
> I also had this problem. It appears to be caused by the old version
> present on RHEL 5.4, which is what I'm using in our corporate
> environment. If I had to guess, it would be because the tic being
> called is the one on the host system, not the one built by buildroot.

Correct. The patch I proposed avoids that by compiling a host version
of tic in buildroot. This one is later used during the installation of
the target ncurses.

Thomas
