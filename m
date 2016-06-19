From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 12:38:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/kodi: Add suboption to control
	MySQL support
References: <1465938028-8149-1-git-send-email-bernd.kuhls@t-online.de>
 <20160615150946.7bef4659@free-electrons.com>
Message-ID: <XnsA62C808B614B1ID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20160615150946.7bef4659 at free-electrons.com: 

> Hello,
> 
> On Tue, 14 Jun 2016 23:00:27 +0200, Bernd Kuhls wrote:
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de> ---
>>  package/kodi/Config.in | 6 ++++++
>>  package/kodi/kodi.mk   | 2 +-
>>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> What is the motivation for switching from an "automatic" enabling to an
> explicit sub-option ?

Hi Thomas,

in a buildroot defconfig with mysql enabled I would like to be able to
build Kodi without mysql support because I do not need it during runtime. 

Kodi can store its internal databases not only localy using sqlite but also 
on a mysql server, this allows several local Kodi machines to use the same 
databases. Because I do only use one Kodi instance I do not need mysql 
support and would like to reduce build time when testing/installing Kodi 
while not touching other packages.

Regards, Bernd
