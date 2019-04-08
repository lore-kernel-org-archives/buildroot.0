From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 08 Apr 2019 21:48:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/fstrcmp: new package
References: <20190407170941.19461-1-bernd.kuhls@t-online.de>
 <CANQCQpaSfczRHwznRVUJ=w_FNBVZRePKbd20Rw3XgX+LnBPMrg@mail.gmail.com>
Message-ID: <n5lsnfxd9i.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

Am Mon, 08 Apr 2019 08:09:16 -0500 schrieb Matthew Weber:

> Did checkpackage find anything on package/fstrcmp/*?

$ ./utils/check-package package/fstrcmp/*
78 lines processed
0 warnings generated

> Any upstream bug worth mentioning?

I did not find any active support mechanism, the trackers mentioned on 
http://fstrcmp.sourceforge.net/ are all down and https://sourceforge.net/
projects/fstrcmp/support is also not helpful...

> Is the fstrcmp binary really needed in staging or is it a cut paste err
> from FSTRCMP_INSTALL_TARGET_CMDS?

No, fstrcmp can be dropped from staging, Kodi only needs libfstrcmp.a:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/
Findfstrcmp.cmake#L31

> Probably can drop the static lib and .pc installs from your
> FSTRCMP_INSTALL_TARGET_CMDS?

Yes, you are right, .a and .pc can be dropped from target.

Because this package is not specific for Kodi I installed all binary 
files in staging and target but this was too much ;)

Regards, Bernd
