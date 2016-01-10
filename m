From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2016 14:10:17 +0100
Subject: [Buildroot] [2/2,
 v2] wpa_supplicant: Have Hotspot 2.0 depend on nl80211
In-Reply-To: <55FAF6B5.5080903@green-communications.fr>
References: <1437119950-25976-2-git-send-email-nicolas.cavallari@green-communications.fr>
 <20150917153127.GA28715@t450s.lan>
 <55FAF6B5.5080903@green-communications.fr>
Message-ID: <20160110131016.GB3460@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2015-09-17 19:21 +0200, Nicolas Cavallari spake thusly:
> On 17/09/2015 17:31, Gary Bisson wrote:
> > Hi Nicolas,
> > 
> > On Fri, Jul 17, 2015 at 09:59:10AM +0200, Nicolas Cavallari wrote:
> >> Hotspot 2.0 uses ANQP whose implementation needs offchannel/
> >> remain-on-channel capabilities from the driver, which only exist in the
> >> nl80211 driver.  Compiling would work, but the feature would not work.
> >>
> >> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> >> ---
> >>
> >> v2: added signoff.
> >>  package/wpa_supplicant/Config.in | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> >> index 29dc4b9..22cf7f8 100644
> >> --- a/package/wpa_supplicant/Config.in
> >> +++ b/package/wpa_supplicant/Config.in
> >> @@ -41,6 +41,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_EAP
> >>  
> >>  config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
> >>  	bool "Enable HS20"
> >> +	depends on BR2_PACKAGE_WPA_SUPPLICANT_NL80211
> >>  	help
> >>  	  Enable Hotspot 2.0 and IEEE 802.11u interworking functionality.
> >>
> > 
> > First I'm not sure on the procedure to test the Hotspot 2.0 but I think
> > we should at least add a comment like:
> > 
> > comment "HS20 needs NL80211 support"
> > 	depends on !BR2_PACKAGE_WPA_SUPPLICANT_NL80211
> > 
> > Because right now if you unselect NL80211 WPA option the HS20 just
> > disappears.
> > 
> > Or maybe selecting NL80211 would be even better if absolutely required
> > at runtime.
> 
> 
> The more i think of it, the more I feel like the current behavior is
> acceptable as is and this patch is unnecessary.
> 
> Sure, using a vanilla wpa_supplicant, the features needed by Hotspot 2.0
> are only implemented by the nl80211 driver, but there may be other
> non-vanilla drivers added by out-of-tree patches which also implement it.
> 
> These patches may be in a buildroot global patch directory.  We
> shouldn't force nl80211 to be enabled to enable Hotspot 2.0 because this
> is the only possibility that we know.

So, given your feedback, I'm marking this patch as "Rejected" in our
Patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
