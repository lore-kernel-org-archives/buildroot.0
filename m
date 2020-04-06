From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 6 Apr 2020 13:59:19 +0200
Subject: [Buildroot] [Question] How do I build source code at source
 folder?
In-Reply-To: <CAF6vTZbE4r1z0c4jSUy3g+C+nKgskdOdMp1XLSpUpZz16NC8XA@mail.gmail.com>
References: <1585904837068-0.post@n4.nabble.com>
 <CAEyMn7bt=wUY=RLDSE=QAD8F+ap5K4rRaB12Rs1SgjmOSeN_CQ@mail.gmail.com>
 <CAF6vTZZctgOOnqcseZ5-UVGQbg2baC8Le4qazOZ2rFpdH_3tcw@mail.gmail.com>
 <CAEyMn7ZJ1DUfmncko0ZOhdha9Ec9bN4F3ud=KBYF3yMJAW0g_w@mail.gmail.com>
 <CAF6vTZbE4r1z0c4jSUy3g+C+nKgskdOdMp1XLSpUpZz16NC8XA@mail.gmail.com>
Message-ID: <CAEyMn7ZpajO5S_u8P=iD8tG37UY3U1OO9=e3r20eik0D+CCAdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Psychesnet, All,

Am Sa., 4. Apr. 2020 um 15:24 Uhr schrieb Psychesnet Hsieh
<psychesnet@gmail.com>:
>
> Hi Heiko,
>
> From previous and some projects, we would like to build 3 kinds of source code in our code base.
> 1. Directly build from open source, like lighttpd and ffmpeg. Basically, we don't need to change this a lot.
>     Put some patches and apply menuconfig to select enable/disable it. Anything is good. This one, Buildroot can help a lot.
> 2. Some binary code/source code from vendor/SDK. This one is familiar to open source, we don't need to change a lot, too.
>     Follow SDK instructions and apply patch to Buildroot is enough to get anything done.
> 3. Source code from our side, this part we change a lot and we would like to build it at source folder because
>     A. We change git log at source folder, we can trace anything quickly, don't need to switch folder to build.
>     B. We can build one source code instead of check anything, it is faster to build(makefile check dependency) and install into fakeroot folder to try.
>     C. We won't forget to commit the code, because any operations at source folder.
>
> I believe buildroot is the best for small embedded system, and we would like to try if we can get item 3 done in our project.
> I hope anything is clear. Thanks.

Sorry but I don't see why using the proposed <pkg>_OVERRIDE_SRCDIR
will solve the things you want to achieve in item 3.

-- 
Heiko
