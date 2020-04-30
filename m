From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:39:51 +0200
Subject: [Buildroot] [PATCH 2/2] package/libmad: switch to debian to fix
 CVEs
In-Reply-To: <20200412101845.1013976-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 12 Apr 2020 12:18:45 +0200")
References: <20200412101845.1013976-1-fontaine.fabrice@gmail.com>
 <20200412101845.1013976-2-fontaine.fabrice@gmail.com>
Message-ID: <87lfmd5eqw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Upstream libmad is dead since 2004 so switch to debian package to get
 > two patches that fix the following CVEs:
 >  - CVE-2017-8372: The mad_layer_III function in layer3.c in Underbit MAD
 >    libmad 0.15.1b, if NDEBUG is omitted, allows remote attackers to
 >    cause a denial of service (assertion failure and application exit)
 >    via a crafted audio file.
 >  - CVE-2017-8373: The mad_layer_III function in layer3.c in Underbit MAD
 >    libmad 0.15.1b allows remote attackers to cause a denial of service
 >    (heap-based buffer overflow and application crash) or possibly have
 >    unspecified other impact via a crafted audio file.
 >  - CVE-2017-8374: The mad_bit_skip function in bit.c in Underbit MAD
 >    libmad 0.15.1b allows remote attackers to cause a denial of service
 >    (heap-based buffer over-read and application crash) via a crafted
 >    audio file.

 > Moreover:
 >  - Remove third patch (replaced by optimize.diff debian patch)
 >  - Remove fourth patch (same patch than
 >    Provide-Thumb-2-alternative-code-for-MAD_F_MLN.diff)
 >  - Remove fifth patch (same patch than libmad.thumb.diff)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
