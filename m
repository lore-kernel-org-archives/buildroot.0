From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 30 Sep 2019 09:28:07 -0500
Subject: [Buildroot] [PATCH 1/3] package/hostapd: enable Linux ioctls
 for VLANs
In-Reply-To: <20190928173632.21119-2-geomatsi@gmail.com>
References: <20190928173632.21119-1-geomatsi@gmail.com>
 <20190928173632.21119-2-geomatsi@gmail.com>
Message-ID: <CANQCQpa9-gV_XQZi3xr77xH5BavD56Ee588zoMJ8HWuT800ocQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey,

On Sat, Sep 28, 2019 at 12:34 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hostapd v2.9 follows the approach taken by bridge-utils and attempts
> to use new bridge ioctls whenever possible. New bridge calls are
> enabled in hostapd build using NEED_LINUX_IOCTL configuration option.
> That switch is enabled for all the practical configurations excluding
> wired driver. However it is required to support dynamic VLANs in
> any configuration.
>
> Enable NEED_LINUX_IOCTL hostapd configuration option whenever
> dynamic VLANs support is requested in buildroot.
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/hostapd/hostapd.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 4a493cb9b2..0e5e5b2962 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -96,6 +96,7 @@ endif
>
>  ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_DYNAMIC),y)
>  HOSTAPD_CONFIG_ENABLE += CONFIG_FULL_DYNAMIC_VLAN
> +HOSTAPD_CONFIG_SET += NEED_LINUX_IOCTL

It seems interesting that CONFIG_FULL_DYNAMIC_VLAN doesn't set this
withing the Makefile of hostapd

>  endif
>
>  ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_NETLINK),y)
> --
> 2.23.0
>


-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
