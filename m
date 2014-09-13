From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 13 Sep 2014 15:51:39 -0400
Subject: [Buildroot] [PATCH] heirloom-mailx: add license info
In-Reply-To: <20140913184329.GA11424@tarshish>
References: <1410584439-31668-1-git-send-email-danomimanchego123@gmail.com>
 <20140913184329.GA11424@tarshish>
Message-ID: <CANxTyt51jPM7MikNV1XZh3G1+JaAALXSt9p3mebd9R11=qApnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Sat, Sep 13, 2014 at 2:43 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Danomi,
>
> On Sat, Sep 13, 2014 at 01:00:39AM -0400, Danomi Manchego wrote:
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>> ---
>>  package/heirloom-mailx/heirloom-mailx.mk | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
>> index 75221d4..0a80a3c 100644
>> --- a/package/heirloom-mailx/heirloom-mailx.mk
>> +++ b/package/heirloom-mailx/heirloom-mailx.mk
>> @@ -7,6 +7,8 @@
>>  HEIRLOOM_MAILX_VERSION = 12.5
>>  HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
>>  HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
>> +HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), IEEE (docs), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
>
> Do we install these IEEE licensed docs? If not I think we can omit this
> license. IANAL, though.

No, no doc is installed.  A man page gets installed, but then its
deleted during target finalization.

I'm sympathetic to the notion of dropping the license.  But in the
case of heirloom-mailx, all of these licenses are listed in the one
COPYING file.  So anyone that actually looks at the file will see IEEE
mentioned.

Besides, this seems consistent with other buildroot packages that call
out specific licenses for docs:

$ find -name \*.mk -exec grep 'LICENSE =' {} \+ | grep -v
LICENSE_FILES | grep -i doc
./package/jq/jq.mk:JQ_LICENSE = MIT (code), CC-BY-3.0 (documentation)
./package/docker/docker.mk:DOCKER_LICENSE = GPLv2+
./package/libassuan/libassuan.mk:LIBASSUAN_LICENSE = LGPLv2.1+
(library), GPLv3 (tests, doc)
./package/libcgicc/libcgicc.mk:LIBCGICC_LICENSE = LGPLv3+ (library),
GFDL1.2+ (docs)
./package/xenomai/xenomai.mk:XENOMAI_LICENSE = headers: GPLv2+ with
exception, libraries: LGPLv2.1+, kernel: GPLv2+, docs: GFDLv1.2+,
ipipe patch and can driver: GPLv2

Of course, maybe these should also drop the doc license components as
well?  For example, libassuan doesn't install the tests and the docs
gets deleted, so I think it makes sense to drop the GPLv3 COPYING and
just consider the LGPLv2.1 library.  When company policy is to treat
GPLv3 as a contaminant, it seems like this distinction can make a big
difference.

Not sure ...

Danomi -

> baruch
>
>> +HEIRLOOM_MAILX_LICENSE_FILES = COPYING
>>
>>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>  HEIRLOOM_MAILX_DEPENDENCIES += openssl
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
