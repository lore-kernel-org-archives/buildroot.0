From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 Jul 2012 23:20:50 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
	/etc/securetty
In-Reply-To: <20120714191530.539ca71c@skate>
References: <1342149545-10417-1-git-send-email-roylee17@gmail.com>
 <5001A4D3.1030802@mind.be> <20120714191530.539ca71c@skate>
Message-ID: <5001E2B2.6070509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/12 19:15, Thomas Petazzoni wrote:
> Le Sat, 14 Jul 2012 18:56:51 +0200,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
> >    But perhaps it's even better to remove securetty completely?  If it just
> > enumerates all possible ttys (even non-existent ones), it doesn't really add
> > security...  (Note: I haven't verified if util-linux's login allows root login if
> > /etc/securetty is missing.)
>
> Or we just add the tty that is selected to have the getty on (i.e the
> skeleton would no longer have a etc/securetty file, and it would only
> be created with one entry, as done by the patch being discussed).

  I wouldn't like that.  I often use the default skeleton but override e.g.
inittab in the post-build script.  I can't be bothered with setting
BR2_TARGET_GENERIC_GETTY_PORT to empty.  So the result is
that a /etc/securetty would be created which bears no relation with
the actual login ports defined in inittab...  And all this happens on the
sly, without any consent from the user or warning in the config menus.

  Bottom line: automatically adding BR2_TARGET_GENERIC_GETTY_PORT
to securetty is OK for me, but emptying it is not.

  BTW I can't think of many circumstances where securetty makes sense
on an embedded system to begin with: why would you allow shell login
on some port but not root login?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
