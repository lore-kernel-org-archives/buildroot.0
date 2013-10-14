From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Oct 2013 16:02:48 +0200
Subject: [Buildroot] Help with selecting package
In-Reply-To: <525BED56.5030704@gmail.com>
References: <525BAB59.4020105@gmail.com> <20131014114754.12f56017@skate>
 <525BCC9C.9020602@gmail.com> <20131014134753.33a41074@skate>
 <525BED56.5030704@gmail.com>
Message-ID: <CAAXf6LXB8+5bjhZ3Y0ftNR0aQVK8Rvge_YDq-KvhfpORO8LPMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Mon, Oct 14, 2013 at 3:10 PM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Il 14/10/2013 13:47, Thomas Petazzoni ha scritto:
>
>> make linux-menuconfig See
>> http://buildroot.org/downloads/manual/manual.html#kernel-custom.
>
>
>
> Ok, but as far as I know the linux.config file contains all the available
> parameters.The active ones are set to "y" otherwise are commented out.
> In the current linux.config there is no CONFIG_VIDEOBUF_GEN item at all.

Not all available options are present in .config. It is possible that
CONFIG_VIDEOBUF_GEN depends on another option that is not selected.

>
> Anyway I searched for suitable items in linux-menuconfig but the name of the
> menu could be different... Is there a table where each CONFIG_ item is
> translated into the linux-menuconfig one? There are so many options one
> cannot try in a random way :-)

The best way in this case is to open the linux-menuconfig, type /
(slash) followed by a search string, for example VIDEOBUF_GEN. It
should show you at least one match, along with more details about:
- where is it in the menu structure
- which options does it depend on (and what is the current value of
these options, indicated with [=y], [=n] etc.

This should give you enough info to be able to select the option correctly.

Best regards,
Thomas
