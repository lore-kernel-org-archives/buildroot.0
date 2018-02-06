From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Feb 2018 01:00:43 +0100
Subject: [Buildroot] [RFCv3 13/15] core: change host RPATH handling
In-Reply-To: <20171229212034.416e8b23@windsurf.lan>
References: <20171201205352.24287-1-thomas.petazzoni@free-electrons.com>
 <20171201205352.24287-14-thomas.petazzoni@free-electrons.com>
 <20171229173118.GP3176@scaer> <20171229212034.416e8b23@windsurf.lan>
Message-ID: <CANQCQpbCOP0VA8t6+y-SN2xybhPivW93eQkR0JfNZws+mKseiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yann,

On Fri, Dec 29, 2017 at 9:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 29 Dec 2017 18:31:18 +0100, Yann E. MORIN wrote:
>
[snip]
>  2. Make the RPATH fixing logic smarter, and don't set a RPATH to
>     $ORIGIN/../lib if the program doesn't use a library that is in
>     HOST_DIR/lib. This is perhaps the most pretty solution.
>

What about the case of autotools tests which now don't have an
absolute path to the library?  I ran into an issue with this and the
host-libglibc2 testing for PCRE unicode.  The test worked fine once I
set the LD LIBRARY PATH.

Matt
