From: Jean-Baptiste Theou <jtheou@adeneo-embedded.us>
Date: Fri, 8 Aug 2014 09:16:52 -0700
Subject: [Buildroot] [PATCH 1/1] wpa-supplicant: Add NL80211 support
	option
In-Reply-To: <20140808104151.6c0e08fb@free-electrons.com>
References: <1407443308-20000-1-git-send-email-jtheou@adeneo-embedded.us>	<53E3E37C.3080605@zacarias.com.ar>	<53E3E711.7000505@adeneo-embedded.us>
 <20140808104151.6c0e08fb@free-electrons.com>
Message-ID: <53E4F7F4.7020901@adeneo-embedded.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

I agree about finding the balance.

Regarding this specific matter, having an visual indication of the 
support or not for the new standard of the wireless support seems an 
important issue for me.

Having an message inside the help doesn't seems a good solution for me, 
since it's not a "side" feature of wpa_supplicant. I would like the 
LIBNL to be selected by wpa_supplicant, but I understand you are not 
agree with this option

I sent an V2 version of my patch, with an better indication of the link 
between libnl and wpa_supplicant.

If it doesn't work for you, I will send an patch with an indication on 
the help message, but IMHO, at least, this suboption is mandatory.

Best regards
On 08/08/2014 01:41 AM, Thomas Petazzoni wrote:
> Dear Jean-Baptiste Theou,
>
> On Thu, 7 Aug 2014 13:52:33 -0700, Jean-Baptiste Theou wrote:
>
>> IMHO, wpa_supplicant should provide the support of NL80211 by default
>> ('depends on BR2_PACKAGE_LIBNL) since it's the new standard.
>>
>> I wasn't expected to have to select LIBNL manually.
> There is a balance to find between:
>
>   * Adding suboptions to package to enable support for optional features
>     (what you did).
>
>     Advantages : more obvious to the user, you can enable an optional
>     feature in package A, but not in package B (like you can use OpenSSL
>     support for your web server, but not necessarily for all other
>     packages in your system)
>
>     Drawbacks  : maintenance burden due to more Config.in options all
>     over the place.
>
>   * Make packages automatically enable optional features when the
>     necessary dependencies are available.
>
>     Advantages : less Config.in options to add everywhere.
>
>     Drawbacks : less obvious to the user, less flexible (enabling
>     OpenSSL makes it used in all packages that can optionally use it).
>
> You could propose a patch that extends the Config.in help text of
> wpa_supplicant to indicate this optional dependency, though we don't
> have a specific policy about this.
>
> Best regards,
>
> Thomas

-- 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140808/e6ead6ef/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.jpg
Type: image/jpeg
Size: 8458 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140808/e6ead6ef/attachment.jpg>
