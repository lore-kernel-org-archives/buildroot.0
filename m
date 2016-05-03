From: Martin Bark <martin@barkynet.com>
Date: Tue, 3 May 2016 10:00:37 +0100
Subject: [Buildroot] [PATCH 5/5] package/nginx: fix error is
	nginx.service
In-Reply-To: <20160501234746.084c2e61@free-electrons.com>
References: <1462132345-28253-1-git-send-email-martin@barkynet.com>
 <1462132345-28253-5-git-send-email-martin@barkynet.com>
 <20160501234746.084c2e61@free-electrons.com>
Message-ID: <CAFGQKxd47yDZ8O+eXNHR8q=nStrBNsAg=vsNgqiWda7prjfXDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 1 May 2016 at 22:47, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun,  1 May 2016 20:52:25 +0100, Martin Bark wrote:
>
>> -ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx; /usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
>> +ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx ; /usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
>
> Isn't:
>
> ExecStartPre=/usr/bin/mkdir -p /var/log/nginx /var/tmp/nginx
> ExecStartPre=/usr/sbin/nginx -t -q -g 'pid /var/run/nginx.pid; daemon on; master_process on;'
>
> a better solution?

Yes you are right, that will work and i agree it looks neater.  I'll
update the patch and resubmit.

Thanks

Martin

>
> According to man systemd.service:
>
>        ExecStartPre=, ExecStartPost=
>            Additional commands that are executed before or after the command
>            in ExecStart=, respectively. Syntax is the same as for ExecStart=,
>            except that multiple command lines are allowed and the commands are
>            executed one after the other, serially.
>
> (To be tested, I don't know much about systemd).
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
