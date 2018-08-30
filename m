From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 30 Aug 2018 21:11:25 +0300
Subject: [Buildroot] [PATCH 1/1] package/libsoup: needs host-python3
In-Reply-To: <20180830171024.6d200527@windsurf>
References: <20180830101430.14862-1-asafka7@gmail.com>
 <20180830171024.6d200527@windsurf>
Message-ID: <87va7rwwqa.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf, Thomas,

Thomas Petazzoni writes:
> On Thu, 30 Aug 2018 13:14:30 +0300, Asaf Kahlon wrote:
>> The tld-parser script in libsoup is now written in Python,
>> and needs python3 to run.
>> 
>> Fixes:
>> http://autobuild.buildroot.net/results/91c2d6a1ca011787130db06695d6cd9e882f7258
>> http://autobuild.buildroot.net/results/a318e595f02937534b3f8698ef4c04194a8b34af
>> 
>> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>> 
>> ---
>> 
>> Maybe this specific script can run even with python2, but I don't think patchting the
>> "/usr/bin/env python3" line would be the right solution, especially considering
>> the fact that they already have python3-only code in recent commits.

Which commits do you refer to? The get_apache_module_dirs.py script is
only used by the meson build system, as far as I can see.

> Meh, I was hoping we could avoid the host-python3 dependency :-/

Later commits remove this script entirely. So we might be able to remove
this dependency in the future.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
