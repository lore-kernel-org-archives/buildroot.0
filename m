From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 3 Sep 2014 11:38:25 +0200
Subject: [Buildroot] [PATCH 1/1] dos2unix: new package
In-Reply-To: <20140903092305.GC25921@sapphire.tkos.co.il>
References: <1409735578-25549-1-git-send-email-david.bachelart@bbright.com>
 <20140903092305.GC25921@sapphire.tkos.co.il>
Message-ID: <CAAXf6LXw1CEnkN0MZnZ+qDvX-E1HpZS5t_7Ggm1P-w8wHOmuBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 3, 2014 at 11:23 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi David,
>
> On Wed, Sep 03, 2014 at 11:12:57AM +0200, David Bachelart wrote:
>
> [snip]
>
>> diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
>> new file mode 100644
>> index 0000000..a976ffe
>> --- /dev/null
>> +++ b/package/dos2unix/dos2unix.mk
>> @@ -0,0 +1,40 @@
>> +################################################################################
>> +#
>> +# dos2unix
>> +#
>> +################################################################################
>> +
>> +DOS2UNIX_VERSION = 6.0.6
>> +DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix/
>> +
>> +DOS2UNIX_LICENSE = BSD-2c
>> +DOS2UNIX_LICENSE_FILES = COPYING.txt
>
> dos2unix is also provided by busybox. You need to list busybox in
> DOS2UNIX_DEPENDENCIES to make sure dos2unix builds (and installs) after
> busybox, overriding the busybox applet.
>

Additionally, a check on BUSYBOX_SHOW_OTHERS should be added somewhere.

Also, one could also argue whether it makes sense to have a separate
dos2unix target package, as I expect the tool to be so simple that
busybox probably does the same thing as the separate tool.

Best regards,
Thomas
