From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 2 Sep 2015 11:14:59 +0100
Subject: [Buildroot] [PATCHv2 1/2] udisks: bump to version 1.0.5
In-Reply-To: <20150902101033.GY17874@tarshish>
References: <1441188349-13079-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150902101033.GY17874@tarshish>
Message-ID: <55E6CC23.2090502@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On 09/02/2015 11:10 AM, Baruch Siach wrote:
> Hi Vincent,
> 
> On Wed, Sep 02, 2015 at 11:05:48AM +0100, Vicente Olivert Riera wrote:
>> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>> +UDISKS_CONF_OPTS += libgudev
>> +endif
> 
> So libgudev is not even an optional dependency when there is no systemd?

Well, it wasn't there before, so... Anyway, the default is not to add
every optional dependency in the .mk, and let the users who really need
them to send a patch to do it.

> In any case, a comment explaining this unusual dependency would be nice.

Well, I have copied the output of the error you will face if you don't
depend on libgudev when using systemd. Do you think it's also necessary
in the Config.in and udisks.mk file as well? I don't mind doing it if
you think it is.

Regards,

Vincent.

> 
> baruch
> 
