From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Jan 2013 09:01:47 +0100
Subject: [Buildroot] [git commit] openvpn: fix init script name
In-Reply-To: <CAJJ6jxukk2pGwL9Y3US7W0u488jKk52EgB4LJcnF4uUtQN66Lg@mail.gmail.com>
 (Steve Calfee's message of "Tue, 15 Jan 2013 15:22:28 -0800")
References: <20130115204907.6290399699@busybox.osuosl.org>
 <CAJJ6jxukk2pGwL9Y3US7W0u488jKk52EgB4LJcnF4uUtQN66Lg@mail.gmail.com>
Message-ID: <87mww9mu8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:

 Steve> On Tue, Jan 15, 2013 at 12:34 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=41fb3df4bd370b869fea3d0b38d01f596f86f721
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Our default (busybox) rc.S implementation requires init scripts to be
 >> named S??*, so rename the openvpn one to S60openvpn (E.G. after network).
 >> 

 Steve> What you are proposing would work, but we already have S60nfs in
 Steve> init.d. why not call your new start script S61? No big deal o does
 Steve> come after n, just asking.

I must say I didn't give the exact number much though. The numbers don't
have to be unique, and there's no dependencies between nfs and openvpn
(unless people want to run nfs over vpn, then the order should be
swapped).

You could argue that we should make the order somewhere between 45
(networkmanager/connman) and 50 (network servers) so you could make the
network servers listen on the vpn interface.

Comments anybody?

-- 
Bye, Peter Korsgaard
