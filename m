From: Gary Coulbourne <bear@bears.org>
Date: Tue, 18 Dec 2012 10:38:21 -0500
Subject: [Buildroot] [PATCH] allow wpa_supplicant to run on the dbus
 using the 'new' api
In-Reply-To: <50D013FC.7040503@mind.be>
References: <CAEnpE0yDTQWpUf9ctGnfuSjX8PR0uX6UcxzvdV6D6uoxrAg1zQ@mail.gmail.com>
 <50D013FC.7040503@mind.be>
Message-ID: <50D08DED.6070109@bears.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle wrote:
>  Reviewing patches is more convenient for us if you do the following:
>
> * Send the patch in-line, preferably with git send-email, so we can 
> give comments in-line.
Sorry.  I'll keep that in mind next time.  I'm a long time hacker, but 
not a long-time contributor to open source.   :)
Thanks for being gentle with the criticism; I am still feeling my way 
around what is proper etiquette.

> * Keep the original author information - in this case, preferably by 
> keeping the original git authorship.
I was only able to find a partial copy of it via a google search, so I 
didn't have the original.  I didn't think about it at the time, but I
should have gone and looked in the mailing list archives.
>  I did a quick comparison with Sven's patch and I don't see why you 
> removed the BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD option.
Purely ignorance on my part -- I didn't realize that it was a both/and 
rather than an either/or for that option.

The reason I needed the fix is because connman is expecting the new API, 
and so fails to find wireless devices without wpa_supplicant using it.

The dbus fix I sent seperately makes dbus properly handle activation, so 
that it can start the wpa_supplicant. The test in the autoconf fails and 
says the fixes need to be done manually.  (I suspect it is because dbus 
is cross compiled, so the tests can't run on the host)

Peace,
Gary
