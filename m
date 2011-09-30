From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 30 Sep 2011 22:02:01 +0200
Subject: [Buildroot] [PATCH 1 of 3] linux: add linux-update-config and
 linux-update-defconfig targets
In-Reply-To: <20110930215632.31a189f7@skate>
References: <patchbomb.1317151268@localhost6.localdomain6>
 <81756817dc47990f5c42.1317151269@localhost6.localdomain6>
 <20110927224603.02a7e0b1@skate>
 <CAAXf6LV-4mRjrR58E2RJ2pEEocH5b08n_9YdEi8pp8U9fqjjRw@mail.gmail.com>
 <20110930215632.31a189f7@skate>
Message-ID: <CAAXf6LUF6FZV5qQprMsAgJ1SLc=MdH8ZYrtpmOz-QofZxe5xOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 30, 2011 at 9:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 28 Sep 2011 08:08:12 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> > ?* Whether this configuration update shouldn't be done automatically
>> > ? when one does "make linux-menuconfig" or "make linux-xconfig".
>> > ? People have often found strange to loose their configuration changes
>> > ? in Linux/Busybox/uClibc when they do a make clean.
>>
>> Such a feature would be good indeed. But, some remarks:
>> * hooking it to menuconfig/xconfig wouldn't cover the case where the
>> .config is manually changed. This different behavior may be confusing
>> as well.
>
> Correct, even though manually changing the .config is a bit of a corner
> case.
>
>> What if we execute the automatic saving just before the build step?
>> This of course requires to start building; you cannot just change the
>> config and hope that it is copied automatically. In that last case, a
>> manual linux-update-config would be necessary.
>> Is this acceptable?
>
> Yes, sounds good.
>
>> * previously you raised the point of busybox-update / uclibc-update
>> potentially overwriting the standard buildroot files. If we do not
>> want this and we want automatic saving of custom configs, then we need
>> to be able to differentiate between custom and default configuration
>> files.
>> On the other hand, if there are users that purposefully put their
>> project's configuration in the default files (overwriting them), then
>> they would not be able to benefit from the automatic saving, and
>> possibly not from -update-config either. But I'm not sure if we ought
>> to support such practice...
>
> Maybe we can change a bit the selection of the Busybox/uClibc
> configuration file. We could do something like:
>
> ?[X] Use default Busybox configuration file
>
> in which case Busybox would use the default configuration file
> integrated in Buildroot.
>
> If this option is disabled:
>
> ?[ ] Use default Busybox configuration file
> ?(/some/path/busybox.config) Path to Busybox config file
>
> then Buildroot uses the specified configuration file.
>
> With this change, busybox-config-update would output an error if the
> default config file is used and would work properly if a specific
> config file is given.
>
> What do you think?
>

Sounds good to me!
I'm currently a bit busy with switching toolchains, so this will be
somewhat delayed. (Unless you have spare time, in which case you are
free to jump in)

Thanks,
Thomas
