From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Aug 2018 13:48:59 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/mariadb: bump version to
 10.3.9
References: <20180825204403.11324-1-bernd.kuhls@t-online.de>
 <20180825204403.11324-2-bernd.kuhls@t-online.de>
 <20180825230514.1f0264dd@windsurf>
 <o5u85fxpst.ln2@ID-313208.user.individual.net>
 <20180825233958.29369922@windsurf>
Message-ID: <bmga5fxcsc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 25 Aug 2018 23:39:58 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Sat, 25 Aug 2018 23:26:48 +0200, Bernd Kuhls wrote:
> 
>> Only when bumping to 10.3 you get past this build error just to see the
>> "undefined reference to `__sync_fetch_and_add_8'" error later on.
>> To solve this the changes in this patch are needed.
> 
> So it still needs some atomic intrinsics, so the package should:
> 
> 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_4

Hi Thomas,

why "BR2_TOOLCHAIN_HAS_SYNC_4" and not "BR2_TOOLCHAIN_HAS_SYNC_8"?

Regards, Bernd
