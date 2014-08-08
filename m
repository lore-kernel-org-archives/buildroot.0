From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Aug 2014 10:41:51 +0200
Subject: [Buildroot] [PATCH 1/1] wpa-supplicant: Add NL80211 support
 option
In-Reply-To: <53E3E711.7000505@adeneo-embedded.us>
References: <1407443308-20000-1-git-send-email-jtheou@adeneo-embedded.us>
 <53E3E37C.3080605@zacarias.com.ar>
 <53E3E711.7000505@adeneo-embedded.us>
Message-ID: <20140808104151.6c0e08fb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jean-Baptiste Theou,

On Thu, 7 Aug 2014 13:52:33 -0700, Jean-Baptiste Theou wrote:

> IMHO, wpa_supplicant should provide the support of NL80211 by default 
> ('depends on BR2_PACKAGE_LIBNL) since it's the new standard.
> 
> I wasn't expected to have to select LIBNL manually.

There is a balance to find between:

 * Adding suboptions to package to enable support for optional features
   (what you did).

   Advantages : more obvious to the user, you can enable an optional
   feature in package A, but not in package B (like you can use OpenSSL
   support for your web server, but not necessarily for all other
   packages in your system)

   Drawbacks  : maintenance burden due to more Config.in options all
   over the place.

 * Make packages automatically enable optional features when the
   necessary dependencies are available.

   Advantages : less Config.in options to add everywhere.

   Drawbacks : less obvious to the user, less flexible (enabling
   OpenSSL makes it used in all packages that can optionally use it).

You could propose a patch that extends the Config.in help text of
wpa_supplicant to indicate this optional dependency, though we don't
have a specific policy about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
