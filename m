From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2011 18:26:46 +0200
Subject: [Buildroot] [PATCH v2 2/2] syslinux: add support for
	host-install
In-Reply-To: <20110831101935.03bda653@skate>
References: <1314770813-12307-1-git-send-email-arnout@mind.be>
 <1314770813-12307-2-git-send-email-arnout@mind.be>
 <20110831101935.03bda653@skate>
Message-ID: <201109011826.47154.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 31 August 2011 10:19:35, Thomas Petazzoni wrote:
> You don't have the $(eval $(call GENTARGETS,boot,syslinux,host)) line
> anymore, so the HOST_* variables are quite useless no ? This line was
> present in your previous posting.

 Oops!  Messed up rebase, and I didn't think it was necessary to test...  
Patch v3 coming up.

> Also can you comment how this host package is used ? It isn't part of
> the dependencies of any target package, so it doesn't seem to be used
> anywhere (except by manually running "make host-syslinux").

 Indeed, manually running "make host-syslinux" in the script that creates a 
USB image.  I guess the host-grub support that was submitted a couple of days 
ago had the same purpose.


> Not related to your patches directly, but could you elaborate a bit on
> how syslinux is used in practice by giving an example usage. This would
> explain a bit why a host version is needed, how to set up syslinux on
> the target, etc.

 To build a rescue disk that rewrites the disk of the target device.  The idea 
is that the whole thing can be sent as a zip file and the customer just has to 
unzip it to a USB stick and run syslinux (from Windows) and voila, he has a 
rescue USB stick.  The compiled syslinux.exe is taken from the tar file for 
that.  However, I also want to be able to create a rescue disk directly from 
buildroot, hence I want a working host-syslinux.

 FYI the make_rescue script is attached.

 
 Regards,
 Arnout



-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
A non-text attachment was scrubbed...
Name: make_rescue.sh
Type: application/x-shellscript
Size: 4508 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110901/69f22f82/attachment.bin>
