From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jan 2012 12:39:01 +0100
Subject: [Buildroot] [PATCH 1/6] dbus: make it easier to select an XML
	library (select rather than depends on)
In-Reply-To: <87fwewjeof.fsf@macbook.be.48ers.dk>
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
 <1327621292-13580-1-git-send-email-arnout@mind.be>
 <87fwewjeof.fsf@macbook.be.48ers.dk>
Message-ID: <201201311239.02217.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 31 January 2012 12:26:40 Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
>  Arnout> D-Bus requires an XML library, expat or libxml2.  There already
>  Arnout> is a choice between them in the config menu, but it requires
>  Arnout> the user to first select one of the libraries, and then select
>  Arnout> dbus.  With this patch, the choice automatically selects the
>  Arnout> XML library.  Note that this removes the automatic choice of
>  Arnout> libxml2 for dbus if libxml2 had already been selected, i.e. in
>  Arnout> that case both libxml2 and expat will be selected unless the
>  Arnout> user takes action.
> 
> Committed entire series, thanks.

 What does everybody think of the alternative (which Peter snipped here):

  An alternative would be to remove the choice completely, and to take the
  path of bluez-utils: select BR2_PACKAGE_EXPAT if !BR2_PACKAGE_DBUS_LIBXML2

 Advantage: no redundant expat library if the user has selected libxml2

 Disadvantage: what happens when the user has selected both libxml2 and 
expat?  (My answer: dbus will use libxml2)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
