From: Steve Kenton <skenton@ou.edu>
Date: Thu, 05 Feb 2015 12:44:22 -0600
Subject: [Buildroot] Fwd: Re:  grub2 failure with gcc-4.9
In-Reply-To: <54D39F5A.2010403@ou.edu>
References: <54D39F5A.2010403@ou.edu>
Message-ID: <54D3BA06.3050909@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops, hit reply instead of reply-all

On 02/05/2015 10:16 AM, Thomas Petazzoni wrote:
>  Dear Thierry Bultel,
>
>  On Thu, 05 Feb 2015 17:15:13 +0100, Thierry Bultel wrote:
>
>>  With gcc-4.9 from Ubuntu
>>
>>  (in grub2.mk, I set TARGET_CC="/usr/bin/gcc" \
>>  	TARGET_CFLAGS="-m32" \
>>  )
>>
>>  ... grub hangs.
I'm not sure if it's related but I think we are mixing host and
target grub2. When you run ~output/host/usr/sbin/grub-install
any scripts it runs such as grub-mkimage are run from the
build hosts /usr/... and not buildroot HOSTDIR or TARGETDIR
I have been getting elf header mismatches which I think are
differences between grub 2.00 and grub 2.01-beta

Steve Kenton


>
>  Seems like you're good for a bug report to the upstream project. I
>  checked their Git repo, there is a gcc 4.9 fix but specific for ARM
>  issues. I haven't seen any other commit mentioning "4.9".
>
>  You may want to try with their latest Git version first, though, just
>  in case the problem was fixed but not mentioned explicitly in a commit
>  log.
>
>  Best regards,
>
>  Thomas
>
