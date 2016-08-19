From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2016 13:43:21 -0700
Subject: [Buildroot] [PATCH] qt: build using old C++ standart
In-Reply-To: <1471636769.5256.21.camel@synopsys.com>
References: <1471623523-23829-1-git-send-email-vzakhar@synopsys.com>
 <0C7FB5F2-6BD7-4019-9A66-A0BB67984A18@gmail.com>
 <1471636769.5256.21.camel@synopsys.com>
Message-ID: <25068817-CF68-4829-82F8-C593F52EA5F6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 19, 2016, at 1:01 PM, Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> 
> Hi Khem,
> 
> On Fri, 2016-08-19 at 10:21 -0700, Khem Raj wrote:
>>> 
>>> On Aug 19, 2016, at 9:18 AM, Vlad Zakharov <Vladislav.Zakharov@synopsys.com> wrote:
>>> 
>>> 'std::auto_ptr' is deprecated with gcc-6 but is used in qt4 code.
>>> So we have to build using old C++ standart to prevent build failures.
>>> 
>>> qt4 is not being developed no more, so unfortunately we can't update
>>> obsolete C++ code and have to add this workaround.
>>> 
>>> Fixes:
>>> http://autobuild.buildroot.net/results/541/54172d55f39b2fcfa5b7fb4d4ee01566678babbc//
>>> and also Qt build for ARC.
>>> 
>>> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
>>> ---
>>> package/qt/qt.mk | 5 +++++
>>> 1 file changed, 5 insertions(+)
>>> 
>>> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
>>> index 09b8dc2..41cdd1a 100644
>>> --- a/package/qt/qt.mk
>>> +++ b/package/qt/qt.mk
>>> @@ -41,6 +41,11 @@ QT_CFLAGS = $(TARGET_CFLAGS)
>>> QT_CXXFLAGS = $(TARGET_CXXFLAGS)
>>> QT_LDFLAGS = $(TARGET_LDFLAGS)
>>> 
>>> +# Qt WebKit build fails when gcc-6 is used for build.
>>> +# 'std::auto_ptr' is deprecated with gcc-6
>>> +# So, we have to use old c++ standart to prevent build failure
>>> +QT_CXXFLAGS += -std=gnu++98
>> 
>> you might add -Wno-deprecated as well.
> 
> Why would we need it if "-std=gnu++98" already fixes the build problem?

IIRC there were issues when -werror was on, there still were warnings
on some architectures, may be in BR such a case is not encountered yet.

> 
> -Alexey

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160819/b81239b8/attachment.asc>
