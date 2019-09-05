From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 5 Sep 2019 20:55:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: python support needs
 .py modules
In-Reply-To: <20190905204902.127ebdaf@windsurf>
References: <20190905184403.19368-1-fontaine.fabrice@gmail.com>
 <20190905204902.127ebdaf@windsurf>
Message-ID: <CAPi7W81S3QRXke70_G+Xb-9wD_5Fpkzs4X50tsysAeJxOdGnfw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le jeu. 5 sept. 2019 ? 20:49, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Thu,  5 Sep 2019 20:44:03 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - https://bugs.buildroot.org/show_bug.cgi?id=12171
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thanks for the patch. A better commit log would be nice. But more
> importantly, do we understand why it absolutely needs the .py file ?
It uses it to get version_info (here is an exract of
https://github.com/opencv/opencv/blob/f33f88de3138366bc370f5d49d08d351179b910d/modules/python/package/cv2/__init__.py):

load_first_config(['config.py'], True)
load_first_config([
'config-{}.{}.py'.format(sys.version_info[0], sys.version_info[1]),
'config-{}.py'.format(sys.version_info[0])
], True)
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
