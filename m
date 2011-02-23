From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Feb 2011 16:23:18 +0100
Subject: [Buildroot] No response after "Freeing init memory"
In-Reply-To: <AANLkTimf6Yvj1CSSwPT4Qg399_72ZOQhaR9tvPx_w+sM@mail.gmail.com>
	(=?utf-8?Q?=22Zden=C4=9Bk?= Materna"'s message of "Wed, 23 Feb 2011
	12:00:00 +0100")
References: <AANLkTimNjQwt1HtqQLCcnsVWtSp7=3Mb2M_00EMsdOzS@mail.gmail.com>
	<AANLkTikh9tw-PuERGodGqC+aVS0dfkiyR11RGghcx=E2@mail.gmail.com>
	<AANLkTi=pxm_KCKqhFr0c7kMs_DU6m1wE49V5K6ShE=WQ@mail.gmail.com>
	<20110222192538.6720529a@surf>
	<AANLkTimGr8JsO82tn==M8n9zAtfpxMoRPOvh_vY9sKb_@mail.gmail.com>
	<AANLkTimf6Yvj1CSSwPT4Qg399_72ZOQhaR9tvPx_w+sM@mail.gmail.com>
Message-ID: <87oc62yduh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Zden?k" == Zden?k Materna <zdenek.materna@gmail.com> writes:

 Zden?k> Ouch, my mistake! All files in /dev are plain text... I have to
 Zden?k> mount ext2 rootfs or untar rootfs from output/images on my
 Zden?k> laptop, than share this over nfs like rootfs for my
 Zden?k> board... I'm correct?

Yes - Like it says in the documentation:

http://buildroot.net/buildroot.html#using

* target/ which contains almost the complete root filesystem for the
  target: everything needed is present except the device files in /dev/
  (Buildroot can't create them because Buildroot doesn't run as root and
  doesn't want to run as root). Therefore, this directory should not be
  used on your target. Instead, you should use one of the images built in
  the images/ directory. If you need an extracted image of the root
  filesystem for booting over NFS, then use the tarball image generated in
  images/ and extract it as root.

-- 
Bye, Peter Korsgaard
