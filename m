From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 26 Sep 2013 11:34:02 +0200
Subject: [Buildroot] Using source inclusions in defconfig
In-Reply-To: <CAJpxd04ok1Eu_kERG1UQy=y4ixUWcz-YZJujx=SnJysJThtOaA@mail.gmail.com>
References: <CAJpxd04ok1Eu_kERG1UQy=y4ixUWcz-YZJujx=SnJysJThtOaA@mail.gmail.com>
Message-ID: <CAAXf6LV8fu30gj5fuoMJEGjgrem-jM2RQj32m+Kd7ox1==oY7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bryce,

On Thu, Sep 26, 2013 at 2:47 AM, Bryce Schober <bryce.schober@gmail.com> wrote:
> It looks to me like the "source" command doesn't work in defconfigs. I get
> "warning:: unexpected data", and it doesn't include the referenced config.
>
> Is this a generic limitation, or an artifact of my ancient buildroot?
>
> It sure would be nice to modularize defconfigs for my target variants...

This is not buildroot-specific, it is kconfig that does not support
it. The same behavior is present in the most recent buildroot version.

This question/feature request has come up in the past. One idea is to
pre-process the config yourself with a script before running
buildroot. Basically this would be 'cat config1 config2 config3 >
configs/my_board_defconfig' followed by 'make my_board_defconfig'.
This works, but the biggest problem that I see is: how to save your
configuration back after you made changes. Since there is no record of
which original config file contained a given symbol, where should the
new value be written? You can easily generate the accumulated
defconfig, but then you'd have to manually split it up again into the
original files.

Best regards,
Thomas
