From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 13 May 2015 23:18:35 +0200
Subject: [Buildroot] [PATCH] package/gcc (arc): backport PR56780 patches
In-Reply-To: <1431550090.3047.11.camel@synopsys.com>
References: <1431380716-5176-1-git-send-email-romain.naour@openwide.fr>
 <1431550090.3047.11.camel@synopsys.com>
Message-ID: <5553BFAB.4010107@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

Le 13/05/2015 22:48, Alexey Brodkin a ?crit :
> Hi Romain,
> 
> On Mon, 2015-05-11 at 23:45 +0200, Romain Naour wrote:
>> --disable-install-libiberty configure option is broken
>> in gcc 4.8.x, so libiberty.a is always installed in HOST_DIR.
>>
>> This library broke the host-gdb build due to a fpic/fPIC issue.
>>
>> Note: host-binutils-arc-2014.12 install libiberty.a in HOST_DIR
>> but it was overwritten by the gcc one. The host-binutils's
>> libiberty.a also broke the host-gdb build. This should be
>> fixed in a followup patch.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Cc: Alexey Brodkin <abrodkin@synopsys.com>
>> ---
>> Alexey, --disable-install-libiberty doesn't work
>> for host-binutils-arc-2014.12. Can you have a look ?
>> Thanks
> 
> Indeed our binutils are still based on 2.23 branch and corresponding
> patches were missing.
> 
> What I did I just copied your "851-PR-other-56780.patch" to
> "package/binutils/arc-2014.12" folder and on host-binutils rebuild no
> libiberty.a was put in "host/usr/lib64".
> 
> Care to send another patch that adds "851-PR-other-56780.patch" to
> "package/binutils/arc-2014.12" or should I do it myself?

Thank you for your reply.
I just looked at it this evening, and figured out that was the same issue.
I'll sent a patch rebased on arc-2014.11 tag to apply cleanly.

Best regards,
Romain
> 
> -Alexey
> 
