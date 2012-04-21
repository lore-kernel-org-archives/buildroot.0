From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Apr 2012 15:34:23 +0200
Subject: [Buildroot] libusb-0.1.12
In-Reply-To: <4417289.Oi5fZHR2oB@desktop-reg>
References: <op.wcyu5ek6705kjs@rico> <op.wc0jpyoq705kjs@rico>
 <4417289.Oi5fZHR2oB@desktop-reg>
Message-ID: <201204211534.24156.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 19 April 2012 19:13:48 Ron Eggler wrote:
> Hi There,
> 
> I'm trying to assemble and compile a buildroot environment with libusb-0.1.12.
> On the build root server I find this file:
> http://sources.buildroot.net/libusb_0.1.12.orig.tar.gz
> but if I insert 0.1.12 and replace tar.bz2 with tar.gz in my 
> package/libusb/libusb.mk, on compilation the script keeps trying to download
> http://sources.buildroot.net//libusb-0.1.12.orig.tar.gz

 You have to set the LIBUSB_SOURCE variable to libusb_0.1.12.orig.tar.gz 
(with underscore instead of dash).

 You'll probably also want to add the line

LIBUSB_PATCH = libusb_0.1.12-10.diff.gz


 We originally pulled libusb from Debian; in Debian, the tar files are
always named <pkg>_<version>.orig.tar.gz, and they normally have an
accompanying <pkg>_<version>-<debversion>.diff.gz file containing the
Debian fixes.


 Regards,
 Arnout


> and apparently fails. I seem not to be able to find where that double slash 
> behind the domain is coming from.
> I'm a newbie with buildrootr and this really is my first time trying it out. 
> Some assistance would be appreciated.
> 
> Thank you very much!
> Ron
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
