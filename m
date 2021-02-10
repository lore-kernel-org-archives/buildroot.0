From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Wed, 10 Feb 2021 10:05:21 +0100
Subject: [Buildroot] wpa_supplicant-2.9 - very large static binary size
In-Reply-To: <FAE5A8B9-E109-4BCE-B77C-BE519870E2D4@hxcore.ol>
References: <FAE5A8B9-E109-4BCE-B77C-BE519870E2D4@hxcore.ol>
Message-ID: <ef87e65d-9b0a-c193-7ff0-a6960c9fc14f@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/2021 20:55, Reuven Wachtfogel wrote:
> Enabling a static wpa_supplicant-2.9 without debug and without any 
> sub-options generates a 2MB+ binary.? From various sources, I was 
> expecting something closer to 600KB. Any ideas?

The 802.11 and Wi-Fi standard aren't getting any lighter...

Since wpa_supplicant 2.8, most features started being enabled by default 
because Linux distribution were tired to manually enable support for them.

Even my shared-libs wpa_supplicant binary is over 2M with a few options 
now...  but i can debloat it to 800K by toggling a few options.

I already have many local modifications to enable/disable things, maybe 
I should just improve/clean them and send it as a patch.  Testing the 
various configurations will take time, however.
