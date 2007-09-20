From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 11:29:35 +0200
Subject: [Buildroot] sysroot not anabled even when	BR2_GCC_VERSION_4_2_1
	is selected
In-Reply-To: <20070920091136.GA27699@aon.at>
References: <12792950.post@talk.nabble.com> <20070920091136.GA27699@aon.at>
Message-ID: <20070920092935.GC27699@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 11:11:36AM +0200, Bernhard Fischer wrote:
>On Thu, Sep 20, 2007 at 01:28:04AM -0700, Hebbar wrote:
>>
>>Hi All,
>>
>> I just tried latest buildroot snapshot and below is my buildroot config.
>>What i observed is that BR2_TOOLCHAIN_SYSROOT i snot selected even though i
>>have enabled gcc 4.2.1. Let me know if any one has a quickest solution. LEt
>>me know if anyone needs more info.
>
>I just noticed that too. Sounds like i broke that yesterday, will fix
>ASAP.

It sounds like there is a bug in lxdialog:
config FOO
   bool "foo"
config BAR
   depends on !!FOO

The double negation seems to lead to an error and this error doesn't
show up anywhere, from the looks. Would be nice if somebody would have a
look if that's really the case and talk to Sam Ravnborg and or Roman
Zippel
