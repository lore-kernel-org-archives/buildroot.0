From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 15 Sep 2020 22:54:07 +0200
Subject: [Buildroot] [PATCH] package/nginx: use /run for PIDFile
In-Reply-To: <20200915222532.5dcba8fc@windsurf.hq.k.grp>
References: <20200915194958.658-1-buildroot@heine.tech>
 <20200915222532.5dcba8fc@windsurf.hq.k.grp>
Message-ID: <acfd27d5-31af-4324-317e-feb038da8eca@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 15.09.20 22:25, Thomas Petazzoni wrote:
> Hello,
>
> On Tue, 15 Sep 2020 21:49:56 +0200
> Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:
>
>> Fixes:
>>
>> systemd[1]: /usr/lib/systemd/system/nginx.service:7: PIDFile= references
>> a path below legacy directory /var/run/, updating /var/run/nginx.pid ?
>> /run/nginx.pid; please update the unit file accordingly.
>>
>> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> Thanks for this. Does this means we also need to fix:
>
> $ git grep PIDFile=/var *
> package/bandwidthd/bandwidthd.service:PIDFile=/var/run/bandwidthd.pid
> package/dhcpcd/dhcpcd.service:PIDFile=/var/run/dhcpcd.pid
> package/htpdate/htpdate.service:PIDFile=/var/run/htpdate
> package/minidlna/minidlnad.service:PIDFile=/var/run/minidlna/minidlna.pid
> package/nginx/nginx.service:PIDFile=/var/run/nginx.pid
> package/nss-pam-ldapd/nslcd.service:PIDFile=/var/run/nslcd/nslcd.pid
> package/openvmtools/vmtoolsd.service:PIDFile=/var/run/vmtoolsd.pid
> package/postgresql/postgresql.service:PIDFile=/var/lib/pgsql/postmaster.pid

i don't use any of those packages. So i didn't get warnings for them. 
But it would make sense.
I ran into the issue that systemd removed /var/lock entirely with the 
version in BR 2020.08. So this might happen to /var/run in the future as 
well.

Should I throw this together into one single patch?


Regards,
Michael
