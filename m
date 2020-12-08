From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 08 Dec 2020 07:44:22 +0200
Subject: [Buildroot] [PATCH next] package/daemon: bump to version 0.7
In-Reply-To: <20201207225906.58a9f0db@windsurf.home>
References: <1fd6d6ff9eaedda5e3b3e85c4c5c0b950dcbaec8.1605981054.git.baruch@tkos.co.il>
 <20201207225906.58a9f0db@windsurf.home>
Message-ID: <87im9csvgp.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Dec 07 2020, Thomas Petazzoni wrote:
> On Sat, 21 Nov 2020 19:50:54 +0200
> Baruch Siach <baruch@tkos.co.il> wrote:
>>  define DAEMON_CONFIGURE_CMDS
>> -	(cd $(@D); ./config)
>> +	(cd $(@D); ./configure)
>
> What is the config/configure script doing? Indeed, it seems odd that
> when cross-compiling, we don't need to pass it the
> cross-compiler/cross-linker/CFLAGS, etc. ?

This script does only this:

case "`uname -a`" in
        Linux*)
                echo "Configuring for linux"
                conf/linux
                ;;
...

The conf/linux script modifies a few Makefiles and headers for generic
Linux build. Nothing architecture specific. This works because we assume
that host and target are both Linux.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
