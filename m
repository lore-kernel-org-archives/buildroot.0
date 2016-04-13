From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 13 Apr 2016 07:57:12 +0300
Subject: [Buildroot] [PATCH v3] package/wpa_supplicant: Fix systemd
 service for new DBus bus name
In-Reply-To: <570D6D0F.8040303@mind.be>
References: <1460475306-29701-1-git-send-email-m.niestroj@grinn-global.com>
 <570D6D0F.8040303@mind.be>
Message-ID: <20160413045712.GC2269@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Apr 12, 2016 at 11:47:59PM +0200, Arnout Vandecappelle wrote:
> On 04/12/16 17:35, Marcin Niestroj wrote:
> >systemd service files were supplied with old DBus bus name. After
> >service activation systemd was waiting for appearance of specified bus
> >name to consider it started successfully. However, if wpa_supplicant was
> >compiled only with new dbus interface name, then systemd didn't notice
> >configured (old) DBus bus name appearance. In the end service was
> >considered malfunctioning and it was deactivated.
> >
> >Add upstream patch, which updates systemd service BusName property
> 
>  It's not an upstream patch, it's an upstreamable patch. At least, I can't
> find it in the upstream git repo nor on the mailing list. Did you even send
> it upstream already?

It's at http://lists.infradead.org/pipermail/hostap/2016-April/035599.html.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
