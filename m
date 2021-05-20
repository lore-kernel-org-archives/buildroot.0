From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 20 May 2021 16:45:41 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/hostapd: fix build with
 CVE-2021-30004 changes
In-Reply-To: <20210520091505.GY2268078@scaer>
References: <20210520054853.15608-1-geomatsi@gmail.com>
 <20210520091505.GY2268078@scaer>
Message-ID: <YKZoBUKkVAo6TrS+@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

> > Commit d65586f45a22 ("package/hostapd: add upstream patch to fix
> > CVE-2021-30004") added security patch from hostapd upstream without
> > required ASN.1 helpers. Backport and adapt two commits from the
> > hostapd upstream to add missing headers and helpers.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/8f56cf556efbf447633ce873a21635f5adbc3cd2/
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> 
> Applied to master, thanks.
> 
> I've slightly adapated the commits, as we do nmot want the numbering in
> the patches, and I took the opportunity to slightly update the
> backports.
> 
> While at it, I noticed that wpa_supplicant is also impacted by
> CVE-2021-30004, and we have backported a few patches too:
> 
>     a8fbe67b9b16 package/wpa_supplicant: add upstream patch to fix CVE-2021-30004
> 
> And those patches also contain references to asn1_is_null(). I could not
> find any autobuilder issu about that, though... Could you check if we
> also need to carry similar patches for wpa_supplicant, please?

Yes, wpa_supplicant also fails in a similar configuration.
I will check the same fix  and send a patch.

Regards,
Sergey
