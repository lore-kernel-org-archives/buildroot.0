From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 14:01:28 +0100
Subject: [Buildroot] [PATCH 1/6] dbus: make it easier to select an XML
	library (select rather than depends on)
In-Reply-To: <201201311239.02217.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 31 Jan 2012 12:39:01 +0100")
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
 <1327621292-13580-1-git-send-email-arnout@mind.be>
 <87fwewjeof.fsf@macbook.be.48ers.dk>
 <201201311239.02217.arnout@mind.be>
Message-ID: <87bopkjaaf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  What does everybody think of the alternative (which Peter
 Arnout>  snipped here):

 Arnout>   An alternative would be to remove the choice completely, and
 Arnout>   to take the path of bluez-utils: select BR2_PACKAGE_EXPAT if
 Arnout>   !BR2_PACKAGE_DBUS_LIBXML2

 Arnout>  Advantage: no redundant expat library if the user has selected
 Arnout>  libxml2

 Arnout>  Disadvantage: what happens when the user has selected both
 Arnout> libxml2 and expat?  (My answer: dbus will use libxml2)

Or alternatively drop the libxml2 option. It's deprecated upstream and
not commonly used:

https://bugs.freedesktop.org/show_bug.cgi?id=20253

-- 
Bye, Peter Korsgaard
