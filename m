From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 May 2018 08:20:20 +0200
Subject: [Buildroot] [PATCH 1/1] aircrack-ng: bump to version 1.2
In-Reply-To: <CAPi7W83Y8i1LxgX5Bwexb+qZpkr=9LjDrKqBjpVFtK81d2j5Vg@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 29 May 2018 23:56:32 +0200")
References: <20180529171409.8794-1-fontaine.fabrice@gmail.com>
 <87d0xe5k7x.fsf@dell.be.48ers.dk>
 <CAPi7W80yN0QhXSk8C7WGcr83hcdbebkWAJMGs6t6zTzcUpdLag@mail.gmail.com>
 <87efhu3zhq.fsf@dell.be.48ers.dk>
 <CAPi7W83Y8i1LxgX5Bwexb+qZpkr=9LjDrKqBjpVFtK81d2j5Vg@mail.gmail.com>
Message-ID: <8736y94qcb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> It is OK to handle those in followup patches, they were also
 >> unconditional in the earlier version.
 >> 
 > I already merged them in a single patch, I have also added the duma
 > optional dependency, see v2 but I can split them if you prefer in v3
 > tomorrow ;-)

It is probably ok in a single patch, thanks.

 >> > As a side note, unstable has been replaced by experimental since 1.2-rc2
 >> (
 >> > https://github.com/aircrack-ng/aircrack-ng/tree/1.2-rc2) so this is
 >> > currently "broken".
 >> 
 >> Gaah :/
 >> 
 > Do you want me to send a small patch to fix this on master?

Hmm, so this means that we have been building without the experimental
support for more than 1 year without anybody complaining? Then I would
prefer to keep it like that on master and maybe consider if we shouldn't
make it a Config.in option to enable or not for next?

 >> > Yes, ethtool is needed for airmon-ng, I will update my patch to manage
 >> it.
 >> 
 >> Great, thanks!
 >> 
 > After more investigations, it seems that ethtool is only a runtime
 > dependency of airmon-ng script which is always installed on target
 > (ETHTOOL_FOUND is only used in configure.ac).
 > So, we don't have to add a dependency to the ethtool package or to set the
 > ETHTOOL variable except to have the correct display in the configure log.

Ahh, ok.

-- 
Bye, Peter Korsgaard
