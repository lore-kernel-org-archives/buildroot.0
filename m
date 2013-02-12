From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 12 Feb 2013 12:49:15 +0100
Subject: [Buildroot] Report from the Buildroot Developers Meeting
In-Reply-To: <20130212113628.00ce121d@skate>
References: <20130209004253.207e0741@skate> <511A19A8.4020307@relinux.de>
 <20130212113628.00ce121d@skate>
Message-ID: <511A2C3B.70604@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.02.2013 11:36, schrieb Thomas Petazzoni:
> Dear Stephan Hoffmann,
>
> On Tue, 12 Feb 2013 11:30:00 +0100, Stephan Hoffmann wrote:
>

>>> Switching to ct-ng as the default toolchain backend has been in the
>>> plans for several years. But since it's not the default backend it
>>> isn't getting a lot of attention (example: for several months it was
>>> broken, libraries were not copied to the target, and it took a lot
>>> of time for somebody to notice). 
>> Regarding the toolchain I want to say that I really like buildroot's
>> ability to build a toolchain.
>>
>> But I hate the fact that after every "make clean" the toolchain has to
>> be rebuilt completely from scratch which takes precious time.
>>
>> Of course there is the possibility to change the output directory,
>> build the toolchain and then use it as an external toolchain, but
>> this breaks the nice integration between buildroot and it's toolchain
>> and is not really comfortable.
>>
>> What about automating this process by splitting it up into building
>> the toolchain and afterwards copying it to output/{host/staging} like
>> it is done with external toolchains? "make clean" or maybe something
>> new like "make almostclean" would not clean the toolchain build
>> directory, so only the copy stage would be repeated. Another make
>> target to clean everything including the toolchain would be needed,
>> of course.
> Why don't you build your external toolchain once, put it in a tarball,
> and then point Buildroot to it?
Because, as I wrote, I like the concept to have it integrated in
buildroot's configuration.
>  You have to do this only once, and you
> can even put your toolchain tarball on a server so that others can use
> it without having to rebuild the toolchain.
>
What's the advantage of your proposal against using ct-ng to build the
toolchain or use a prepared one from somewhere else?

Kind regards

Stephan

>
> Best regards,
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
