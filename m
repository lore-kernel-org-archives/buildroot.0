From: Brunelle, Maxime <mbrunelle@distech-controls.com>
Date: Mon, 14 Dec 2020 16:00:50 +0000
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.66.3
In-Reply-To: <87v9d6yqqc.fsf@dell.be.48ers.dk>
References: <20201123213557.789056-1-mbrunelle@distech-controls.com>,
 <87v9d6yqqc.fsf@dell.be.48ers.dk>
Message-ID: <DM6PR01MB47159A7339605136395945DF8EC70@DM6PR01MB4715.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I can't say exactly when the issue appeared, but I noticed it in version 2020.05 which had glib 2.64.4 and nm 1.22.10, and version 2020.11.x still has it. Based on that, I would presume 2020.08.x has it too. The reference to the glib2 bug in my patch mentions the segfault started appearing in Ubuntu after updating to 2.63.x.

I don't know if you usually backport these changes that can affect other projects. However, I can tell you it was problematic for us because it caused nmcli to randomly crash ~5-10% of the time on various commands. We're now using a fork of 2020.11 with the patch applied without issue so far.

Regards,

Maxime Brunelle

From: Peter Korsgaard <jacmet@gmail.com> on behalf of Peter Korsgaard <peter@korsgaard.com>
Sent: December 13, 2020 04:55
To: Maxime Brunelle via buildroot <buildroot@busybox.net>
Cc: buildroot at buildroot.org <buildroot@buildroot.org>; Brunelle, Maxime <mbrunelle@distech-controls.com>; Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [PATCH 1/1] package/libglib2: bump version to 2.66.3 
?
>>>>> "Maxime" == Maxime Brunelle via buildroot <buildroot@busybox.net> writes:

?> Fixes https://urldefense.com/v3/__https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/524__;!!Po4YltK3bPMkYw!lFpMjOlcoFL-PFab2EVafw_mR_74rZRSOcwidP_vJwT2Azdtq7EIpk3tj7hxbrOpE-POLj-T$ 
?> package/libglib2 reference: https://urldefense.com/v3/__https://gitlab.gnome.org/GNOME/glib/-/issues/2091__;!!Po4YltK3bPMkYw!lFpMjOlcoFL-PFab2EVafw_mR_74rZRSOcwidP_vJwT2Azdtq7EIpk3tj7hxbrOpE7dzYXgD$ 

?> Signed-off-by: Maxime Brunelle <mbrunelle@distech-controls.com>

What should we do about the stable branches (2020.02.x / 2020.08.x /
2020.11.x)? When was this issue introduced?

I see:

2020.02.x: glib 2.62.5, nm 1.20.4
2020.08.x: glib 2.64.4, nm 1.22.10
2020.11.x: glib 2.64.4, nm 1.22.10

Master had the same glib / nm versions before this patch, so 2020.08.x /
2020.11.x are presumably also affected? What about 2020.02.x?

-- 
Bye, Peter Korsgaard
