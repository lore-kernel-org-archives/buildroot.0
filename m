From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Jan 2021 22:18:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: set
 OPENVPN_CPE_ID_VENDOR
In-Reply-To: <20210109211424.11091067@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 9 Jan 2021 21:14:24 +0100")
References: <20210108175300.537545-1-fontaine.fabrice@gmail.com>
 <874kjqxi53.fsf@dell.be.48ers.dk>
 <20210109211424.11091067@windsurf.home>
Message-ID: <87czydx10z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sat, 09 Jan 2021 16:08:24 +0100
 > Peter Korsgaard <peter@korsgaard.com> wrote:

 >> > +OPENVPN_CPE_ID_VENDOR = $(OPENVPN_NAME)  
 >> 
 >> I am not sure why we do this obfuscation with the _NAME variable instead
 >> of just "openvpn" -  But ok, a bunch of other packages do so as well.

 > Yes, it was done like this in the original patch from Matt, and I kept
 > it as-is, but I also wasn't too sure about it. But since nobody
 > complained when I posted the patch, I applied it as-is.

 > I definitely wouldn't oppose to changing this to not use the
 > <pkg>_NAME variable, as it find this indirection to not be very useful.

Ok, good. It may make sense to default _CPE_ID_VENDOR to $($(PKG)_NAME),
which is perhaps where this comes from?

-- 
Bye, Peter Korsgaard
