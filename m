From: Thierry Bultel <tbultel@free.fr>
Date: Thu, 19 Feb 2015 16:46:09 +0100
Subject: [Buildroot] Fwd: Re:  grub2 failure with gcc-4.9
In-Reply-To: <54D3BA06.3050909@ou.edu>
References: <54D39F5A.2010403@ou.edu> <54D3BA06.3050909@ou.edu>
Message-ID: <54E60541.3030801@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 05/02/2015 19:44, Steve Kenton a ?crit :
> Oops, hit reply instead of reply-all
>
> On 02/05/2015 10:16 AM, Thomas Petazzoni wrote:
>>  Dear Thierry Bultel,
>>
>>  On Thu, 05 Feb 2015 17:15:13 +0100, Thierry Bultel wrote:
>>
>>>  With gcc-4.9 from Ubuntu
>>>
>>>  (in grub2.mk, I set TARGET_CC="/usr/bin/gcc" \
>>>      TARGET_CFLAGS="-m32" \
>>>  )
>>>
>>>  ... grub hangs.
> I'm not sure if it's related but I think we are mixing host and
> target grub2. When you run ~output/host/usr/sbin/grub-install
> any scripts it runs such as grub-mkimage are run from the
> build hosts /usr/... and not buildroot HOSTDIR or TARGETDIR
> I have been getting elf header mismatches which I think are
> differences between grub 2.00 and grub 2.01-beta

Thanks Steve,

FYI,
I am not using grub-install, but instead:

sudo ./host/usr/sbin/grub-bios-setup \
-b ./host/usr/lib/grub/i386-pc/boot.img \
-c ./images/grub.img -d . /dev/sde

I have notified the grub mailing list, this seems to be an unknown issue 
and I need to fill a bug report. (and first try with 2.01-beta ...)

Thierry

>
> Steve Kenton
>
>
>>
>>  Seems like you're good for a bug report to the upstream project. I
>>  checked their Git repo, there is a gcc 4.9 fix but specific for ARM
>>  issues. I haven't seen any other commit mentioning "4.9".
>>
>>  You may want to try with their latest Git version first, though, just
>>  in case the problem was fixed but not mentioned explicitly in a commit
>>  log.
>>
>>  Best regards,
>>
>>  Thomas
>>
>
>
