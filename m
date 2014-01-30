From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 30 Jan 2014 12:00:12 +0100
Subject: [Buildroot] Project layout : where to put the .config files
In-Reply-To: <1837704479.4894137.1391078566256.JavaMail.root@openwide.fr>
References: <CAAXf6LVcyT1O41enwqPrWLuY0Mz8yO2Wn8kX=3NviVWEHtw7Dg@mail.gmail.com>
 <1837704479.4894137.1391078566256.JavaMail.root@openwide.fr>
Message-ID: <CAAXf6LUcwANH_uY2ZxxMiaOBbJ=JUHF4LZF_NoXOFJYMow=cXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

On Thu, Jan 30, 2014 at 11:42 AM, Jeremy Rosen <jeremy.rosen@openwide.fr> wrote:
> Thomas, All
>
>>
>> I find it a strange strategy to put .config in git: this is why we
>> have the configs/ directory, and a target 'make savedefconfig' to
>> store the .config configuration in a defconfig file. If you don't
>> like
>> defconfigs, you can still copy .config directly in the configs/
>> subdirectory.
>>
>> Best regards,
>> Thomas
>>
>
> This is my own little project I am building here it is not a new
> board I am trying to support. I have been bitten multiple times
> by .config not being saved until I do a savedefconfig. savedefconfig
> should not be a "my change are good let's validate" step. That's
> what git commit is for.
>
> Defconfigs are a great way to define templates for a board and
> distribute them with buildroot, but when you are building a final
> product they are not the right tool.

This is probably personal, but I don't agree. The configs directory is
not limited to 'templates'. This may be the upstream strategy, but in
the repository for a particular project you are free to add one or
more full configs for that project.

>
> In particular the fact that you have to do a savedefconfig before
> any git commit is very error prone. moreover savedefconfig won't
> warn you if defconfig has been modified by a pull and will overwrite
> it.
>
> This is even worse for the kernel/busybox case where the config
> files are hidden in output/build/xxx/.config

You you could make a mistake, but in my experience mistakes the other
way around also happen: you accidentally commit a change to .config
that was just for test. This may be fine for your personal repo, but
in a work environment it's not very nice at all, especially if this is
realized only much later.

You could create commit hooks to verify that the .config files are in
line with the actual version-controlled versions, I guess.

Note again: this is just my opinion...

Best regards,
Thomas
