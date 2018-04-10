From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 10 Apr 2018 23:02:12 +0300
Subject: [Buildroot] [PATCH 1/1] python-fastentrypoints: new package
In-Reply-To: <CALFsTFWyq9tYd+qS+YG3KJ1smzkcNhMTO_D4-2QCVoyR1qUiDA@mail.gmail.com>
References: <20180409180403.11728-1-asafka7@gmail.com>
 <20180409210122.12173e62@windsurf>
 <CALFsTFWyq9tYd+qS+YG3KJ1smzkcNhMTO_D4-2QCVoyR1qUiDA@mail.gmail.com>
Message-ID: <CALFsTFXFgO0S49gJug+gJ1bGsNq16j56cpiLMpFMrN6Zdoz5dA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Is there anything new with my patch? Should I add/change something?

Thanks,
Asaf.

On Mon, Apr 9, 2018 at 10:47 PM, Asaf Kahlon <asafka7@gmail.com> wrote:

> Yes, of course.
>
> After the compilation of this package, you'll have an executable called
> fastep under $(HOST_DIR)/usr/bin.
> Then you can run fastep on a directory of a python package, and it'll
> speed up the console_scripts declared on your setup.py.
> What it really does is copying fastentrypoints,py to the directory, adding
> it to MANIFEST.in, and adding an import on setup.py, which is actually a
> monkey-patch.
>
> It can be very useful on systems with limited resources where importing
> pkg_resources can take a long time.
> If you want, you can even take it further and write pkg-fastep.mk. Then
> you can use it for the relevant python packages. It will add the needed
> dependency and run fastep on the package directory.
>
> Asaf.
>
> On Mon, Apr 9, 2018 at 10:01 PM, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> wrote:
>
>> Hello,
>>
>> On Mon,  9 Apr 2018 21:04:03 +0300, Asaf Kahlon wrote:
>> > host-package that is able to shorten the load time of entry_points
>> declared
>> > in setup.py of python packages.
>> >
>> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
>>
>> Thanks for this new version. Could you give some details on how you're
>> using this host package ? I.e what you are doing with it exactly ?
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180410/d91ba32e/attachment.html>
