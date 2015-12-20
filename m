From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 15:51:53 +0100
Subject: [Buildroot] RFC: Patch series for Kodi 16-Jarvis
In-Reply-To: <j6oikcxh6u.ln2@ID-313208.user.individual.net>
References: <3sigkcxlsq.ln2@ID-313208.user.individual.net>
 <vjiikcxh6u.ln2@ID-313208.user.individual.net>
 <20151220135412.652a8344@free-electrons.com>
 <20151220130054.GC3677@free.fr>
 <20151220141613.22b22bdc@free-electrons.com>
 <j6oikcxh6u.ln2@ID-313208.user.individual.net>
Message-ID: <20151220145152.GE3677@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-12-20 14:48 +0100, Bernd Kuhls spake thusly:
> Am Sun, 20 Dec 2015 14:16:13 +0100 schrieb Thomas Petazzoni:
[--SNIP--]
> > I think Bernd's intention was just to announce that he was going to post
> > all the patches as soon as Kodi 16 was out, but he wants to wait for
> > that release to happen before posting 100 patches on the list.
> 
> Hi Thomas,
> 
> yes, you got my intention right, and, btw, I just followed your advice ;) 
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/120960

Ah, OK! :-)

> @Yann: Thomas' comments were about license files and one missing SELECT 
> in Config.in and the format of a patch file, no big stuff.

Good!

> Just to get things right, these patches should be squashed into one patch 
> bumping all audio en-/decoder addons?
> 
> * 13b3dfb - package/kodi-audioencoder-wav: bump version 
> * cef928f - package/kodi-audioencoder-vorbis: bump version 
> * f5a66b6 - package/kodi-audioencoder-lame: bump version 
> * 603a6b6 - package/kodi-audioencoder-flac: bump version 
> * fd66f18 - package/kodi-audiodecoder-vgmstream: bump version 
> * 16a8773 - package/kodi-audiodecoder-timidity: bump version 
> * 91d7adf - package/kodi-audiodecoder-stsound: bump version 
> * 666a842 - package/kodi-audiodecoder-snesapu: bump version 
> * 7abfa7e - package/kodi-audiodecoder-sidplay: bump version 
> * 9476aa9 - package/kodi-audiodecoder-nosefart: bump version 
> * 6a13973 - package/kodi-audiodecoder-modplug: bump version 

As long as it is only a mechanical bump, without change to the .mk
files, and with n/removed patches (i.e. only the _VERSION variables are
changed), then yes, a single commit.

> These should be squashed into one patch to bump all pvr addons:
> * 909e692 - package/kodi-pvr-wmc: bump version 
> * 19e326d - package/kodi-pvr-vuplus: bump version 
> * f8db75b - package/kodi-pvr-vdr-vnsi: bump version 
> * 7e50b7d - package/kodi-pvr-vbox: bump version 
> * ebeea23 - package/kodi-pvr-stalker: bump version 
> * a988af9 - package/kodi-pvr-pctv: bump version 
> * 35557cb - package/kodi-pvr-njoy: bump version 
> * 24b0af6 - package/kodi-pvr-nextpvr: bump version 
> * 59045cb - package/kodi-pvr-mythtv: bump version 
> * dd75d83 - package/kodi-pvr-mediaportal-tvserver: bump version 
> * bc96596 - package/kodi-pvr-iptvsimple: bump version 
> * 8383797 - package/kodi-pvr-hts: bump version 
> * b0a5951 - package/kodi-pvr-filmon: bump version 
> * 5d8466f - package/kodi-pvr-dvbviewer: bump version 
> * c1d70ad - package/kodi-pvr-dvblink: bump version 
> * 21337f8 - package/kodi-pvr-argustv: bump version 

Yup. And possibly kodi-addon-xvdr too, no?

> and one patch for visualisation bumps:
> * 304d2be - package/kodi-visualisation-waveform: bump version 
> * d608df6 - package/kodi-visualisation-spectrum: bump version 
> * 10aaad1 - package/kodi-visualisation-shadertoy: bump version 

Yup.

> yet another patch for screensaver bumps:
> * 3f26e24 - package/kodi-screensaver-stars: bump version 
> * aa76a13 - package/kodi-screensaver-pyro: bump version 
> * ccae71c - package/kodi-screensaver-pingpong: bump version 
> * 8f8c82a - package/kodi-screensaver-greynetic: bump version 
> * 0d4e7f6 - package/kodi-screensaver-biogenesis: bump version 
> * 658b5eb - package/kodi-screensaver-asteroids: bump version 

Yup.

> What about the hash files to be added with the final patch series? Should 
> they be included in the combined patches or shall I make seperate patches 
> for each hash file added? If this is the case then I can keep the patch 
> series as is because I will then include each hash file with the 
> corresponding version bump patch. I kept the hash files out at this stage 
> because the Kodi development is still in progress with on-going updates 
> in the PVR area.

The hashes you include in the same patch as the bumps.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
