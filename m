From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Feb 2019 19:21:01 +0100
Subject: [Buildroot] [PATCH 0/8] board/raspberrypi: post-image
 customisations.
In-Reply-To: <e5641c36-15cc-1a2e-7b86-1e41d7ec188b@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
 <bda143a4-0e98-773a-2eed-3cbbad26b7c5@mind.be>
 <413514e4-ab4a-9e64-3110-9bfb73bedb75@codethink.co.uk>
 <f1b3bf83-23a7-ea4f-c552-25d25824a0ab@mind.be>
 <e5641c36-15cc-1a2e-7b86-1e41d7ec188b@codethink.co.uk>
Message-ID: <20190211182101.GO3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2019-02-11 11:17 +0000, Robert Heywood spake thusly:
> On 08/02/2019 21:15, Arnout Vandecappelle wrote:
> >  Only, config.txt doesn't come from upstream; it comes from
> >package/rpi-firmware/config.txt and it says "we recommend you to change it to
> >fit your needs".
> >
> >  Okay, it goes on saying to override it in a post-build script, but that's
> >because there is no other way to put a file into genimage.cfg.
> >
> The package/rpi-firmware/config.txt file is downloaded from the raspberrypi
> github. While its true that the file won't change without someone updating
> the commit in the respective .mk file,

Absolutely not. The config.txt file *is* bundled in Buildroot.

> its not a file that buildroot
> maintains or authored. It is being pulled from upstream.

Yes it is, just do:  "git log package/rpi-firmware/config.txt"  and
you'll see that it is a file we have had since the inception of the
rpi-firmware package in Buildroot.

We may have used the upstream one as inspirtion, though.

> If you really wanted to keep separate versions of config.txt around for each
> board, genimage does support renaming files as it copies them into the
> image.
> You could feasibly add a line such as this to each cfg file;
>     file config.txt { image = "board/raspberrypi/config_raspberrypi0w.txt" }

Actually, I think this is a very good idea. But that is just my
position, others may disagree...

Again, you have to recognise that the defconfig files we have in
Buildroot are just basic configurations and setups, that are there just
to help one bootstrap a local build for a custom project/hobby/...

Again, my position is that, if one's project/hobby/... needs a custom
linux/uboot/firmware/etc... config file, then one should handle it
locally, using the files in Buildroot as inspiration.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
