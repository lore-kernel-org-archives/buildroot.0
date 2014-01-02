From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 2 Jan 2014 13:45:06 +0100
Subject: [Buildroot] Packages that fail to be downloaded
In-Reply-To: <20140102101042.14e1f6e3@skate>
References: <CAPFcPTJtoK3p0kseX-kQ7wNUyh5A+T7fwVETc89UcANmZZzJxw@mail.gmail.com>
 <20140101044126.GF4263@tarshish> <20140102101042.14e1f6e3@skate>
Message-ID: <CAAXf6LXUhMTrky1a69cwGykaTOrwuQ3uwRpNw0NQ5_oz96Afew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 2, 2014 at 10:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Baruch Siach,
>
> On Wed, 1 Jan 2014 06:41:26 +0200, Baruch Siach wrote:
>
>> > >>> vim 699f8d8f096d Downloading
>> > Reason :   ERROR 404: Not Found.
>> >
>> > >>> >>> python-nfc 142 Downloading
>> > Reason :   ERROR 404: Not Found.
>> >
>> > >>> dvb-apps 83c746462ccb Downloading
>> > Reason :   ERROR 404: Not Found.
>>
>> I had no problem downloading any of the above. Do you have Mercurial and Bzr
>> installed on your system?
>
> FWIW: whenever a package that needs to be downloaded from git,
> mercurial, bzr, cvs or subversion is selected, then Buildroot
> automatically checks whether the appropriate tools are installed, and
> errors out at the beginning of the build with a clear error message.
>
> See the DL_TOOLS_DEPENDENCIES variable filled in pkg-generic.mk, and
> used in support/dependencies/dependencies.sh (the variable is named
> DL_TOOLS here).

True, but it could be that the tools are installed, but that there is
a firewall preventing the correct download. In this case, the vcs
methods will fail, and fall back to http to sources.buildroot.org.
But, this server does not contain python-nfc-142, vim-699f8d8f096d,
etc.

This scenario could explain Mau's problem.

Best regards,
Thomas
