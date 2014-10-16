From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 11:08:34 +0200
Subject: [Buildroot] [PATCH v3] cppunit: Added package
In-Reply-To: <543F8710.4010708@mind.be>
References: <1413404565-16362-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <543F8710.4010708@mind.be>
Message-ID: <20141016110834.0410d5ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 16 Oct 2014 10:51:28 +0200, Arnout Vandecappelle wrote:

>  Unfortunately, it fails to build for platforms without shared libraries (e.g.
> blackfin FLAT). Probably easy to fix (seems to be a case of some forgotten
> #ifdef's), but it's easier to just add
> 
> 	depends on !BR2_BINFMT_FLAT

No: if it's really related to shared libraries, then it should be a
depends on !BR2_PREFER_STATIC_LIB.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
