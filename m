From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 6 Nov 2017 14:10:21 +0300
Subject: [Buildroot] [PATCH v2] orange-pi-zero: misc updates
In-Reply-To: <CAMty3ZAH2GJVU84vm5VCRyR3VRq6anrvtM5sdz26xnrSC_QG9Q@mail.gmail.com>
References: <20171106101652.28861-1-geomatsi@gmail.com>
 <CAMty3ZAH2GJVU84vm5VCRyR3VRq6anrvtM5sdz26xnrSC_QG9Q@mail.gmail.com>
Message-ID: <20171106111021.xese5w5rapzsht5s@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> It would be good if you update or write some readme on board dir,
> about how to test wifi

Well, when all the ingridients are enabled (wireless core drivers, xradio
driver, xr819 firmware, and mdev), all the needed kernel modules are
autoloaded on boot and wlan0 interface becomes available. That was the
purpose of the patchset: to enable WiFi right after boot w/o any
additional efforts like loading modules manually or looking for firmware
and uploading it to the board.

All you need to do after boot is to start wpa_supplicant with proper config,
or perform scan or any other operations using iw tool. However I don't think
it makes sense to describe WiFi STA/AP setup in the board readme.txt.
There are plenty of good sources for that, e.g. wireless.wiki.kernel.org.

Regards,
Sergey
