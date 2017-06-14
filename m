From: denisebrise <cash.debrice@gmail.com>
Date: Wed, 14 Jun 2017 05:11:04 -0700 (PDT)
Subject: [Buildroot] XWindow Browser, anyone ?
In-Reply-To: <20111219145326.226d43f1@skate>
References: <CAOrUntZhzjati0cHKQp0s=ov-eoLaeGDjz987qjSZ=1ZMFYA-A@mail.gmail.com>
 <20111219145326.226d43f1@skate>
Message-ID: <1497442264883-167534.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am currently working on Buildroot 2015.11.1 and using Midori as web
browser on my target (IMX6). However, this web browser is not fully
compatible with NoVNC : Midori can display remote screen, but not interact
with mouse click.

My first idea was to add chromium package (from :
https://gfiber.googlesource.com/buildroot/+/master/package/chromium/), but I
am stucked as from the beginning :

	make chromium
	make[1]: *** No rule to make target `chromium'.  Stop.
	make: *** [_all] Error 2

same probleme with two of it's dependencies :

	make bcm-commonm
	make[1]: *** No rule to make target `bcm-common'.  Stop.
	make: *** [_all] Error 2

	make bcm-rockford
	make[1]: *** No rule to make target `bcm-rockford'.  Stop.
	make: *** [_all] Error 2

When looking in chromium.mk, I found this line :

	CHROMIUM_SITE=rrepo://chromium

same thing for bcm_common and bcm_rockford :

	BCM_COMMON_SITE=repo://vendor/broadcom/common
	BCM_ROCKFORD_SITE=repo://vendor/broadcom/rockford

I think it is related to my problem, but I have no idea on how to replace
these lines ?

I would enjoy any help or solution with another compatible browser



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/XWindow-Browser-anyone-tp16075p167534.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
