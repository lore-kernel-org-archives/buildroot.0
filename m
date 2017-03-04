From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 4 Mar 2017 11:47:34 -0300
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAOMZO5DtKGj3O_9p8H7ewbdq7ahTW=ZRCsVNcMZSGyz8Gxypyg@mail.gmail.com>
References: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
 <CAAMH-yvFAXjR1z_R4_+FRec2k=MEmg85hPvBLY4UT5mty7NKUg@mail.gmail.com>
 <CAD6G_RQi8Gwk1hjqxtE=RtZoKpz30aJS1GX59JAGeUu02OP=1g@mail.gmail.com>
 <CAAMH-ys=MpSuBvT=weVPKhyu5_bz4feq7ePmMN4LgHKubG_9vQ@mail.gmail.com>
 <CAD6G_RR5fC2n_JA=M1p3=0MeOwDXRVg2hQbhKDwHYmjyddu1SA@mail.gmail.com>
 <CAOMZO5B_d9-oq9R1NciG7F3A-HKhHVWP8uXzM=Crx2YB+zFVnw@mail.gmail.com>
 <CAD6G_RQZuqQphZqB0QwLKBC2Ox5G_tp06WTfUMEuOL6=LA2UvQ@mail.gmail.com>
 <CAOMZO5BWQvPFNevSp8Hjz4knfQ7kTYGmgXutoyzvb_ejq5AhpA@mail.gmail.com>
 <CAD6G_RSC9+NwdQP3qRA=wLWm2SaVNeN=zJXVR6P6dk8i+xLbxg@mail.gmail.com>
 <CAOMZO5BGTbB8WM-+oS9CoC8_3TPsZhyq1t-3=SJk1uAms8jBmQ@mail.gmail.com>
 <CAD6G_RRfwho6qwBU=QtyR6AsuNtGgWvvSFbTjwLwzv+9dqA6-Q@mail.gmail.com>
 <CAOMZO5Acb8RJZdf95uGj8w5LyhnjCh=sZoj=NE24wN_K2nO_OQ@mail.gmail.com>
 <CAD6G_RQNzT_yQfQeHW-VNE3vAhSnCRStc1R2NHrbkJwtHD=mzA@mail.gmail.com>
 <CAD6G_RSOBrZvE-4O_6uTj+0pBvsrM56p-48Rxd2hQZHtq8XkGw@mail.gmail.com>
 <CAOMZO5CBQVEMBLNgWRL947_uRpCDbyy5tTUVBfNjMkiwjyoA4Q@mail.gmail.com>
 <CAD6G_RQ3bLbJGi2jdRB-mafn4s=iHpvscjP+ggdBQG7_570ECA@mail.gmail.com>
 <CAD6G_RT58-HC8mi2g7Aq0x72uac0mUTA=HgoMAd1uAB-BWrXEQ@mail.gmail.com>
 <CAD6G_RQ_00ozMXZJ4GaTR5ETny-wJk6GkHbPSHLGQjiHUJR9dg@mail.gmail.com>
 <CAOMZO5AB2xYjvjQkvYp8y++M=95SnJSPbkPsv-sqs0VciYDd-w@mail.gmail.com>
 <CAD6G_RTyUUwWdMOy-9Tmam+uc=0UEJi9SjRBNypRw+x5UTgywg@mail.gmail.com>
 <CAAMH-ytkp7TDYwN12GJ=D-BXsyQg5ThD=3LCwyYwby-Rk+Vxig@mail.gmail.com>
 <CAOMZO5CufYJ7vqRw_7LxKpWtJe3Z-1U3=8SOubJXLgvNfO3Rew@mail.gmail.com>
 <CAOMZO5D5FB68ZWCqLd0HB14g3AQQRC556bgSXT-RznGB-xjqdA@mail.gmail.com>
 <CAAMH-yv5Ty14joyypR2oYOT+fYqi+VBtZWb7ES1ZAF7FaBG_nw@mail.gmail.com>
 <CAOMZO5DtKGj3O_9p8H7ewbdq7ahTW=ZRCsVNcMZSGyz8Gxypyg@mail.gmail.com>
Message-ID: <CAOMZO5DdsuQ29+KyMmvE8Ye5W2_a=-SZaCYKMP_MNoCHb07zaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On Sat, Mar 4, 2017 at 9:33 AM, Fabio Estevam <festevam@gmail.com> wrote:

> Not yet, still stuck at the "drmModeGetResources failed" error.

I can also get this same error with the new kmscube package from:
https://cgit.freedesktop.org/mesa/kmscube/log/

# kmscube
drmModeGetResources failed: Invalid argument
failed to initialize legacy DRM

It works if I explicitly pass the /dev/dri device:

kmscube -D /dev/dri/card1

I think QT5 is trying to access /dev/dri/card0, but it should be using
/dev/dri/card1 instead.
