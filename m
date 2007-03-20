From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 20 Mar 2007 15:44:05 +0100
Subject: [Buildroot] regarding SoC based on arm1176
In-Reply-To: <ef974dc70703200712g4f58d38cy5acc9083ec6d6cfc@mail.gmail.com>
References: <ef974dc70703200535n7746f774t21ee0389cbafa7d1@mail.gmail.com>
	<20070320133914.GA21858@aon.at>
	<ef974dc70703200712g4f58d38cy5acc9083ec6d6cfc@mail.gmail.com>
Message-ID: <20070320144405.GA22351@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 20, 2007 at 07:42:11PM +0530, Maxin John wrote:
>Dear Bernhard Fischer,
>
>In the present project, I am using an ARM1176jzf-s processor based SoC.
>
>
>On 3/20/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
>>On Tue, Mar 20, 2007 at 06:05:14PM +0530, Maxin John wrote:
>>>Hi all,
>>>
>>>I am a newbie in arm-linux.The current
>>>buildroot(buildroot-20070320.tar.bz2) doesn't seems to support arm1176
>>>based SoCs.
>>>
>>>I have read the Documentation regarding extending the buildroot with
>>>more software.But it doesn't describe the situation when we need to
>>>add new hardware support for buildroot.  Please guide me to include
>>>the 1176 support in buildroot.
>>
>>which 1176 do you have? AFAICS all 1176 variants have MMUs, right?
>
>Yes, The arm1176jzf-s has MMU support.

do a svn up from buildroot and uClibc and select your variant.
Sounds like you want to add -march=armv6 -mtune=arm1176jzf-s to your
TARGET_OPTIMIZATIONS of your .config
