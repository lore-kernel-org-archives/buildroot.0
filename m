From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Dec 2014 11:36:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Add eventfd_read() and
	eventfd_write()
References: <1414183436-6964-1-git-send-email-bernd.kuhls@t-online.de>
 <20141208222547.GE4105@free.fr>
Message-ID: <XnsA403761AE234DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20141208222547.GE4105 at free.fr:

> Bernd, All,
> 
> On 2014-10-24 22:43 +0200, Bernd Kuhls spake thusly:
>> Needed for upcoming eventfd support in Kodi:
>> 
https://github.com/FernetMenta/xbmc/commit/1030119691a67511b6e9a27abdec474
525de8d26
> 
> As Peter said, we do not like to carry feature patches in Buildroot.
> 
> If Kodi really requires eventfd, we'll have to mark it incompatible with
> uClibc in Buildroot. Kodi is already a big beast all by itself, so the
> oversize of glibc would not be that noticeable when compared to Kodi.

the patch I mentioned is currently not included in Kodi 14.0rc3-Helix so 
there is no need to either tweak dependencies or add my patch to uclibc 
atm. Let?s hope it will stay that way ;)

> Also, your use-case is a bit weird: you said you're using the fli4l
> project to run Kodi on it. We failed to see the relation with Buildroot.

The build system for the fli4l project is based on buildroot, they 
regularly sync with upstream[1].

Regards, Bernd

[1] https://ssl.nettworks.org/bugs/browse/FFL-1084
