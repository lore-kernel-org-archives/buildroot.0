From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 22 Sep 2010 20:52:20 +0000 (UTC)
Subject: [Buildroot] Building fw_printenv (u-boot utility) for target?
References: <i7decv$4q1$1@dough.gmane.org> <87ocbpa53t.fsf@macbook.be.48ers.dk>
Message-ID: <i7dqa4$sde$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-09-22, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Grant Edwards <grant.b.edwards@gmail.com> writes:
>
>> I want fw_printenv on my target, and it would be convenient if
>> buildroot built it and set up the relvent links.  But, AFAICT, I
>> can't have buildroot build the fw_printenv utility without having it
>> do a complete build of U-Boot.  I don't have any need/desire for
>> buildroot to build the bootloader itself, I only need the fw_printenv
>> linux app for the target.  Is that possible with buildroot?
>
> Currently not, is it a big deal to build u-boot as well?

Mainly it's a hassle because it adds quite a bit to the build time.

Currently, I change my rootfs far more often than I change the U-Boot
sources or configuration.  Doing a U-Boot rebuild every time I change
my root filesystem wastes a lot of time.

> The reason for this is mainly that fw_printenv isn't available
> seperately, so we would need to double quite a lot of the u-boot
> handling if we were to move it to a seperate package, and they are
> most of the time used together.

That makes sense.

>> Or should I just build fw_printenv separately and stick it into the
>> filesystem using the custom package?
>
> That's naturally an option as well.

I guess I'll stick with that.

Thanks.

-- 
Grant Edwards               grant.b.edwards        Yow! Do you guys know we
                                  at               just passed thru a BLACK
                              gmail.com            HOLE in space?
