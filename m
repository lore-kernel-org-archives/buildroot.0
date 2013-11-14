From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 14 Nov 2013 13:51:10 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-11-12
In-Reply-To: <CAAXf6LWVm8bYNzScEA=iqE42QzbeSGP1-LTShCmAW4bNZJqFWg@mail.gmail.com>
References: <20131113073025.D898952C60E@lolut.humanoidz.org>
 <CAAXf6LWgt30AW1tNK=uNgvY=7gJqgT3QVxkPtuP4YDSmiSDKZA@mail.gmail.com>
 <CAAXf6LWVm8bYNzScEA=iqE42QzbeSGP1-LTShCmAW4bNZJqFWg@mail.gmail.com>
Message-ID: <CAAXf6LWhaeS7S1TWT+ZyNixhFyC8zvNxC-2zrm3YBuNvtBx-rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 13, 2013 at 9:18 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Wed, Nov 13, 2013 at 5:22 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> Hi,
>>
>> On Wed, Nov 13, 2013 at 8:30 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Build statistics for 2013-11-12
>>> ===============================
>> [..]
>>>        sh4 |               vim-699f8d8f096d | NOK | http://autobuild.buildroot.net/results/21b5a910e6a27fa1cb12d0002ffed7e6ed9d6c83/
>>
>> The problem here is:
>> edit.c:(.text+0x1614): undefined reference to `libintl_gettext'
>>
>> So seems gettext related.
>> I cannot yet reproduce this bug. I tried a limited build 'make
>> toolchain vim' and also 'make toolchain gettext vim', but both work
>> fine with that same defonfig.
>>
>> Interestingly, the autobuild configure output says:
>> checking for NLS... gettext() works
>> while in my reproduction it says:
>> checking for NLS... gettext() works with -lintl
>>
>> This is a difference I cannot explain. I'm currently trying a full
>> rebuild, but any input in the mean time is welcome...
>
> FYI, I have seen the problem on a full rebuild, will analyze the
> difference and get back...

I have found the problem in vim, and have sent a patch upstream. I
don't know if they will accept that, and will wait a brief while for
some feedback from them, before sending it to buildroot.

Best regards,
Thomas
