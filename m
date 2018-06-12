From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 16:50:27 +0200
Subject: [Buildroot] swapoff, but no swapon in initab
In-Reply-To: <598a385a-5693-8fff-876c-550063645a50@mind.be> (Arnout
 Vandecappelle's message of "Tue, 12 Jun 2018 15:34:21 +0200")
References: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
 <8b5f67de-8fe7-ffd2-6c20-9662908947de@mind.be>
 <2139346916.1818743.1528457899819.JavaMail.zimbra@datacom.com.br>
 <272b0e3a-7f9b-f18d-a430-97553e260019@mind.be>
 <87zi0074sa.fsf@dell.be.48ers.dk>
 <909872342.136921.1528804345151.JavaMail.zimbra@datacom.com.br>
 <87in6o6u5n.fsf@dell.be.48ers.dk>
 <598a385a-5693-8fff-876c-550063645a50@mind.be>
Message-ID: <87sh5s5aa4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> But it does require people to add swapon/swapoff to their busybox config
 >> even if they aren't using swap, otherwise they would get error messages

 >  I think if people start customizing the busybox config and remove stuff from
 > it, then it's only reasonable that they also modify the default
 > inittab.

Correct.

 > Swaponand swapoff are both enabled in our busybox.config and busybox-minimal.config.

Hmm, does swap work on nommu? I would guess not. Looking at the kernel
option:

git grep -A3 'config SWAP' init/Kconfig
init/Kconfig:config SWAP
init/Kconfig-   bool "Support for paging of anonymous memory (swap)"
init/Kconfig-   depends on MMU && BLOCK
init/Kconfig-   default y

-- 
Bye, Peter Korsgaard
