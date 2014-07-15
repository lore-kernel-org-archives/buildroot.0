From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 15 Jul 2014 20:33:47 +0200
Subject: [Buildroot] [PATCH 6 of 6] uclibc: update-config: preserve
	freshly configured settings
In-Reply-To: <53C40DC8.8000607@mind.be>
References: <patchbomb.1405338624@localhost>
 <82c951fdcf4851185bcc.1405338630@localhost>
 <53C40DC8.8000607@mind.be>
Message-ID: <CAAXf6LXaJFF+N6tGAcgY7mpYmBJg=cE0F7eOxvh+eba_83xY4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Jul 14, 2014 at 7:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 14/07/14 13:50, Thomas De Schampheleire wrote:
>> In the sequence:
>>
>> make uclibc-menuconfig
>> make uclibc-update-config
>>
>> the freshly configured settings from the menuconfig are lost during the
>> update-config step. This is because update-config depends on the configure
>> step, which starts by copying the config file to the build directory.
>>
>> Instead, stop depending on the configure step from update-config, and
>> introduce a new stamp file .stamp_config_fixup_done, which applies any
>> fixups on the .config file.
>
>  I think the commit message should explain why this stamp file is preferred over
> repeating the fixup in each target.
>

I'm trying to come up with good reasons here, but the only real one I
can find is to avoid duplicating code and avoid redoing the fixup
unnecessarily.

Did you have anything else in mind?

Best regards,
Thomas
