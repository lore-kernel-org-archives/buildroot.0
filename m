From: Christian Stewart <christian@paral.in>
Date: Sat, 1 Aug 2020 17:33:48 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/rtl8821au: add patch fixing
 sprintf error
In-Reply-To: <CA+h8R2qz5aRa5DrkXcN+0Cca_vysEUdLQK+nAN1WMNg3dR08yA@mail.gmail.com>
References: <20200801203749.424827-1-christian@paral.in>
 <20200801233410.6ec574ce@gmx.net>
 <CA+h8R2qz5aRa5DrkXcN+0Cca_vysEUdLQK+nAN1WMNg3dR08yA@mail.gmail.com>
Message-ID: <CA+h8R2oApXa_RjDPxNXK65S6SNZXgyXvBnEBUy3RuR9BZA=xNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, Aug 1, 2020 at 2:51 PM Christian Stewart <christian@paral.in> wrote:
>
> Hi Peter,
>
>
> On Sat, Aug 1, 2020, 2:34 PM Peter Seiderer <ps.report@gmx.net> wrote:
>>
>> maybe its worth to try some other 'upstream' sources, e.g. as
>> openSUSE [4] does (mentioning previous [5] and [6]), or the first
>> google search result [7] (did not find the time to dig into the
>> different repositories to find out which one is the best)...
>
>
> We've been through a number of these over the years. I would not recommend switching to another unless there's a specific reason. As far as I know the current configuration/upstream works fine with USB RTL cards.

See: https://github.com/paralin/buildroot/commit/af8d30846e71e378fdcdb632bbbbfe0aaf7bb669

Just out of curiosity I made a patch switching to the aircrack fork,
but there were some errors at the install step, for example:

depmod: WARNING: /target/lib/modules/4.14.180/extra/88XXau.ko needs
unknown symbol cfg80211_unlink_bss
depmod: WARNING: /target/lib/modules/4.14.180/extra/88XXau.ko needs
unknown symbol ieee80211

Even though the CFG80211 options are enabled in the kernel, and the
build passes with the old fork.

Maybe there are some path issues going on there.

Looks like the aircrack fork may have better support for packet injection?

Best,
Christian
