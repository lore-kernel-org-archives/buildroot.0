From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:35:22 +0200
Subject: [Buildroot] [PATCH 3/5] gnupg2: new package
In-Reply-To: <5391EDAD.6070908@imgtec.com>
References: <1402062269-57018-1-git-send-email-Vincent.Riera@imgtec.com>
 <1402062269-57018-4-git-send-email-Vincent.Riera@imgtec.com>
 <k2096bxgbf.ln2@ID-313208.user.individual.net>
 <5391EDAD.6070908@imgtec.com>
Message-ID: <20140723233522.2cd7b0cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 6 Jun 2014 17:34:53 +0100, Vicente Olivert Riera wrote:

> So, we have three options here and we need to decide one of them:
> 
> Option 1: add the new pth package
>    pros: -there is no need to patch libpthsem
>    cons: -gnupg2 will not work with uclibc
> 
> Option 2: patch the libpthsem package
>    pros: -no need to add pth package
>          -gnupg2 will work with uclibc
>    cons: -we need to patch libpthsem to install compatibility stuff
> 
> Option 3: patch gnupg2 to use libpthsem in case of pth is missing
>    pros: -no need to add pth package
>          -gnupg2 will work with uclibc
>          -gnupg2 will work with both libpthsem and pth
>    cons: -patching gnupg2 source code should be accepted upstream
> 
> Let's vote! :)

Option 4: use the --enable-compat option of pthsem, which was precisely
designed to offer compatibility with pth, by installing pth.h and
pth-config. The only issue was the version check in gnupg2 not
accepting the not-completely-compatible behavior of pth-config from
pthsem. A one byte patch in gnupg2 solved the problem.

Therefore, this patch (gnupg2) has been applied, after changing the
dependency from pth to pthsem, removing the !uclibc dependency, and
fixing minor formatting issues in the .mk file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
