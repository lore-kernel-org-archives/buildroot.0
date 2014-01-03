From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:13:33 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: add systemd network.service
 unit
In-Reply-To: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
References: <1388713112-4686-1-git-send-email-vsergeev@kumunetworks.com>
Message-ID: <20140103201333.7f4edd47@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ivan Sergeev,

On Thu,  2 Jan 2014 17:38:32 -0800, Ivan Sergeev wrote:
> Add and enable a systemd unit file to bring up / down network with ifup /
> ifdown, analogous to the skeleton/etc/init.d/S40network init script.
> 
> Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
> ---
>  .../system/multi-user.target.wants/network.service  |  1 +
>  system/skeleton/etc/systemd/system/network.service  | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
>  create mode 120000 system/skeleton/etc/systemd/system/multi-user.target.wants/network.service
>  create mode 100644 system/skeleton/etc/systemd/system/network.service

We probably want to make that conditional on the type of init system
that is used, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
