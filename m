From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 23:11:34 +0200
Subject: [Buildroot] [PATCH v1 3/4] qt5virtualkeyboard: fix legal-info
 with 5.6
In-Reply-To: <20180903123747.5234-4-gael.portay@savoirfairelinux.com>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
 <20180903123747.5234-4-gael.portay@savoirfairelinux.com>
Message-ID: <20180905231134.46b70011@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Mon,  3 Sep 2018 08:37:46 -0400, Ga?l PORTAY wrote:
> qt5virtualkeyboard 2.0 (shipped with Qt 5.6) doesn't contain any license
> files.

"any license files" is not true, because there's the lipi-toolkit
license file. However, there is no "main" license file with the GPLv3
text. I've fixed that up.

> Conditionally remove LICENSE.GPL3 from QT5VIRTUALKEYBOARD_LICENSE_FILES
> when Qt major version is set to 5.6.

Do we have any indication that the license is GPLv3 for the 2.0 version
of qt5virtualkeyboard ?

> Also, the lipi-toolkit has a different filename between both supported
> Qt major version (5.6 and latest).
> 
> Conditionally set the license in QT5VIRTUALKEYBOARD_LICENSE_FILES for
> lipi-toolkit according to the Qt major version used.

You forgot to add the hash for this license file.

I've fixed the commit log and added the hash for the 2.0 version of the
lipi-toolkit license file, and applied to master.

It would be nice to get some confirmation that the license is really
GPLv3.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
