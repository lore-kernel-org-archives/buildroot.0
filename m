From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Oct 2011 09:04:34 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 4.44
In-Reply-To: <4E9B16D9.2070200@free-electrons.com> (Maxime Ripard's message of
 "Sun, 16 Oct 2011 19:39:37 +0200")
References: <20111015213701.E38898E24C@busybox.osuosl.org>
 <4E9A9A26.2050409@free-electrons.com>
 <2247f2bf1f89d0ba0b3eba6b94afe5d1@zacarias.com.ar>
 <4E9B16D9.2070200@free-electrons.com>
Message-ID: <8762jm4w71.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

Hi,

 Maxime> Also, how the mirror is generated ? At each release or at a given
 Maxime> frequency ? Because, in the first case, if a new version is released
 Maxime> between this commit and the release, we're screwed.

I try to update the mirror often. I used to do it manually, but now it's
done from a cronjob every Wednesday night.

We unfortunately don't have a good way of downloading ALL source
tarballs for all configuration possibilities so I do:

make allyesconfig; make source

for i in $(seq 50);
do
        make randconfig; make source
done

Which covers most, but not all.

-- 
Bye, Peter Korsgaard
