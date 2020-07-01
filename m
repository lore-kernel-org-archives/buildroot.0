From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 1 Jul 2020 10:18:05 +0200
Subject: [Buildroot] NFS-root boot problem
In-Reply-To: <20200630194330.554815c0@windsurf>
References: <CAOiXNkBxAvePRB5zCCcPdyyBarM_4w_8hvc15nWhuK=15W6ptg@mail.gmail.com>
 <20200630194330.554815c0@windsurf>
Message-ID: <CAOiXNkCtGVcUc4LgGT_vT8rCCAq+q6SW_0z4K2PCSroTJt=2Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you very much for such quick response!

>> Starting network: ip: RTNETLINK answers: File exists
>> udhcpc: started, v1.31.1
>> [   19.379804] nfs: server 192.168.10.1 not responding, still trying
>> [   28.199820] nfs: server 192.168.10.1 not responding, still trying
>
> When your DHCP client in userspace runs, it turns the network interface
> down, and because you're doing root-over-NFS, this means you're cutting
> the tree branch on which you're sitting!
>
> Disable your DHCP client in userspace will solve your problem.

This is what I was suspecting. As mentioned in my original email I was trying
to disable it by removing everything related to eth0 from
/etc/network/interfaces. My mistake was that I was modifying the local file on
mmc instead of the one on NFS share :-) . Your comment pointed me to the right
direction and I found the mistake.

Thank you very much!
Andrey.
