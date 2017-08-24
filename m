From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 24 Aug 2017 14:33:30 -0700
Subject: [Buildroot] [PATCH] package/rpcbind: Do not mark .service and
 .socket files executable
In-Reply-To: <20170824231314.73e54f07@windsurf>
References: <20170823234414.3326-1-andrew.smirnov@gmail.com>
 <20170824231314.73e54f07@windsurf>
Message-ID: <CAHQ1cqHU_kd=UhrFJ-1m=-4LHiL5g29FFP=UzdTVcGStXexkXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 24, 2017 at 2:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 23 Aug 2017 16:44:14 -0700, Andrey Smirnov wrote:
>> Do not mark .service and .socket files executable, otherwise systemd
>> will give us a warning about it.
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  package/rpcbind/rpcbind.mk | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Applied to master, thanks. However, we have a few other packages also
> installing .service as 755:
>
> package/minidlna/minidlna.mk:   $(INSTALL) -D -m 0755 package/minidlna/minidlnad.service \
> package/nss-pam-ldapd/nss-pam-ldapd.mk: $(INSTALL) -m 755 -D package/nss-pam-ldapd/nslcd.service \
> package/transmission/transmission.mk:   $(INSTALL) -D -m 0755 $(@D)/daemon/transmission-daemon.service \
>
> Perhaps we want to fix those as well ?

Yeah, makes sense. I wasn't using any of those packages so I missed
them. I'll send follow up patches shortly.

Thanks,
Andrey Smirnov
