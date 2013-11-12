From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Nov 2013 13:17:57 +0100
Subject: [Buildroot] [PATCH] audiofile: needs dynamic library
In-Reply-To: <52821764.5060109@zacarias.com.ar>
References: <1384244924-31625-1-git-send-email-spdawson@gmail.com>
 <87ob5p4zix.fsf@dell.be.48ers.dk>
 <52821764.5060109@zacarias.com.ar>
Message-ID: <20131112131757.21f166df@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 12 Nov 2013 08:56:20 -0300, Gustavo Zacarias wrote:
> On 11/12/2013 08:42 AM, Peter Korsgaard wrote:
> > Looking at the build log, the only reason why it fails is that
> > libtool is acting up. It wants to link with libstdc++.so instead of
> > libstdc++.a.
> > 
> > A quick test shows that you can fix it by passing -static instead of
> > --static in LDFLAGS, but that effectively reverts 0a4bd19f4a136930c:
> > 
> > http://git.buildroot.net/buildroot/commit/?id=0a4bd19f4a136930c
> > 
> > Does anybody know what the right solution is?
> 
> I think this is related to the nettle failure i've mentioned, after
> the gcc conversion host-gcc-final isn't installing libstdc++.a, and
> after an extra look it isn't even building it because of
> --disable-static in the default CONFIGURE_CMDS.
> So it'll never find a libstdc++.a for the internal toolchain in
> staging. Regards.

I'll try to have a look at this issue tonight.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
