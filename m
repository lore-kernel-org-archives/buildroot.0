From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Aug 2016 14:14:42 -0700
Subject: [Buildroot] [PATCH] libtasn1: add upstream build fix patch
In-Reply-To: <20160809230642.21436629@free-electrons.com>
References: <1470775776-18685-1-git-send-email-gustavo@zacarias.com.ar>
 <20160809230642.21436629@free-electrons.com>
Message-ID: <25BAE3F3-153E-4BC9-865E-912222E3F61E@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 9, 2016, at 2:06 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Tue,  9 Aug 2016 17:49:36 -0300, Gustavo Zacarias wrote:
>> Under certain circumstances the build will fail because some warnings
>> are treated as errors, such as:
>> 
>> ./parser_aux.h:97:1: error: inlining failed in call to '_asn1_set_down':
>> call is unlikely and code size would grow [-Werror=inline]
>> ASN1.y:437:59: error: called from here [-Werror=inline]
>> cc1: all warnings being treated as errors
>> 
>> Add upstream patch to address this.
>> 
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> After discussing on IRC, this patch is not needed: the current version
> of libtasn1, 4.8, has the gcc-warnings option disabled by default, so
> it does not add -Werror.
> 
> Apparently, the problem starts with version 4.9, which Gustavo was
> about to submit as a security fix. In this case --disable-gcc-warnings
> should be used.

I guess you are using -Os in that case
-Wno-error=inline in CFLAGS should suffice if version of compiler in use
supports it. --disable-gcc-warnings is a broader brush might suppress
more important warnings.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160809/90f1fcb1/attachment.asc>
