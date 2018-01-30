From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 30 Jan 2018 08:43:00 +0100
Subject: [Buildroot] [RFC] scanpypi: handle packages with wrong metadata
In-Reply-To: <20180129231908.4bf07275@windsurf.lan>
References: <1516973570-7732-1-git-send-email-yegorslists@googlemail.com>
 <20180129231908.4bf07275@windsurf.lan>
Message-ID: <CAGm1_ktLfLxd+5hVKF+0CkqvJ4_WNF9+L2mBcS9EKvCA3Gt8kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 29, 2018 at 11:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 26 Jan 2018 14:32:50 +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Some packages like python-adafruit-ads1x15 have different values in
>> PyPI metadata and setup.py or tar file name.
>>
>> Use package name (self.pkg_name) derived from tar file name instead
>> of metadata_name taken from JSON.
>>
>> Also output the missing key when trying to setup arguments.
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
> Do we really want to do this? Shouldn't we instead ask the upstream
> maintainers to fix their Python package? I have the feeling that this
> is a slippery road, and we could start adding lots and lots of weird
> logic to support packages with wrong metadata.

That's why I sent it as RFC. I've filed an issue [1], but I doubt it
will be fixed.

> If it's only fixing one specific package, I'd say the script should
> instead detect the inconsistency, and bail out.

I'll do it.

[1] https://github.com/adafruit/Adafruit_Python_ADS1x15/issues/9

Yegor
