From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 14 Apr 2017 15:18:46 +0200
Subject: [Buildroot] [PATCH 3/5] package/efl: bump to version 1.19.0
In-Reply-To: <20170414150721.51546fcc@free-electrons.com>
References: <20170414121345.10026-1-romain.naour@gmail.com>
 <20170414121345.10026-3-romain.naour@gmail.com>
 <20170414150721.51546fcc@free-electrons.com>
Message-ID: <4919d677-56ed-3b8d-270d-721188989281@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 14/04/2017 ? 15:07, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Fri, 14 Apr 2017 14:13:43 +0200, Romain Naour wrote:
>> Systemd is now enabled by default and handle newly introduced
>> vnc-server and net-control options.
> 
> This wording is quite confusing. You're saying "Systemd is not enabled
> by default"... but all your package .mk file does is pass
> --disable-systemd.
> 
> If I understood correctly, you want to say:
> 
> "This new version of the EFL enables systemd support by default.

Yes exactly, except that we currently support systemd for the target.

So we have to disable systemd for the host variant since we don't have
host-systemd and enable systemd support if the user build a target system using
systemd.

 Since
> we don't support systemd for EFL in Buildroot at the moment, we
> therefore pass an additional --disable-systemd option".
> 
> Same thing when you say "handle newly introduced ... options".

ok.

Do you want me to respin all the series or do you want to apply the two first
patches ?

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
