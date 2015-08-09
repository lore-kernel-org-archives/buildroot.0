From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 09 Aug 2015 22:35:10 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/jsoncpp: bump version to
	1.6.5
References: <1439123310-6602-1-git-send-email-bernd.kuhls@t-online.de>
 <20150809145443.GB2570@tarshish>
 <1439143511.12501.11.camel@embedded.rocks>
 <d6ok9cxek9.ln2@ID-313208.user.individual.net>
 <20150809201327.GF2570@tarshish>
Message-ID: <u4qk9cxek9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 09 Aug 2015 23:13:27 +0300 schrieb Baruch Siach:

> Hi Bernd,
> 
> On Sun, Aug 09, 2015 at 10:01:49PM +0200, Bernd Kuhls wrote:
>> Am Sun, 09 Aug 2015 20:05:11 +0200 schrieb J?rg Krause:
>> > I already submitted a patch for jsoncpp version bump and removing the
>> > snprintf-patch:
>> > http://patchwork.ozlabs.org/patch/502324/
>> 
>> sorry, I did not notice. I think your patch is better because it takes
>> care of the non-c11 toolchains but, as discussed, could you please keep
>> the snprintf patch? Therefore I marked my patch as superseded ;)
> 
> Where has this been discussed? I must have missed something.

Hi Baruch,

http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/124666

jsoncpp 1.6.5 still fails to compile on x86 without the snprintf patch 
using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_JSONCPP=y

Regards, Bernd
