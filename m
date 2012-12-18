From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2012 18:06:10 +0100
Subject: [Buildroot] [PATCH] allow wpa_supplicant to run on the dbus
 using the 'new' api
In-Reply-To: <50D08DED.6070109@bears.org>
References: <CAEnpE0yDTQWpUf9ctGnfuSjX8PR0uX6UcxzvdV6D6uoxrAg1zQ@mail.gmail.com>
 <50D013FC.7040503@mind.be> <50D08DED.6070109@bears.org>
Message-ID: <50D0A282.8090405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/12/12 16:38, Gary Coulbourne wrote:
> Arnout Vandecappelle wrote:
>> Reviewing patches is more convenient for us if you do the following:
>>
>> * Send the patch in-line, preferably with git send-email, so we can
>> give comments in-line.
> Sorry. I'll keep that in mind next time. I'm a long time hacker, but not
> a long-time contributor to open source. :)
> Thanks for being gentle with the criticism; I am still feeling my way
> around what is proper etiquette.

  The gentle criticism is of course aimed at attracting more 
contributors... Did it work? :-)


>> * Keep the original author information - in this case, preferably by
>> keeping the original git authorship.
> I was only able to find a partial copy of it via a google search, so I
> didn't have the original.

  To find buildroot patches, patchwork is a good reference:
http://patchwork.ozlabs.org/project/buildroot/list/

> I didn't think about it at the time, but I
> should have gone and looked in the mailing list archives.
>> I did a quick comparison with Sven's patch and I don't see why you
>> removed the BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD option.
> Purely ignorance on my part -- I didn't realize that it was a both/and
> rather than an either/or for that option.
>
> The reason I needed the fix is because connman is expecting the new API,
> and so fails to find wireless devices without wpa_supplicant using it.

  I resent the original patches (I forgot to put you in CC, sorry). Can 
you check if they work as is, and correct them if needed?


> The dbus fix I sent seperately makes dbus properly handle activation, so
> that it can start the wpa_supplicant. The test in the autoconf fails and
> says the fixes need to be done manually. (I suspect it is because dbus is
> cross compiled, so the tests can't run on the host)

  I'll have a look at it next and give some more gentle criticism :-)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
