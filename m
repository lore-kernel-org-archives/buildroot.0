From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 13 Jun 2013 10:55:56 -0300
Subject: [Buildroot] [PATCH] toolchain/uClibc: remove deprecated version
 0.9.31
In-Reply-To: <CAHt8ZCPEM0E87VSETkkb731SjiwoAcwBGY7D-0-UB5ua7fxgYw@mail.gmail.com>
References: <1371062793-27218-1-git-send-email-gustavo@zacarias.com.ar>
 <87k3lz2hcf.fsf@dell.be.48ers.dk>
 <CAHt8ZCPEM0E87VSETkkb731SjiwoAcwBGY7D-0-UB5ua7fxgYw@mail.gmail.com>
Message-ID: <51B9CF6C.5070402@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/13/2013 05:55 AM, Simon Dawson wrote:

> Ah. I need uClibc 0.9.31 to support a long-running avr32-based
> project. The only option available now in Buildroot is 0.9.33, which
> for some reason results in a system that has unusably poor performance
> compared to the 0.9.31-based build.
> 
> Is there any chance that uClibc 0.9.31 can be retained in Buildroot?
> I'm not clear what the rationale for removing it is/was...

Rationale was the usual deprecation period and later removal.
0.9.31 isn't getting any younger, and lacks modern syscalls/functions -
i personally haven't been testing packages with that version for a while.
I'm pretty sure many modern packages will fail without some agressive
patch backporting.
I'm considering (BIG "considering", it's a non-priority for me) working
on a systemd/udev bump which will require backports for 0.9.32.x/33.x
and looking out for 0.9.31.x is not on my list.
Really, Atmel has sunk the AP7 (1), i'm sorry about that, but it's the
way life is for whatever strategic and/or commercial reason.
If vanilla toolchain components were in working shape we wouldn't be
talking about this.

Can't you keep your project running with buildroot 2013.05 or some other
release?
Regards.

(1)
http://www.atmel.com/About/Quality/obsolescence/obsolete_items.aspx?searchText=ap7
