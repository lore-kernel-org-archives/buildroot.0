From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 28 Mar 2016 11:09:47 -0300
Subject: [Buildroot] [PATCH] redis: needs BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20160328151518.740749de@free-electrons.com>
References: <1459161143-4434-1-git-send-email-gustavo@zacarias.com.ar>
 <20160328151518.740749de@free-electrons.com>
Message-ID: <56F93B2B.5020807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/03/16 10:15, Thomas Petazzoni wrote:


> No, that's not good. BR2_TOOLCHAIN_HAS_SYNC_4 is, as its name suggest,
> for the __sync_*() built-ins, not the __atomic_*() ones. And the
> autobuild failure you point at indicates:
>
>    undefined reference to `__atomic_fetch_add_4'
>
> So what you need instead is:
>
>   1/ depends on BR2_TOOLCHAIN_HAS_ATOMIC in Config.in
>
>   2/ in the .mk file, pass -latomic if BR2_TOOLCHAIN_HAS_LIBATOMIC
>
> Thanks!
>
> Thomas

Hi.
True, i must not send patches made after waking up without having my 
coffee yet ;)
I'll send an update.
Regards.
