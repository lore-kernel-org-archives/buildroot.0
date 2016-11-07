From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 Nov 2016 13:43:05 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: add mesh support (IEEE
 80211s)
In-Reply-To: <CAGm1_ks8gnc7PaeSd2C3_G5zkm3Ok+NTEJPJNpbtY7r0tSXb-g@mail.gmail.com>
References: <1478514205-29497-1-git-send-email-yegorslists@googlemail.com>
 <20161107105029.3inpdhl7cxowk2xo@sapphire.tkos.co.il>
 <CAGm1_ks8gnc7PaeSd2C3_G5zkm3Ok+NTEJPJNpbtY7r0tSXb-g@mail.gmail.com>
Message-ID: <20161107114304.r4nsnjulhfeijnam@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Mon, Nov 07, 2016 at 12:19:37PM +0100, Yegor Yefremov wrote:
> On Mon, Nov 7, 2016 at 11:50 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Mon, Nov 07, 2016 at 11:23:25AM +0100, yegorslists at googlemail.com 
> >  wrote:
> >> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
> >> +WPA_SUPPLICANT_CONFIG_SET += CONFIG_IEEE80211W \
> >> +                          CONFIG_MESH \
> >> +                          CONFIG_SAE
> >
> > CONFIG_IEEE80211W appears commented out in wpa_supplicant/defconfig, so maybe
> > use WPA_SUPPLICANT_CONFIG_ENABLE for that. Though I'm not sure about the
> > reason for the distinction between WPA_SUPPLICANT_CONFIG and
> > WPA_SUPPLICANT_CONFIG_SET. Isn't WPA_SUPPLICANT_CONFIG_SET enough for
> > everything?
> 
> Good catch.
> 
> WPA_SUPPLICANT_CONFIG_ENABLE ensures we don't have the same CONFIG
> option twice. Especially if it wasn't commented.

What is wrong with having the same CONFIG option twice?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
