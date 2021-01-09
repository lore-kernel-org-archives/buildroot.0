From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Jan 2021 22:54:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: set
 OPENVPN_CPE_ID_VENDOR
In-Reply-To: <87czydx10z.fsf@dell.be.48ers.dk>
References: <20210108175300.537545-1-fontaine.fabrice@gmail.com>
 <874kjqxi53.fsf@dell.be.48ers.dk>
 <20210109211424.11091067@windsurf.home>
 <87czydx10z.fsf@dell.be.48ers.dk>
Message-ID: <20210109225408.5b8e15f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 09 Jan 2021 22:18:04 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Ok, good. It may make sense to default _CPE_ID_VENDOR to $($(PKG)_NAME),
> which is perhaps where this comes from?

CPE_ID_VENDOR already has a default, which is:

   $(2)_CPE_ID_VENDOR = $$($(2)_RAWNAME)_project

Indeed, for a large number of packages, the CPE vendor ID follows that
<foo>_project scheme.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
