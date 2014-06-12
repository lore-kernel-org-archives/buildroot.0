From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jun 2014 09:56:15 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <CAHkwnC_exQsbt7e9CJrzO6FA8HQGjJMWmVOkevUxjSYpHbdvJw@mail.gmail.com>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
 <20140610223358.69a70e6e@free-electrons.com>
 <CAHkwnC8N3v9ULfbqUeyjtCnb3Cpd6y=PPnwgjXBwSme6hywM5w@mail.gmail.com>
 <539884A4.5060705@mind.be>
 <CAHkwnC-dnWUJf=QR-6DEBwmkEoOoUuwDAWRj0EcQt5Cx8fOX0Q@mail.gmail.com>
 <CAHkwnC_exQsbt7e9CJrzO6FA8HQGjJMWmVOkevUxjSYpHbdvJw@mail.gmail.com>
Message-ID: <20140612095615.1a20e62e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 12 Jun 2014 09:32:39 +0200, Fabio Porcedda wrote:

> I think it's best to use PURGE_LOCALES_HOOK instead of TARGET_PURGE_LOCALES.

I think one of the concern with the hook thing was that the hooks would
be spread all over the Buildroot tree. To mitigate this concern, maybe
we could have a naming convention for those hooks that they should all
start with TARGET_FINALIZE_<something>, like
TARGET_FINALIZE_PURGE_LOCALES ?

This way, we can more easily grep through the tree those hooks?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
