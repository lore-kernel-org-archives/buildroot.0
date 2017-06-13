From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Jun 2017 08:28:55 +0300
Subject: [Buildroot] 32 bit applications on 64 bit Linux
In-Reply-To: <1695492899.10341621.1497328546532@mail.yahoo.com>
References: <1695492899.10341621.1497328546532.ref@mail.yahoo.com>
 <1695492899.10341621.1497328546532@mail.yahoo.com>
Message-ID: <20170613052855.ev2ousyrp373ozew@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tal,

On Tue, Jun 13, 2017 at 04:35:46AM +0000, Tal Lubko wrote:
> I'm using buildroot to build 64 bit Linux for ATOM SOC.My questions are:- 
> Does buildroot cross compiler supports building 32 bit applications for 64 
> bit Linux?- What packages are needed to be build in order to run 32 bit 
> application on the 64 bit Linux ? of course, the Linux was built with 
> buildroot.

What do you mean by "for 64bit Linux"?

64bit x86 Linux kernel should support 32bit userspace transparently. However, 
Buildroot does not natively support build of combined 32bit and 64bit in the 
same userspace target rootfs (a feature sometimes called biarch, or 
multiarch).

The requirements for building for 32bit x86 target are the same as for any 
other target Buildroot supports. See chapter 2 in the Buildroot manual[1]. 

> BTW: how can I check if this question was asked (and answered) before?

The only way is to search the mailing list archive.

[1] http://nightly.buildroot.org/manual.html#requirement

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
