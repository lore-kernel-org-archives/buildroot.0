From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 14:54:35 +0200
Subject: [Buildroot] [PATCH] system: move system.mk recipes inside the
 "target-finalize" rule
In-Reply-To: <CAHkwnC9RPGoZcp4bqffN5yCnWRJoeRxKFf72JmrwwAFr3jCnyg@mail.gmail.com>
References: <1402390367-25418-1-git-send-email-fabio.porcedda@gmail.com>
 <20140610223358.69a70e6e@free-electrons.com>
 <CAHkwnC8N3v9ULfbqUeyjtCnb3Cpd6y=PPnwgjXBwSme6hywM5w@mail.gmail.com>
 <20140611111844.2952ecac@free-electrons.com>
 <CAHkwnC9RPGoZcp4bqffN5yCnWRJoeRxKFf72JmrwwAFr3jCnyg@mail.gmail.com>
Message-ID: <20140611145435.40a60312@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed, 11 Jun 2014 11:21:38 +0200, Fabio Porcedda wrote:

> > Ah. I don't remember. Do you have a pointer to this discussion? I'd
> > like to see what were the arguments back then :-)
> 
> Sure: http://lists.busybox.net/pipermail/buildroot/2014-April/095052.html

Ok, I see now. The problem I have with the reasoning we used during
this discussion is that we only thought of those "global"
target-finalize tasks. But there are also plenty of more
package-specific ones, such as cleaning up unneeded Python things, or
unneeded Perl things. A hook mechanism would allow to move these
individual bits of logic down to the package needing them.

It's true that I admit it would be less easy to read and understand
that a complete list of all target-finalize tasks. So if Peter and
Arnout prefer the explicit list, I'm fine.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
