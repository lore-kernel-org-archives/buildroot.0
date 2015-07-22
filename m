From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 14:52:42 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <55AF91B5.8050806@zacarias.com.ar>
References: <20150722063018.99E6B101957@stock.ovh.net>
 <20150722094349.424e7a3e@free-electrons.com>
 <CA+BsyQ4knrWo+cA7_Og91Lg3_eq+qCRZij+N5bx6nccE+g91jg@mail.gmail.com>
 <CA+BsyQ4EGBokRsDhTuzfPRzgQ99sEr75SG3B8UxLJfX64fmtNQ@mail.gmail.com>
 <55AF8CF6.7080709@zacarias.com.ar>
 <20150722144535.103766f3@free-electrons.com>
 <55AF91B5.8050806@zacarias.com.ar>
Message-ID: <20150722145242.3d302237@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 22 Jul 2015 09:51:01 -0300, Gustavo Zacarias wrote:

> The problem is that packages might have a valid reason for not doing so, 
> like what glib explicitly says "lockless atomics", libatomic implements 
> the fallback via locks.
> One of the fallbacks is that performance will suffer possibly a lot 
> (depending on usage), there may be other drawbacks that i'm not aware of.

Right, but then until someone implements the SPARC specific code in
glib, using the fallback with locks is still better than nothing, no?
Even if performance suffers, they are still correct from a semantic
point of view.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
