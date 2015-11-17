From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Nov 2015 10:11:26 +0000
Subject: [Buildroot] [PATCH] hidapi: new package
In-Reply-To: <20151116180724.GK9908@tarshish>
References: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151116180724.GK9908@tarshish>
Message-ID: <564AFD4E.2000301@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On 11/16/2015 06:07 PM, Baruch Siach wrote:
> Hi Vincent,
> 
> On Mon, Nov 16, 2015 at 04:54:12PM +0000, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> [...]
> 
>> +HIDAPI_DEPENDENCIES = libusb
>> +# When eudev is used as the udev provider, libgudev is automatically
>> +# provided as it is part of eudev. However, when systemd is used as the
>> +# udev provider, libgudev is not provided, and needs to be built
>> +# separately. This is why we select the libgudev package only if systemd
>> +# is used.
>> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> 
> Should be 'ifeq ($(BR2_PACKAGE_LIBGUDEV),y)', in think, since all we need is 
> to have libgudev built before this package, regardless of systemd. With this 
> change the comment becomes redundant. The comment in Config.in should be 
> enough.

we need libgudev only if we are going to use systemd. Otherwise it will
be provided by eudev.

Of course we could use ifeq ($(BR2_PACKAGE_LIBGUDEV),y) here, but, for
consistency with Config.in, I use ifeq ($(BR2_PACKAGE_SYSTEMD),y)
instead. See for instance the udisks package.

Regards,

Vincent.

>> +HIDAPI_DEPENDENCIES += libgudev
>> +endif
> 
> baruch
> 
