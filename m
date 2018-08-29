From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Aug 2018 12:01:25 +0300
Subject: [Buildroot] [PATCH 1/1] encfs: new package
In-Reply-To: <1535532457.29191.12.camel@tkos.co.il>
References: <1535517151-26179-1-git-send-email-yairba@tkos.co.il>
 <87efehya1l.fsf@tkos.co.il> <1535532457.29191.12.camel@tkos.co.il>
Message-ID: <87a7p5y2ai.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yair,

Yair Ben Avraham writes:
> I will post a second version of the patch. Two questions below,
>
> On Wed, 2018-08-29 at 09:13 +0300, Baruch Siach wrote:
>> > +ENCFS_VERSION = 1.9.5
>> > +ENCFS_SOURCE = encfs-$(ENCFS_VERSION).zip
>> > +ENCFS_SITE = $(call github,vgough,encfs,v$(ENCFS_VERSION))
>> Upstream provides a proper tarball:
>> 
>>  https://github.com/vgough/encfs/releases/download/v1.9.5/encfs-1.9.
>> 5.tar.gz
>> 
>> Please use that instead of the github helper.
>
> tarball is prior to zip archive with github helper?

tarballs are generally preferred over using the github helper. We only
use the github helper when there is no upstream provided tarball. In
this case the tarball is even more preferable since it is signed by the
upstream maintainer.

>> > +-DRUNTIME_OUTPUT_DIRECTORY=$(BUILD_DIR) \
>> > +-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=$(BUILD_DIR)/usr/bin \
>> These are only used for the bundled libxml2. If you use the Buildroot
>> package, this would not be needed.
>
> If not using the above *RUNTIME_OUTPUT_DIRECTORY variables, I'm getting
> during linking the CXX executables:
> arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot open output file
> encfs: Is a directory

OK. Please add a comment about that. Would also be nice to report
upstream. I'm far from a cmake expert, but it looks like a bug.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
