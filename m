From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Apr 2016 06:21:56 +0200
Subject: [Buildroot] [PATCH v2 2/2] buildroot-test: failure reason regex
 update
In-Reply-To: <CAFt09wPOrjY0V6Jp3jCD1C084zpExqoS1Jpp88ujN93=ucORCQ@mail.gmail.com>
References: <1459468972-31420-1-git-send-email-matt@thewebers.ws>
 <1459468972-31420-2-git-send-email-matt@thewebers.ws>
 <20160401035503.6f83bb24@free-electrons.com>
 <CAFt09wNVPNa0aekpxdhZxOOLRgSdKUZQivMVz195FJhfO9exwA@mail.gmail.com>
 <20160401055834.5b7b6226@free-electrons.com>
 <CAFt09wPOrjY0V6Jp3jCD1C084zpExqoS1Jpp88ujN93=ucORCQ@mail.gmail.com>
Message-ID: <20160401062156.6894001b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Mar 2016 23:04:57 -0500, Matthew Weber wrote:

> make[1]: *** [/opt/buildroot_testing/buildroot-test/instance-0/output/build/host-vboot-utils-bbdd62f9b030db7ad8eef789aaf58a7ff9a25656/.stamp_built] Error 2
> Makefile:36: recipe for target '_all' failed
> make: *** [_all] Error 2
> make: Leaving directory '/opt/buildroot_testing/buildroot-test/instance-0/buildroot'

Weird, this is this last line that I don't see here:

make[1]: *** [/home/thomas/projets/outputs/toto/build/makedevs-buildroot-2016.05-git/.stamp_built] Error 127
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

But on the other hand,
http://autobuild.buildroot.org/results/b55/b5539c22ee35a36ae3fe4967040ea04b11889a4c/build-end.log
has this last line, but doesn't have the "recipe for target ... failed"
line.

Oh well, I guess I'm just going to take your patch as-is. Maybe some
make guru like Arnout will have a good explanation for those
differences, but it's not important enough to spend too much time on
this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
