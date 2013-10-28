From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Oct 2013 13:46:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-10-24
In-Reply-To: <526E468C.7080008@zacarias.com.ar>
References: <20131025063005.51B7752C609@lolut.humanoidz.org>
 <526A26EB.7010804@mind.be> <20131025124746.0dbffd63@skate>
 <526A4D39.3040106@zacarias.com.ar> <20131026084741.5cab8678@skate>
 <526B9237.8030602@zacarias.com.ar>
 <526E468C.7080008@zacarias.com.ar>
Message-ID: <20131028134614.1d9a41e2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 28 Oct 2013 08:12:12 -0300, Gustavo Zacarias wrote:

> Hetzner reached back and their opinion is that they're firewall rules
> (because ping+trace work and http doesn't).
> I don't know their networking setup but it sounds reasonable (some odd
> balancer setup might show these symptoms).
> I guess the server admin is a bit aggresive on recurrent fetchers.
> Which moves me to the question, shouldn't the autobuilders just build?
> Checking the sources is great but it shouldn't be so aggresive on
> upstream servers, small projects might not be so happy about it.
> I know this has to be coded but maybe it's time.

Originally, the autobuilders had a cache on a per build thread basis
(my build server runs 3 builds in parallel). So it meant that a given
tarball what at the maximum downloaded three times.

However, since some time, I have changed this to remove 5 random
tarballs after each build, so that the cache gets progressively
refreshed, and the autobuilders also check upstream URLs. I've done
that after we had realized that several of our upstream URLs in
Buildroot were broken, which directly affects new users (but wasn't
visible in the autobuilders).

I can certainly adjust the policy by reducing the number of removed
tarballs to 1 or 2 after each build, for example. But I still believe
that doing this allows us to verify the upstream URLs thanks to the
autobuilders.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
