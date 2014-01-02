From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 10:10:42 +0100
Subject: [Buildroot] Packages that fail to be downloaded
In-Reply-To: <20140101044126.GF4263@tarshish>
References: <CAPFcPTJtoK3p0kseX-kQ7wNUyh5A+T7fwVETc89UcANmZZzJxw@mail.gmail.com>
 <20140101044126.GF4263@tarshish>
Message-ID: <20140102101042.14e1f6e3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 1 Jan 2014 06:41:26 +0200, Baruch Siach wrote:

> > >>> vim 699f8d8f096d Downloading
> > Reason :   ERROR 404: Not Found.
> > 
> > >>> >>> python-nfc 142 Downloading
> > Reason :   ERROR 404: Not Found.
> > 
> > >>> dvb-apps 83c746462ccb Downloading
> > Reason :   ERROR 404: Not Found.
> 
> I had no problem downloading any of the above. Do you have Mercurial and Bzr 
> installed on your system?

FWIW: whenever a package that needs to be downloaded from git,
mercurial, bzr, cvs or subversion is selected, then Buildroot
automatically checks whether the appropriate tools are installed, and
errors out at the beginning of the build with a clear error message.

See the DL_TOOLS_DEPENDENCIES variable filled in pkg-generic.mk, and
used in support/dependencies/dependencies.sh (the variable is named
DL_TOOLS here).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
