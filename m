From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jun 2018 22:38:40 +0200
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <3047d59a-46aa-7678-32a1-971a2c07e0bb@mind.be> (Arnout
 Vandecappelle's message of "Wed, 20 Jun 2018 22:13:12 +0200")
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
 <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
 <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
 <272b0e3a-7f9b-f18d-a430-97553e260019@mind.be>
 <87zi0074sa.fsf@dell.be.48ers.dk>
 <909872342.136921.1528804345151.JavaMail.zimbra@datacom.com.br>
 <87in6o6u5n.fsf@dell.be.48ers.dk>
 <598a385a-5693-8fff-876c-550063645a50@mind.be>
 <87sh5s5aa4.fsf@dell.be.48ers.dk>
 <4be26713-53f3-2b36-f696-2b8fcf227ec3@mind.be>
 <87d0wlonmg.fsf@dell.be.48ers.dk>
 <3047d59a-46aa-7678-32a1-971a2c07e0bb@mind.be>
Message-ID: <87r2l1mbvz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Yes, so the only minor issue is that we need to have swapon/swapoff
 >> enabled in busybox-minimal.config even though it isn't useful just to
 >> not get an error message during bootup/shutdown.

 >  Well, it currently _is_ enabled in busybox-minimal.config... Admittedly, this
 > adds almost 1KB to the busybox size so perhaps it should be removed from
 > -minimal. But the we probably should also remove swapoff from inittab. Hell,
 > perhaps we should do that anyway, since doing swapoff for reboot is utterly
 > useless IMO.

Yes, I'm not sure what good swapoff would do just before rebooting,
except if you are using a swapfile and keeping it mounted would cause
umounting that filesystem to fail - But I've never used swap in a
Buildroot based project.

Notice that we will still get the error message from the swapon call
during startup if we drop the swapon applet.

Maybe we should just leave it as is.

-- 
Bye, Peter Korsgaard
