From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Nov 2014 15:33:10 +0100
Subject: [Buildroot] Source download overwrite
In-Reply-To: <CAOFH_kHZD-1aq31owR-D5GC_stX+zoGPiHyE1aovLGt6WZiOZw@mail.gmail.com>
References: <CAOFH_kEf-xur6tPGZb8rhA=211gK=Ww4tS0HRVpOe6KA-WEQMw@mail.gmail.com>
 <20141114141445.77f68c2d@free-electrons.com>
 <CAOFH_kHZD-1aq31owR-D5GC_stX+zoGPiHyE1aovLGt6WZiOZw@mail.gmail.com>
Message-ID: <20141114153310.354a7c24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mathieu Slabbinck,

On Fri, 14 Nov 2014 15:27:43 +0100, Mathieu Slabbinck wrote:
> Thomas,
> 
> thanks for pointing this out. Was looking for this kind of variable but
> didn't really find any docs about it.

I just checked, and at
http://buildroot.org/downloads/manual/manual.html#_infrastructure_for_packages_with_specific_build_systems,
under the section "16.5.2. generic-package reference", we do document
the EXTRA_DOWNLOADS variable:

"""
LIBFOO_EXTRA_DOWNLOADS lists a number of additional files that
Buildroot should download from LIBFOO_SITE in addition to the main
LIBFOO_SOURCE (which usually is a tarball). Buildroot will not do
anything with those additional files, except download files: it will be
up to the package recipe to use them from $(BR2_DL_DIR).
"""

Though I agree the manual is now very long, and it is easy to overlook
certain possibilities provided by Buildroot.

> Managed to get it working now.

Cool!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
