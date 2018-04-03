From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Apr 2018 22:45:44 +0200
Subject: [Buildroot] [PATCH] [RFC] core/download: fix when the
 BR2_DL_DIR does not accept hardlinks
In-Reply-To: <20180403185456.29938-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 3 Apr 2018 20:54:56 +0200")
References: <20180403185456.29938-1-yann.morin.1998@free.fr>
Message-ID: <877epoow7b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When the BR2_DL_DIR is a mountpoint (presumably shared between various
 > machine, or mounted from the local host when running in a VM), it is
 > possible that it does not support hardlinks (e.g. samba, or the VMWare
 > VMFS, etc...).

 > If the hardlink fails, fallback to copying the file. As a last resort,
 > if that also fails, eventually fallback to doing the download.

 > Note: this means that the dl-wrapper is no longer atomic-safe: the code
 > suffers of a TOCTTOU condition: the file may be created in-between the
 > check and the moment we try to ln/cp it. Fortnately, the dl-wrapper is

s/Fortnately/Fortunately/

Committed, thanks.

-- 
Bye, Peter Korsgaard
