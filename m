From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Apr 2019 22:37:30 +0200
Subject: [Buildroot] Possible conflict with systemd and e2fsprogs?
In-Reply-To: <df9e7287-f9b0-4381-6a04-3424ee752065@digineo.de>
References: <4dcaadcb-0ef8-887e-6681-1f326194315c@digineo.de>
 <7bb7a201-cdd2-7e66-deee-6175a264366c@mind.be>
 <1780e90c-9198-e9b6-5b38-9b27930337e2@digineo.de>
 <4e0cc833-814c-3cc6-deb3-6539a0f92f4f@mind.be>
 <b3efb298-2353-ce88-552b-34fbe26df110@digineo.de>
 <df9e7287-f9b0-4381-6a04-3424ee752065@digineo.de>
Message-ID: <6824ef05-10eb-d45a-4dd7-0fc75173473e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/04/2019 18:18, Dominik Menke wrote:
> [??? 4.547439] systemd-fsck[94]: /dev/mmcblk0p2: Superblock last write time (Mon
> Apr 29 17:37:11 2019,
> [??? 4.551637] systemd-fsck[94]:???? now = Thu Feb 14 11:11:59 2019) is in the
> future.

 My systemd-fu is not great, but it looks weird that now = somewhere in 2019 if
you have no RTC. I believe fsck has code to ignore the time-in-future check if
now ~ 1970.

 Regards,
 Arnout
